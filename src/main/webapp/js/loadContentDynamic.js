let quizContent = null;

const APP = {
   SW: null,
   cacheName: 'assetCache1',
   init() {
      APP.startCaching();
   },
   startCaching() {
      // open a cache and save some response
      caches.open(APP.cacheName).then((cache) => {
         console.log(`Cache ${APP.cacheName} opened`);
      })
   },
   async cacheResource(url, content) {
      const cache = await caches.open(APP.cacheName);
      const response = new Response(content, {
         headers: {'Content-Type': 'text/html'}
      });
      await cache.put(url, response);
      console.log(`Resource ${url} cached`);
   },
   async getCachedResource(url) {
      const cache = await caches.open(APP.cacheName);
      const cachedResponse = await cache.match(url);
      if(cachedResponse) {
         const cachedContent = await cachedResponse.text();
         console.log(`Resource ${url} retrieved from cache`);
         return cachedContent;
      }
      return null;
   }
}

// Doing caching to save the time needed to load the requested html content
document.addEventListener("DOMContentLoaded", APP.init());

// Add an event listener for each and every "See all" buttons
const seeAllButtons = document.querySelectorAll(".see-all-lessons");

seeAllButtons.forEach(button => {
   button.addEventListener("click", (event) => {
      event.preventDefault();
      const lessonFolderId = event.target.dataset.lessonFolder;

      // Apply smooth transition
      window.location.href = `${contextPath}/skillListening/` + lessonFolderId;
   })
})

if(pathname === `${contextPath}/skillListening`){
   demoLessonArray = JSON.parse(demoLessonArray);
   loadDemoLessons(demoLessonArray);
} else if(folderRegex.test(pathname)) {
   allLessonArray = JSON.parse(allLessonArray);
   loadAllLessons(allLessonArray);
} else if(lessonRegex.test(pathname)) {
   lessonDataArray = JSON.parse(lessonDataArray);
   loadData(lessonDataArray);
}

function loadDemoLessons(demoLessonArray) {
   let lessonFoldersList = document.getElementsByClassName("card");
   let tempMinicard = document.querySelector(".mini-card-link").cloneNode(true);
   Array.from(lessonFoldersList).forEach(lessonFolder => {
      let lessonFolderId = lessonFolder.dataset.lessonFolder;
      let demoLessons = demoLessonArray.filter(lesson => {
         return lesson["lessonFolderId"] === Number(lessonFolderId);
      });

      // Remove the previous element sibling of the button div, means removing the mini-card
      lessonFolder.querySelector(".button-div").previousElementSibling.remove();

      for (let lesson of demoLessons) {
         let tempMiniCard2 = tempMinicard.cloneNode(true);
         let encodedLesson = encodeURIComponent(lesson["lessonTitle"]);
         tempMiniCard2.querySelector("img").src = lesson["lessonAvatarURL"];
         tempMiniCard2.querySelector("h4").innerText = lesson["lessonTitle"];
         tempMiniCard2.href = [`${contextPath}`,"/skillListening/",lessonFolderId,"/",(lesson["lessonTitle"]).replaceAll(' ', '_')].join("");
         tempMiniCard2.addEventListener("click", (event) => {
            if(loggedInUser === "") {
               event.preventDefault();
               alert("You have to log in first");
               setTimeout(window.location.href = (`${contextPath}/login`), 1000);
            }
         });

         lessonFolder.querySelector(".button-div").insertAdjacentElement("beforebegin", tempMiniCard2);
      }
   })
}

function loadAllLessons(allLessonArray) {
   let displayCard = document.getElementsByClassName("card");
   let tempMinicard = document.querySelector(".mini-card-link").cloneNode(true);
   let curLessonFolderId = allLessonArray[0].lessonFolderId;
   let curLessonFolder = null;
   // Hide the lesson folders that are not clicked on
   Array.from(displayCard).forEach(lessonFolder => {
      if(Number(lessonFolder.dataset.lessonFolder) !== curLessonFolderId)
         lessonFolder.style.display = "none";
      else curLessonFolder = lessonFolder;
   })

   // Show all the lessons on the page (no pagination)
   curLessonFolder.querySelector(".button-div").previousElementSibling.remove();
   for (let lesson of allLessonArray) {
      let tempMiniCard2 = tempMinicard.cloneNode(true);
      tempMiniCard2.querySelector("img").src = lesson["lessonAvatarURL"];
      tempMiniCard2.querySelector("h4").innerText = lesson["lessonTitle"];
      tempMiniCard2.href = [`${contextPath}`,"/skillListening/",curLessonFolderId,"/",(lesson["lessonTitle"]).replaceAll(' ', '_')].join("");
      curLessonFolder.querySelector(".button-div").insertAdjacentElement("beforebegin", tempMiniCard2);
      tempMiniCard2.addEventListener("click", (event) => {
         if(loggedInUser === "") {
            event.preventDefault();
            alert("You have to log in first");
            setTimeout(window.location.href = (`${contextPath}/login`), 1000);
         }
      })
   }
   // Remove the "See all" button at last
   curLessonFolder.querySelector(".button-div").remove();
}

