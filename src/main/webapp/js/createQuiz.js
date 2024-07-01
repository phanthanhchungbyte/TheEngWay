const addQuestionButton = document.querySelector(".add");
const deleteSingleButton = document.querySelector(".delete-single");
const deleteAllButton = document.querySelector(".deleteall");
const updateQuestionButton = document.querySelector(".update-question");
const navigateRight = document.querySelector(".right-button");
const navigateLeft = document.querySelector(".left-button");
const questionNavigator = document.querySelector(".navigator-input");
const quizAvaToggle = document.querySelector("#quizava_checkbox");
const quizElements = document.getElementsByClassName("quiz");

// All the questions is stored here
let quizQuestions = [];

let options = [];
let questionInput;
let currentQuestionId;
let curMax = 1;
let currentQuestionIdShow = Number(document.getElementById("curQuestionId").innerText);
updateCurMaxIndicator(curMax);
let questionNum = 1;

let quizAdded = quizAvaToggle.checked;
// Let the user choose to add quiz or not

quizToggleShow(quizAdded);

function quizToggle(checkbox) {
   quizAdded = checkbox.checked;
   quizToggleShow(quizAdded);
}

function quizToggleShow(quizAdded) {
   if(quizAdded) {
      for(let element of quizElements) {
         element.style.display = 'block';
      }
   } else if(!quizAdded) {
      for(let element of quizElements) {
         element.style.display = 'none';
      }
   }
}

// Show the saved question if it is avaialable in the quiz created
if (quizQuestions[currentQuestionIdShow]) {
   showSavedQuestion(currentQuestionIdShow);
}

addQuestionButton.addEventListener("click", (event) => {
   event.preventDefault();
   curMax++;
   updateCurMaxIndicator(curMax);
   // console.log("Add question clicked");
})

deleteAllButton.addEventListener("click", (event) => {
   event.preventDefault();
   curMax = 1;
   updateCurMaxIndicator(curMax);
   // reset the quizQuestions array.
   quizQuestions.length = 0;
   document.getElementById("curQuestionId").innerHTML = (curMax);
   clearAllInput();
   // console.log("Delete all button clicked");
})

deleteSingleButton.addEventListener("click", (event) => {
   event.preventDefault();
   currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
   deleteSingleQuestion(currentQuestionId);
})

updateQuestionButton.addEventListener("click", (event) => {
   event.preventDefault();
   currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
   saveQuestion(currentQuestionId);
})

navigateLeft.addEventListener("click", () => {
   currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
   goLeft(currentQuestionId);
})

navigateRight.addEventListener("click", () => {
   currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
   goRight(currentQuestionId);
})

// To navigate to the desired question by changing real time
questionNavigator.addEventListener("keydown", (event) => {
   if(event.key === "Enter") {
      event.preventDefault();
      const questionNumber = parseInt(questionNavigator.value, 10);
      if(!isNaN(questionNumber) && questionNumber >= 1 && questionNumber <= curMax) {
         document.getElementById("curQuestionId").innerText = (questionNumber);
         showSavedQuestion(questionNumber);
      }
   }
})

function deleteSingleQuestion(currentQuestionId) {
   quizQuestions = quizQuestions.filter((element) => {
      return element.questionId !== currentQuestionId;
   });
   quizQuestions.map((element) => {
      if(element.questionId > currentQuestionId)
         element.questionId--;
   });
   
   // dividing into cases to show the remaining questions after deletion
   if(currentQuestionId === curMax && curMax > 1) {
      // Show the question immediately before it
      showSavedQuestion(curMax - 1);
      document.getElementById("curQuestionId").innerHTML = (curMax - 1);
      // Decrement the curMax
      curMax--;
      updateCurMaxIndicator(curMax);
   } else if(currentQuestionId < curMax && curMax > 1) {
      curMax--;
      updateCurMaxIndicator(curMax);
      // Show the same question with same Id before it
      showSavedQuestion(currentQuestionId);
   } else if(currentQuestionId === curMax && curMax === 1) {
      clearAllInput();
      // Clear the questions array.
      quizQuestions.length = 0;
   }
} 

