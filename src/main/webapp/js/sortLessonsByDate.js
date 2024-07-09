document.addEventListener("DOMContentLoaded", () => {
    // For pagination of the lessons, maximum lessons per page is 5.
    const LESSONS_LIMIT_PER_PAGE = 5;
    let navigatePrevButton = document.querySelector(".navigate-prev");
    let navigateNextButton = document.querySelector(".navigate-next");
    let curIndicator = Number(document.querySelector(".indicator-num").textContent);

    let xhr = new XMLHttpRequest();
    xhr.open("GET", `${contextPath}/actSortLessonByDate`, false);
    let lessonData = null;
    xhr.onload = function () {
        lessonData = JSON.parse(xhr.responseText).createdLessons;
        console.table(lessonData);
        let startIndex = calculateStartIndex(curIndicator, LESSONS_LIMIT_PER_PAGE);
        displayCreatedLessons(startIndex, LESSONS_LIMIT_PER_PAGE);
    }
    xhr.send();

    function ConvertSecsToDate(timestamp) {
        const date = new Date(timestamp);
        return `${date.getFullYear()}-${(date.getMonth() + 1)}-${date.getDate()} ${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;
    }
    
    navigatePrevButton.onclick = () => {
        console.log(`%c The current number is: ${curIndicator}`, "color: green");
        if(curIndicator === 1) return;
        curIndicator--;
        document.querySelector(".indicator-num").textContent = curIndicator.toString();
        console.log(`Current page is now: ${curIndicator}`);
        let startIndex = calculateStartIndex(curIndicator, LESSONS_LIMIT_PER_PAGE);
        displayCreatedLessons(startIndex, LESSONS_LIMIT_PER_PAGE);
    }

    navigateNextButton.onclick = () => {
        console.log(`%c The current number is: ${curIndicator}`, "color: green");
        if(lessonData.length < LESSONS_LIMIT_PER_PAGE && curIndicator === 1) return;
        if(curIndicator === Math.ceil(lessonData.length / LESSONS_LIMIT_PER_PAGE)) return;
        curIndicator++;
        document.querySelector(".indicator-num").textContent = curIndicator.toString();
        console.log(`Current page is now: ${curIndicator}`);
        let startIndex = calculateStartIndex(curIndicator, LESSONS_LIMIT_PER_PAGE);
        displayCreatedLessons(startIndex, LESSONS_LIMIT_PER_PAGE);
    }

    function displayCreatedLessons(startIndex, pageLimit) {
        let tempLesson = document.querySelector(".created-lesson-card");
        let lessonBox = document.querySelector(".createdlessons-section");
        if (tempLesson) console.log("%c The tempLesson exists!", "color: green");
        lessonBox.innerHTML = ""; // Delete everything in the teacher_lessonview before appending new lessons.
        if (lessonData.length === 0) { // In case the creator hasn't created any lessons
            tempLesson.innerHTML = "";
        } else {
            // If the number of lessons on the page is less than 5, choose lessonData.length because it is smaller.
            let smallerLimit = Math.min(lessonData.length, startIndex + pageLimit);
            for (let i = startIndex; i < smallerLimit; i++) {
                let lessonClone = tempLesson.cloneNode(true); // Clone the template element
                lessonClone.style.display = "flex"; // Change the visibility of the element
                // set Image icon based on skill
                lessonClone.querySelector(".skill-icon").src = getImageFromSkill(lessonData[i].skill);
                // set card title
                let cardDetails = lessonClone.querySelector(".created-lesson-info");
                if (cardDetails) {
                    console.log("it exists");
                    cardDetails.querySelector(".lesson-title").innerHTML = lessonData[i].lessonTitle;
                    cardDetails.querySelector(".created-at").innerHTML = ConvertSecsToDate(lessonData[i].createdAt);
                    cardDetails.querySelector(".updated-at").innerHTML = ConvertSecsToDate(lessonData[i].updatedAt);
                    cardDetails.querySelector(".creator-name").innerHTML = lessonData[i].creatorName;
                } else {
                    console.log("not exists");
                }

                lessonBox.appendChild(lessonClone);
            }
        }
    }

    function getImageFromSkill(skill) {
        let url = "";
        switch (skill) {
            case "Listening":
                url = "imgs/lesson_types/listening_icon.png";
                break;
            case "Reading":
                url = "imgs/lesson_types/reading_icon.png"
                break;
            case "Writing":
                url = "imgs/lesson_types/writing_icon.png";
                break;
        }
        return url;
    }

    function calculateStartIndex(pageNum, interval) {
        return (pageNum - 1) + (pageNum - 1) * (interval - 1);
    }

    function calculateStartIndex2(pageNum, interval) {
        return (pageNum - 1) * interval;
    }
})