const getFileURL = "https://script.google.com/macros/s/AKfycbwa4DInef7rr-VndQ4ZvYmAxpnrYPlbKIJxXt0wj5ncEjCcPcNcw_kF6DiApfvV-6zj/exec";
// Store the original content to restore the state
const lessonDisplay = document.querySelector('.lesson-display');
let quizSection = document.querySelector('.quiz-section');

function loadAnimation() {
   const progressbar = document.querySelector(".progressbar");

   function enableProgressbar() {
      progressbar.setAttribute("role", "progressbar");
      progressbar.setAttribute("aria-live", "polite");
      runProgress();
   }
   
   function runProgress() {
      let currentvalue = 0;
      let targetValue = 100;
      const duration = 3000;
      
      function updateProgress() {
         const percentage = (currentvalue / targetValue) * 100;
         progressbar.setAttribute("aria-valuenow", currentvalue);
         progressbar.style.setProperty('--progress', percentage + "%");
         currentvalue++;
         
         if (currentvalue <= targetValue) {
            setTimeout(updateProgress, duration / targetValue);
         }
      }
      updateProgress();
   }
   
   enableProgressbar();
}
// Wait for all content loaded first before changing.

async function loadData(lessonData) {
   try {
      // Look in the cache first before doing the fetch to App Script for lesson content
      let lessonId = null;
      let quizId = null;
      let contentToFetch = {};

      lessonId = lessonData[0];
      contentToFetch.lessonId = lessonId;
      if(lessonData.length === 2) {
         quizId = lessonData[1];
         contentToFetch.quizId = quizId;
      }

      // Get from cache if resource is cached already and return early.
      const cachedContentLesson = await APP.getCachedResource(lessonId);
      let cachedContentQuiz = await APP.getCachedResource(quizId);
      cachedContentQuiz = JSON.parse(cachedContentQuiz);
      cachedContentQuiz = JSON.parse(cachedContentQuiz);

      if(cachedContentLesson !== null && cachedContentQuiz !== null) {
         loadPage([cachedContentLesson, cachedContentQuiz]);
         return;
      }

      if(cachedContentLesson !== null && cachedContentQuiz === null){
         loadPage([cachedContentLesson]);
         return;
      }

      // Only do loading animation when fetching from GG App Script.
      lessonDisplay.innerHTML = `
         <p class="progress">Please stand by</p>
         <div class="progressbar">
            <span>This <em>really awesome features</em> requires JS</span>
         </div>
      `;
      loadAnimation();

      let start = performance.now();
      const response = await fetch(getFileURL, {
         redirect: "follow",
         method: "POST",
         body: JSON.stringify(contentToFetch),
         headers: {
            "Content-Type": 'text/plain'
         }
      })

      let responseContent = await response.json(); // We get the array of objects here
      responseContent = JSON.parse(responseContent.content);
      if (responseContent.status === "success") {
         console.log(`%c Fetch succeed`, "color: green; background-color: blue");
         let time = (performance.now() - start) / 1000;
         console.log(`Time to fetch was ${time}`);
      } 
      let lessonContent = responseContent.fileContent;
      let quizContent = (responseContent.quizContent);

      // Do the cache if the requested content isn't available on the cache yet
      let contentArray = [];
      await APP.cacheResource(lessonId, lessonContent);
      // Lesson content is [0]
      contentArray.push(lessonContent);
      // Quiz is [1]
      if(quizContent !== null && quizContent !== undefined) {
         contentArray.push(JSON.parse(quizContent));
         // Use JSON.stringify since the quiz type is array.
         await APP.cacheResource(quizId, JSON.stringify(quizContent));
      }
      loadPage(contentArray);
   } catch (error) {
      console.error("Error fetching JSON:", error);
   }
}