function showSavedQuestion(currentQuestionId) {
   let currentQuestion = quizQuestions[currentQuestionId - 1];

   // Check if currentQuestion is undefined.
   if (!currentQuestion) {
      clearAllInput();
      return;
   }

   // Fade out the text
   questionInput.classList.add('fade-out');
   Array.from(document.getElementsByClassName("option")).forEach(option => {
      option.classList.add("fade-out");
   });

   setTimeout(() => {
      questionInput.value = currentQuestion.question;
      options = document.getElementsByClassName("option");
      for (let i = 0; i < currentQuestion.options.length; i++) {
         options[i].value = currentQuestion.options[i].optionText;
         if (currentQuestion.options[i].isCorrect) {
            options[i].nextElementSibling.checked = true;
         } else {
            options[i].nextElementSibling.checked = false;
         }
      }

      // Fade in the updated text
      questionInput.classList.remove('fade-out');
      questionInput.classList.add('fade-in');
      Array.from(document.getElementsByClassName("option")).forEach(option => {
         option.classList.remove('fade-out');
         option.classList.add('fade-in');
      });

      // Optional: Remove 'fade-in' class after animation completes to allow for future fades
      setTimeout(() => {
         questionInput.classList.remove('fade-in');
         Array.from(document.getElementsByClassName("option")).forEach(option => {
            option.classList.remove('fade-in');
         });
      }, 300);
   }, 300)
}

function saveQuestion(currentQuestionId) {
   let questionObj = {};
   questionInput = document.getElementById('question-input');
   let question = questionInput.value;

   // Add the question for the questionObj
   questionObj["questionId"] = currentQuestionId; // Add id to question for uniqueness
   questionObj["question"] = question;
   questionObj["options"] = []; // Initialize an empty array for the options for easier navigation
   // questionInput["question"];

   // Add the options inputted to the questionObj
   options = document.getElementsByClassName("option")
   let count = 0;
   let isCorrect = 0;
   let optionTexts = [];
   for (let option of options) {
      // If the option value is filled in, continue the process
      if (option.value.trim() !== '') {
         count++;
         // Push to the optionTexts for future comparison
         optionTexts.push(option.value.trim());
         let check = option.nextElementSibling.checked;
         if (check) {
            console.log(`option ${count} checked`);
            isCorrect++;
         }

         let optionObj = {
            optionId: count,
            optionText: option.value.trim(),
            isCorrect: check
         };
         questionObj.options.push(optionObj);
      }
   }

   // Guard checks, reason can be seen on the error log

   if(isCorrect === 0) {
      console.error(`QuestionId ${currentQuestionId}: %cNo of correct answers must be at least 1`, 'color: blue;');
      return;
   }

   if (count <= 1) {
      console.error(`QuestionId ${currentQuestionId}: %cNo of available options must be at least 2`, 'color: blue;');
      return;
   }

   if (count === isCorrect) {
      console.error(`QuestionId ${currentQuestionId}: %cNo of correct answers must be ` +
         `fewer than No of options.`, 'color: blue;');
      return;
   }

   if (hasDuplicates(optionTexts)) {
      console.error(`QuestionId ${currentQuestionId}: %cNo duplicate options are allowed.`, 'color: blue;');
      return;
   }

   quizQuestions[currentQuestionId - 1] = questionObj;
   showAnnotation('.saveQ-successful');
   console.log(`%cQuestionId ${currentQuestionId} added successfully`, 'colors: green; background-color: limegreen');
}

const hasDuplicates = (array) => {
   return new Set(array).size !== array.length;
}

function goLeft(currentQuestionId) {
   if (currentQuestionId === 1)
      return;
   // No need to check when go Left because the left questions already exists in the quizQuestions array.
   let questionId = currentQuestionId - 1;
   document.getElementById("curQuestionId").innerHTML = (questionId);
   showSavedQuestion(questionId);
}

function goRight(currentQuestionId) {
   if (currentQuestionId === curMax)
      return;
   if (!saveQuestionAnnotator(currentQuestionId)) return;
   let questionId = currentQuestionId + 1
   document.getElementById("curQuestionId").innerHTML = (questionId);
   showSavedQuestion(questionId);
}

function saveQuestionAnnotator(currentQuestionId) {
   // Check if there is a question at the index currentQuestionId - 1
   if (currentQuestionId - 1 >= 0 && currentQuestionId - 1 < quizQuestions.length) {
      // showAnnotation('.saveQ-successful');
      return true;
   } else {
      showAnnotation('.saveQ-annotation');
      return false;
   }
}

