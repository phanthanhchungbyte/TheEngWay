export class MCQuizCreator {
    constructor(pageContext) {
        this.addQuestionButton = document.querySelector(".add");
        this.deleteSingleButton = document.querySelector(".delete-single");
        this.deleteAllButton = document.querySelector(".deleteall");
        this.updateQuestionButton = document.querySelector(".update-question");
        this.navigateRight = document.querySelector(".right-button");
        this.navigateLeft = document.querySelector(".left-button");
        this.questionNavigator = document.querySelector(".navigator-input");
        this.submitButton = document.querySelector(".save-and-submit");
        this.postData = this.postData.bind(this);
        this.pageContext = pageContext;
        // this.quizAvaToggle = document.querySelector("#quizava_checkbox");
        this.quizElements = document.getElementsByClassName("quiz");

        this.quizQuestions = [];
        this.options = [];
        this.questionInput = null;
        this.currentQuestionId = null;
        this.curMax = 1;
        this.currentQuestionIdShow = Number(document.getElementById("curQuestionId").innerText);
        this.updateCurMaxIndicator(this.curMax);
        // this.quizAdded = this.quizAvaToggle.checked;

        // this.quizToggleShow(this.quizAdded);

        this.initializeEventListeners();

        if (this.quizQuestions[this.currentQuestionIdShow]) {
            this.showSavedQuestion(this.currentQuestionIdShow);
        }
    }

    initializeEventListeners() {
        this.addQuestionButton.addEventListener("click", (event) => {
            event.preventDefault();
            this.curMax++;
            this.updateCurMaxIndicator(this.curMax);
        });

        this.deleteAllButton.addEventListener("click", (event) => {
            event.preventDefault();
            this.curMax = 1;
            this.updateCurMaxIndicator(this.curMax);
            this.quizQuestions.length = 0;
            document.getElementById("curQuestionId").innerHTML = this.curMax;
            this.clearAllInput();
        });

        this.deleteSingleButton.addEventListener("click", (event) => {
            event.preventDefault();
            this.currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
            this.deleteSingleQuestion(this.currentQuestionId);
        });

        this.updateQuestionButton.addEventListener("click", (event) => {
            event.preventDefault();
            this.currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
            this.saveQuestion(this.currentQuestionId);
        });

        this.navigateLeft.addEventListener("click", () => {
            this.currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
            this.goLeft(this.currentQuestionId);
        });

        this.navigateRight.addEventListener("click", () => {
            this.currentQuestionId = Number(document.getElementById("curQuestionId").innerText);
            this.goRight(this.currentQuestionId);
        });

        this.questionNavigator.addEventListener("keydown", (event) => {
            if (event.key === "Enter") {
                event.preventDefault();
                const questionNumber = parseInt(this.questionNavigator.value, 10);
                if (!isNaN(questionNumber) && questionNumber >= 1 && questionNumber <= this.curMax) {
                    document.getElementById("curQuestionId").innerText = questionNumber;
                    this.showSavedQuestion(questionNumber);
                }
            }
        });

        // TODO: ADD EVENT LISTENER FOR THE SUBMIT BUTTON
        this.submitButton.addEventListener("click", this.postData);

        // this.quizAvaToggle.addEventListener("change", () => {
        //     this.quizToggle(this.quizAvaToggle);
        // });
    }

    // quizToggle(checkbox) {
    //     this.quizAdded = checkbox.checked;
    //     this.quizToggleShow(this.quizAdded);
    // }

    // quizToggleShow(quizAdded) {
    //     for (let element of this.quizElements) {
    //         element.style.display = quizAdded ? 'block' : 'none';
    //     }
    // }

    deleteSingleQuestion(currentQuestionId) {
        this.quizQuestions = this.quizQuestions.filter((element) => element.questionId !== currentQuestionId);
        this.quizQuestions.forEach((element) => {
            if (element.questionId > currentQuestionId) element.questionId--;
        });

        if (currentQuestionId === this.curMax && this.curMax > 1) {
            this.showSavedQuestion(this.curMax - 1);
            document.getElementById("curQuestionId").innerHTML = this.curMax - 1;
            this.curMax--;
            this.updateCurMaxIndicator(this.curMax);
        } else if (currentQuestionId < this.curMax && this.curMax > 1) {
            this.curMax--;
            this.updateCurMaxIndicator(this.curMax);
            this.showSavedQuestion(currentQuestionId);
        } else if (currentQuestionId === this.curMax && this.curMax === 1) {
            this.clearAllInput();
            this.quizQuestions.length = 0;
        }
    }

    showSavedQuestion(currentQuestionId) {
        let currentQuestion = this.quizQuestions[currentQuestionId - 1];

        if (!currentQuestion) {
            this.clearAllInput();
            return;
        }

        this.questionInput.classList.add('fade-out');
        Array.from(document.getElementsByClassName("option")).forEach(option => {
            option.classList.add("fade-out");
        });

        setTimeout(() => {
            this.questionInput.value = currentQuestion.question;
            this.options = document.getElementsByClassName("option");
            for (let i = 0; i < currentQuestion.options.length; i++) {
                this.options[i].value = currentQuestion.options[i].optionText;
                this.options[i].nextElementSibling.checked = currentQuestion.options[i].isCorrect;
            }

            this.questionInput.classList.remove('fade-out');
            this.questionInput.classList.add('fade-in');
            Array.from(document.getElementsByClassName("option")).forEach(option => {
                option.classList.remove('fade-out');
                option.classList.add('fade-in');
            });

            setTimeout(() => {
                this.questionInput.classList.remove('fade-in');
                Array.from(document.getElementsByClassName("option")).forEach(option => {
                    option.classList.remove('fade-in');
                });
            }, 300);
        }, 300);
    }

    saveQuestion(currentQuestionId) {
        let questionObj = {};
        this.questionInput = document.getElementById('question-input');
        let question = this.questionInput.value;

        questionObj["questionId"] = currentQuestionId;
        questionObj["question"] = question;
        questionObj["options"] = [];

        this.options = document.getElementsByClassName("option");
        let count = 0;
        let isCorrect = 0;
        let optionTexts = [];
        for (let option of this.options) {
            if (option.value.trim() !== '') {
                count++;
                optionTexts.push(option.value.trim());
                let check = option.nextElementSibling.checked;
                if (check) {
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

        if (isCorrect === 0) {
            console.error(`QuestionId ${currentQuestionId}: No of correct answers must be at least 1`);
            return;
        }

        if (count <= 1) {
            console.error(`QuestionId ${currentQuestionId}: No of available options must be at least 2`);
            return;
        }

        if (count === isCorrect) {
            console.error(`QuestionId ${currentQuestionId}: No of correct answers must be fewer than No of options.`);
            return;
        }

        if (this.hasDuplicates(optionTexts)) {
            console.error(`QuestionId ${currentQuestionId}: No duplicate options are allowed.`);
            return;
        }

        this.quizQuestions[currentQuestionId - 1] = questionObj;
        this.showAnnotation('.saveQ-successful');
        console.log(`QuestionId ${currentQuestionId} added successfully`);
    }

    hasDuplicates(array) {
        return new Set(array).size !== array.length;
    }

    goLeft(currentQuestionId) {
        if (currentQuestionId === 1) return;
        let questionId = currentQuestionId - 1;
        document.getElementById("curQuestionId").innerHTML = questionId;
        this.showSavedQuestion(questionId);
    }

    goRight(currentQuestionId) {
        if (currentQuestionId === this.curMax) return;
        if (!this.saveQuestionAnnotator(currentQuestionId)) return;
        let questionId = currentQuestionId + 1;
        document.getElementById("curQuestionId").innerHTML = questionId;
        this.showSavedQuestion(questionId);
    }

    saveQuestionAnnotator(currentQuestionId) {
        if (currentQuestionId - 1 >= 0 && currentQuestionId - 1 < this.quizQuestions.length) {
            return true;
        } else {
            this.showAnnotation('.saveQ-annotation');
            return false;
        }
    }

    updateCurMaxIndicator(curMax) {
        document.querySelector('.current-max').innerHTML = curMax;
    }

    showAnnotation(annotationClass) {
        document.querySelector(annotationClass).classList.remove('hide');
        setTimeout(() => {
            document.querySelector(annotationClass).classList.add('hide');
        }, 1000);
    }

    clearAllInput() {
        let questionInput = document.getElementById('question-input');
        questionInput.value = "";

        let options = document.getElementsByClassName('option');
        Array.from(options).forEach(element => {
            element.value = "";
            element.nextElementSibling.checked = false;
        });
    }

    async postData(e) {
        e.preventDefault();
        console.log(this.quizQuestions);
        // Check if quiz name is available.
        let fileName = document.querySelector("#mc-quiz-title").value;
        if(fileName.trim() === "") {
            alert("Quiz name must not be left empty");
            return;
        }

        // Send quiz to the servlet.
        const requestBody = JSON.stringify({
            quizObj: JSON.stringify(this.quizQuestions),
            quizType: "MultipleChoice",
            fileName: fileName
        })

        // Try to send the data to the servlet
        try {
            let response = await fetch(this.pageContext + '/actAddNewQuiz', {
                method: 'POST',
                body: requestBody
            })

            this.submitButton.removeEventListener("click", this.postData);
        } catch (error) {
            console.error("Error: ", error);
            throw new Error('Failed to post data');
        }

    }
}