function loadPage(contentArray) {
   if (contentArray.length === 1) {
      // Fade out the current content
      lessonDisplay.style.opacity = '0';
      lessonDisplay.style.transition = 'opacity 0.3s';
      // Render the content for the page
      setTimeout(() => {
         lessonDisplay.innerHTML = contentArray[0];
         // Fade in the new content
         lessonDisplay.style.opacity = '1';
      }, 300)
   } else if(contentArray.length === 2){
      // Fade out the current content
      lessonDisplay.style.opacity = '0';
      lessonDisplay.style.transition = 'opacity 0.3s';
      // Render the content for the page
      setTimeout(() => {
         lessonDisplay.innerHTML = contentArray[0];
         // Fade in the new content
         lessonDisplay.style.opacity = '1';
         quizSection.classList.remove("hide");
      }, 300)
      // Initialize the quizContent.
      quizContent = contentArray[1];
      runQuiz();
   }
}
// START OF THE DO QUIZ PART
const keyArray = [
   [1, "opt-a"],
   [2, "opt-b"],
   [3, "opt-c"],
   [4, "opt-d"]
];

// Function for handling quiz
function runQuiz (){
   const temp_question_card = document.querySelector(".temp-question-card").cloneNode(true);
   const quiz_section = document.querySelector(".quiz-section");
   const doquiz_section = document.querySelector(".doquiz-section");

   const optionMap = new Map(keyArray);
   const show_limit = 10;
   let curPage = 1;

   // Set the total number of quiz pages to display
   let totalPageNum = -1;
   let firstPageLoaded = false;
   let answerMap = new Map();
   let answeredCount = 0;
   let startTime = 0;
   let endTime = 0;
   let reviewQuiz = false;
   let correctAnswerCount = 0;
   let totalTime = "";

   // Set the quizFocus variable to check if user is still doing the quiz
   let isQuizFocused = false;

   // Initialize questionMap globally for easier access.
   let questionMap = new Map();
   let questionList = null;

   let startQuizButton = document.querySelector(".startquiz-btn");
   startQuizButton.addEventListener("click", () => startQuiz());
   const welcomeScreen = (questionNum) => {
      document.querySelector(".question-num").innerText = questionNum;
   }
   const startQuiz = (redoQuiz) => {
      document.querySelector(".startquiz-section").classList.add("hide");
      document.querySelector(".doquiz-section").classList.remove("hide");
      setTotalCount(questionList.length);
      // Reset the count of answered to 0.
      if(reviewQuiz) {
         document.querySelector(".submit-quiz").innerText = "Go back";
      } else {
         document.querySelector(".submit-quiz").innerText = "Submit";
      }
      answeredCount = 0;
      setAnsweredCount(answeredCount);
      generateNumberRow(questionList, curPage, show_limit, redoQuiz);
      displayCurQuestion(1);
      startTime = Date.now();
      console.log(startTime);
   }

   const displayCurQuestion = (curIndex) => {
      let curRow = document.querySelector(".question-numbers-row");
      // Clear the inside of the question card in DOM
      let question_card = temp_question_card.cloneNode(true);
      question_card.classList.replace("temp-question-card", "question-card");
      doquiz_section.removeChild(document.querySelector(".number-row").nextElementSibling)

      let full_question = questionList.find(question => question.questionId === curIndex);

      // Fill in the question
      question_card.querySelector("ul").innerHTML = "";
      question_card.getElementsByTagName("p")[0].innerText = full_question["question"];
      // Populate the options
      for (let i = 0; i < full_question["options"].length; i++) {
         let option_obj = full_question["options"][i];
         // Allow deep clone by setting deep clone to true
         let li = document.createElement("li");
         // Create and append the input element
         const input = document.createElement("input");
         input.type = "checkbox";
         input.name = "answer";
         input.id = `${optionMap.get(i + 1)}`;
         // Check if the option was previously chosen in the option array
         if (questionMap.get(curIndex).chosenOptions.includes(input.id) && reviewQuiz === false) {
            input.checked = true;
         } else if(questionMap.get(curIndex).chosenOptions.includes(input.id) && reviewQuiz === true) {
            input.disabled = true;
            input.checked = true;
            if(!answerMap.get(curIndex).includes(input.id))
               input.classList.add("wrong");
         } else if(reviewQuiz === true) {
            input.disabled = true;
            if(answerMap.get(curIndex).includes(input.id)) {
               input.checked = true;
            }
         }

         // Listen for when user check or decheck an answer checkbox
         if(reviewQuiz === false) {
            input.addEventListener("change", () => {
               let curPosition = (curIndex % show_limit === 0 ? show_limit - 1 : curIndex % show_limit - 1);
               let chosenOptions = questionMap.get(curIndex).chosenOptions;
               if (input.checked) {
                  chosenOptions.push(input.id);
                  curRow.children.item(curPosition).classList.add("answered");

                  // Check if the question has been answered with 1 answer yet on tick
                  if (questionMap.get(curIndex).chosenOptions.length === 1) {
                     curRow.children.item(curPosition).classList.add("answered");
                     questionMap.get(curIndex).isAnswered = true;
                     answeredCount++;
                     setAnsweredCount(answeredCount);
                  }
               } else {
                  let index = chosenOptions.indexOf(input.id);
                  if (index > -1) {
                     chosenOptions.splice(index, 1);
                  }

                  if (questionMap.get(curIndex).chosenOptions.length < 1) {
                     curRow.children.item(curPosition).classList.remove("answered");
                     questionMap.get(curIndex).isAnswered = false;
                     answeredCount--;
                     setAnsweredCount(answeredCount);
                  }
               }
               questionMap.set(curIndex, { ...questionMap.get(curIndex), chosenOptions });
            })
         }
         li.appendChild(input);

         // Create and append the label element
         const label = document.createElement("label");
         label.htmlFor = `${optionMap.get(i + 1)}`;
         li.appendChild(label);

         // Create and append the span element
         const span = document.createElement("span");
         span.innerText = `${option_obj["optionText"]}`;
         label.appendChild(span);

         question_card.querySelector("ul").appendChild(li);
      }

      if (question_card.classList.contains("hide")) {
         question_card.classList.remove("hide")
      }
      document.querySelector(".number-row").insertAdjacentElement("afterend", question_card);
   }

   const pageNavigate = (direction) => {
      // Get the current page
      switch (direction) {
         case 'LEFT':
            if (curPage === 1) return;
            generateNumberRow(questionList, curPage - 1, show_limit);
            curPage--;
            break;
         case 'RIGHT':
            if (curPage === totalPageNum) return;
            generateNumberRow(questionList, curPage + 1, show_limit);
            curPage++;
            break;
         default:
            break;
      }
   }

   const navigate = (direction) => {
      // Get the current question
      let curQuestion = 0;
      questionMap.forEach((value, key) => {
         if (value.isCurrent) curQuestion = key;
      });

      let curRow = document.querySelector(".question-numbers-row");
      let [startIndex, endIndex] = [
         Number(curRow.children.item(0).innerText),
         Number(curRow.children.item(curRow.children.length - 1).innerText)
      ];
      let curPosition = (curQuestion - 1) % show_limit;

      switch (direction) {
         case 'LEFT':
            if (curPosition > 0) { // Moving within the current page
               curRow.children.item(curPosition).classList.remove("cur-question");
               curRow.children.item(curPosition - 1).classList.add("cur-question");
               questionMap.set(curQuestion, { ...questionMap.get(curQuestion), isCurrent: false });
               questionMap.set(curQuestion - 1, { ...questionMap.get(curQuestion - 1), isCurrent: true });
               displayCurQuestion(curQuestion - 1);
            } else if (curPosition === 0 && curPage > 1) { // Moving to the previous page
               curRow.children.item(curPosition).classList.remove("cur-question");
               questionMap.set(curQuestion, { ...questionMap.get(curQuestion), isCurrent: false });
               questionMap.set(curQuestion - 1, { ...questionMap.get(curQuestion - 1), isCurrent: true });
               generateNumberRow(questionList, --curPage, show_limit);
               curRow = document.querySelector(".question-numbers-row");
               curRow.children.item(show_limit - 1).classList.add("cur-question");
               displayCurQuestion(curQuestion - 1);
            }
            break;
         case 'RIGHT':
            if (curPosition < show_limit - 1 && curPosition < endIndex - startIndex) { // Moving within the current page
               curRow.children.item(curPosition).classList.remove("cur-question");
               curRow.children.item(curPosition + 1).classList.add("cur-question");
               questionMap.set(curQuestion, { ...questionMap.get(curQuestion), isCurrent: false });
               questionMap.set(curQuestion + 1, { ...questionMap.get(curQuestion + 1), isCurrent: true });
               displayCurQuestion(curQuestion + 1);
            } else if (curPosition === show_limit - 1 && curPage < totalPageNum) { // Moving to the next page
               curRow.children.item(curPosition).classList.remove("cur-question");
               questionMap.set(curQuestion, { ...questionMap.get(curQuestion), isCurrent: false });
               questionMap.set(curQuestion + 1, { ...questionMap.get(curQuestion + 1), isCurrent: true });
               generateNumberRow(questionList, ++curPage, show_limit);
               curRow = document.querySelector(".question-numbers-row");
               curRow.children.item(0).classList.add("cur-question");
               displayCurQuestion(curQuestion + 1);
            }
            break;
         default:
            break;
      }
   };

   const generateNumberRow = (data, page, show_limit, redoQuiz) => {
      let questionNumberRow = document.querySelector(".question-numbers-row");
      // Clear the inside of the questionNumberRow
      questionNumberRow.innerHTML = "";
      let startIndex = (page - 1) * show_limit;
      // Use this code for a while loop
      // let endIndex = (startIndex + show_limit - 1) > data.length ?
      //    Math.floor(data.length / show_limit) : show_limit;
      let endIndex = Math.min(startIndex + show_limit, data.length);
      for (let i = startIndex; i < endIndex; i++) {
         let question_li = document.createElement("li");
         question_li.appendChild(document.createElement("span"))
         question_li.querySelector("span").innerHTML = i + 1;
         questionNumberRow.appendChild(question_li);
      };

      // Set the questionMap to the new map when user starts quiz or redo the quiz.
      if (firstPageLoaded === false || redoQuiz === true) {
         questionMap = new Map(
             data.map(obj => {
                return [obj.questionId, { isCurrent: false, isAnswered: false, chosenOptions: [] }];
             })
         )
         questionMap.get(1).isCurrent = true;
         questionNumberRow.children.item(0).classList.add("cur-question");
         firstPageLoaded = !firstPageLoaded; // Turns it into true so that the questionMap won't be regenerated again.
      }

      for (let numberNode of questionNumberRow.children) {
         if (questionMap.get(Number(numberNode.innerText)).isAnswered) {
            numberNode.classList.add("answered");
         }
         if (questionMap.get(Number(numberNode.innerText)).isCurrent) {
            numberNode.classList.add("cur-question");
         }
         numberNode.addEventListener("click", () => {
            let clickedIndex = Number(numberNode.innerText);

            questionMap.forEach((value, key) => {
               if (value.isCurrent === true) {
                  value.isCurrent = false;
                  // Get the 0-based index by getting the remainder of the clickIndex with the row
                  let newKey = 0;
                  if (key % show_limit === 0) newKey = show_limit - 1;
                  else if (key % show_limit > 0) newKey = key % show_limit - 1;

                  if (startIndex + 1 <= key && key <= endIndex)
                     questionNumberRow.children.item(newKey).classList.remove("cur-question")
               }
            });

            questionMap.get(clickedIndex).isCurrent = true;
            numberNode.classList.add("cur-question");
            displayCurQuestion(clickedIndex);
         })
      }
   }

   // Try to fetch the question set data. This is all the start of the quiz!
   // fetch(`${comparePaths(curPath, targetPath)}`)
   //     .then(response => response.json())
   //     .then(data => {
   //         setQuestionList(data);
   //         welcomeScreen(data.length);
   //     });
   // THE QUIZ STARTS HERE
   if(quizContent !== null){
      setQuestionList(quizContent);
      welcomeScreen(quizContent.length);
   }

   const direction = createEnum(['LEFT', 'RIGHT']);

   let navigateLeftButton = document.querySelector(".prev-btn");
   let navigateRightButton = document.querySelector(".next-btn");
   navigateLeftButton.addEventListener("click", () => navigate(direction.LEFT));
   navigateRightButton.addEventListener("click", () => navigate(direction.RIGHT));

   let navigateLeftPage = document.querySelector('#prev-navigation');
   let navigateRightPage = document.querySelector('#next-navigation');
   navigateLeftPage.addEventListener("click", () => pageNavigate(direction.LEFT));
   navigateRightPage.addEventListener("click", () => pageNavigate(direction.RIGHT));

   function createEnum(values) {
      const enumObject = {};
      for (const val of values) {
         enumObject[val] = val;
      }
      return Object.freeze(enumObject);
   }

   function setQuestionList(data) {
      questionList = data;
      totalPageNum = Math.ceil(data.length / show_limit);
   }

   function setTotalCount(questionNum) {
      document.querySelector(".total-count").innerText = Number(questionNum);
   }

   function setAnsweredCount(number) {
      document.querySelector(".answered-count").innerText = number;
   }

   // Focus on quiz-section to bind the left and right key to navigation
   quiz_section.addEventListener("click", () => {
      if (!isQuizFocused) {
         quizFocus(true);
      }
   });

   document.addEventListener("click", (event) => {
      if (isQuizFocused && !quiz_section.contains(event.target)) {
         quizFocus(false);
         isQuizFocused = false;
      }
   })

   function handleKeyDown(e) {
      console.log(e.key);
      switch (e.key) {
         case "ArrowLeft":
            if (isQuizFocused) {
               // Navigate left and scroll to quiz section
               navigateLeftButton.click();
               quiz_section.scrollIntoView({ behavior: "smooth", block: "center" });
            }
            break;
         case "ArrowRight":
            if (isQuizFocused) {
               // Navigate right and scroll to quiz section
               navigateRightButton.click();
               quiz_section.scrollIntoView({ behavior: "smooth", block: "center" });
            }
            break;
         default:
            break;
      }
   }

   //  Add navigation with left and right arrow keys for user accessbility.
   function quizFocus(focus) {
      isQuizFocused = focus;
      if (focus) {
         // Remove any existing keydown listeners to avoid duplicates
         document.removeEventListener("keydown", handleKeyDown);
         // Add the keydown listener
         document.addEventListener("keydown", handleKeyDown);
      } else {
         // Optionally remove the listener when focus is lost
         document.removeEventListener("keydown", handleKeyDown);
      }
   }

   // Handle the submit event here
   // Compare the answered list vs the correct answers list from the quiz.
   function shallowCompare(arrA, arrB) {
      if (arrA.length !== arrB.length) return false;
      for (let i = 0; i < arrA.length; i++) {
         if (arrA[i] !== arrB[i]) return false;
      }
      return true;
   }

   function calculateFinishTime(millis) {
      const minutes = Math.floor(millis / 60000);
      const seconds = Math.floor((millis % 60000) / 1000);

      // Ensure seconds are formatted with leading zero if less than 10
      const secondsString = seconds < 10 ? "0" + seconds : seconds.toString();

      return minutes + ":" + secondsString;
   }

   let submitButton = document.querySelector(".submit-quiz");
   submitButton.addEventListener("click", () => {
      let resultSection = document.querySelector(".result-section");
      let doQuizSection = document.querySelector(".doquiz-section");
      doQuizSection.classList.add("hide");
      resultSection.classList.remove("hide");

      if(reviewQuiz === false) {
         endTime = Date.now();
         console.log(endTime);
         console.log("%cSubmit button clicked!", "color: limegreen");

         if (answerMap.size === 0) {
            // Setting up a map of question and its correct answer.
            questionList.forEach((question) => {
               let correctOption = question.options.filter(opt => opt.isCorrect)
                   .map(opt => opt.optionId);
               let correctOptionString = correctOption.map(corOpt => optionMap.get(corOpt));
               answerMap.set(question["questionId"], correctOptionString);
            });
            // console.table(Array.from(answerMap, ([key,  value]) => ({ key, value })));
         }

         correctAnswerCount = 0;
         for (let i = 1; i <= answerMap.size; i++) {
            if (shallowCompare(answerMap.get(i), questionMap.get(i).chosenOptions))
               correctAnswerCount++;
         }
         resultSection.querySelector(".final-time").innerText = `${calculateFinishTime(endTime - startTime)}`;
         totalTime = `${calculateFinishTime(endTime - startTime)}`;
         // `Congratulation, you got ${correctAnswerCount * 10}  out of ${answerMap.size * 10}`);
      }

      resultSection.querySelector(".final-score").innerText = `${correctAnswerCount * 10}/${answerMap.size * 10}`;
      resultSection.querySelector(".final-time").innerText = totalTime;

      //Redo and review quiz function
      let redoButton = document.querySelector(".redo-quiz");
      let reviewButton = document.querySelector(".review-quiz");
      redoButton.addEventListener("click", () => {
         reviewQuiz = false;
         resultSection.classList.add("hide");
         document.querySelector(".startquiz-section").classList.remove("hide");
         startQuiz(true);
      });

      reviewButton.addEventListener("click", () => {
         reviewQuiz = true;
         resultSection.classList.add("hide");
         document.querySelector(".doquiz-section").classList.remove("hide");
         // This is review not redo, so we pass the redo flag as false
         startQuiz(false);
         // Experimental.
      })
   });
}