function updateCurMaxIndicator(curMax) {
   document.querySelector('.current-max').innerHTML = curMax;
}

// Utility function to show annotation for 1 second
function showAnnotation(annotationClass) {
   document.querySelector(annotationClass).classList.remove('hide')
   setTimeout(() => {
      document.querySelector(annotationClass).classList.add('hide')
   }, 1000)
}

function clearAllInput() {
   // Clear the question
   let questionInput = document.getElementById('question-input');
   questionInput.value = "";

   // Clear the option inputs
   let options = document.getElementsByClassName('option');
   Array.from(options).forEach(element => {
      element.value = "";
      element.nextElementSibling.checked = false;
   });
}

// Use this to submit the stuff
const saveAndSubmit = document.querySelector('.save-and-submit');
let htmlContent = "";

saveAndSubmit.addEventListener("click", e => {
   e.preventDefault();
   let contentArray = [];
   // Check the corresponding 
   // Check if the teacher has specified the fileName first.
   let fileName = document.getElementById("lessonName").value;
   if(fileName === "") {
      alert("Lesson name should not be empty");
      return;
   }

   htmlContent = tinymce.get('lessonbox').getContent();
   console.log(htmlContent);
   
   if(htmlContent === "") {
      alert("Content should not be empty!");
      return;
   }

   contentArray.push(htmlContent);

   if(quizAdded) {
      // If user chooses to add quiz, check all of these conditions
      if(quizQuestions.length < 5) {
         alert("The number of quiz questions must be at least 5!");
         return;
      }

      else {
         contentArray.push(quizQuestions);
      }
   }

   let confirmation = confirm("Are you sure that this is what you want to upload?");
   if(confirmation)
      postData(contentArray, quizAdded, fileName);
   else
      console.log("Action canceled");
})

async function postData(contentArray, quizAdded, fileName) {
   const uploadContentURL = "https://script.google.com/macros/s/AKfycbzpquUeLMoJ4et1aiX_YiyEnvKpBbl2UbqVGWFDxsH48OQRHiBsJudH6OhJvZC6eErW/exec";
   const uploadQuizURL = "https://script.google.com/macros/s/AKfycbzRyklhBoO8hoQi3O8UAKvj6LwQv3PCLATChbEspccYzao20xeteTuAfZoV6I7MjDt8WQ/exec";
   // const getContentURL = "https://script.google.com/macros/s/AKfycbxBAmDgXoX6B5hbnXCZiLadIes9bwnBbdZIqeiNTt1w53eeZ0Xv6QQwGjuc_v4Y9gRd/exec";
   let idArrays = [];

   let contentToPost = {
      fileName: fileName,
      fileContent: contentArray[0]
   }
   // First call here
   let responseContent = await fetch(uploadContentURL, {
      method: 'POST',
      body: JSON.stringify(contentToPost)
   });
   let data1 = await responseContent.json();
   if(data1.status === "success") {
      console.log("Upload content succeed!");
      console.log(data1.fileId);
      idArrays.push(data1.fileId);
   } else {
      console.error("Upload quiz failed");
   }

   // If quiz is included
   if(quizAdded) {
      let quizToPost = {
         fileName: fileName + "Quiz",
         quizContent: JSON.stringify(contentArray[1])
      }

      let responseQuiz = await fetch(uploadQuizURL, {
         method: 'POST',
         body: JSON.stringify(quizToPost)
      })

      let data2 = await responseQuiz.json();
      if(data2.status === "success") {
         console.log("Upload quiz succeed!");
         console.log(data2.fileId);
         idArrays.push(data2.fileId);
      } else {
         console.error("Upload quiz failed")
      }
   }

   let xhr = new XMLHttpRequest();
   xhr.open("POST", `${webPath}/createlesson`, false);
   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

   let sendContent = new URLSearchParams();
   sendContent.append("lessonId", idArrays[0]);
   if(idArrays[1]) {
      sendContent.append("quizId", idArrays[1]);
   }

   sendContent.append("lessonTitle", document.querySelector("#lessonName").value);
   sendContent.append("skill",document.querySelector("#skill").value);
   sendContent.append("lessonFolder", document.querySelector("#lesson_folder").value);

   xhr.send(sendContent.toString());
}
