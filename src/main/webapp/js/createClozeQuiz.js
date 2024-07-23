export class ClozeQuizCreator {
    constructor() {
        this.quizName = "";
        this.completePreview = "";
        this.completeQuiz = "";
        this.quizAnswerMap = [];
    }

    clozeQuestion(curQuestionData, clozeContent) {
        // Use a Promise because if not, curQuestionData will be returned before the content is replaced.
        return new Promise((resolve) => {
            // Trim the cloze content in case the user double click the text and there are spaces at the beginning and end
            this.completeQuiz = curQuestionData;
            clozeContent = clozeContent.trim();
            let clozedDialog = document.querySelectorAll("dialog").item(0);
            let clozeQuestionModal = document.querySelector(".create-cloze-q + dialog");
            let clozedText = clozedDialog.querySelector(".clozed-question > span");
            clozedText.textContent = clozeContent;
            let button = clozedDialog.querySelector("button");
            clozeQuestionModal.showModal();

            // Add event listener for the change of the select type of cloze question
            let clozeTypeSelect = clozeQuestionModal.getElementsByTagName("select").item(0);
            clozeTypeSelect.addEventListener("change", (e) => {
                this.multipleChoiceHandler(e);
            })

            let previewQuizButton = document.querySelector(".preview-quiz");
            previewQuizButton.addEventListener("click", (e) => {
                e.preventDefault();
                let previewQuizModal = document.querySelector(".preview-quiz + dialog");
                previewQuizModal.showModal();
                this.parseAndReplaceCloze(previewQuizModal);
            })

            const handleClick = (e) => {
                e.preventDefault();
                let clozeOption = clozeQuestionModal.querySelector("select").value;
                if (clozeOption === "MULTIPLE_CHOICE") {
                    let optionInputDiv = document.querySelector(".option-input-div");
                    let options = optionInputDiv.querySelectorAll("input");
                    let optionTexts = Array.from(options).map((element) => {
                        if (element.value == clozeContent) {
                            return `[${element.value}]`
                        } else {
                            return element.value;
                        }
                    });
                    optionTexts = this.straightenOptions(optionTexts);
                    curQuestionData = this.replaceString(curQuestionData, clozeContent, clozeOption, optionTexts);
                    this.closeClozeQuestionModal(e);
                    this.completeQuiz = curQuestionData;
                    resolve(curQuestionData);
                } else {
                    curQuestionData = this.replaceString(curQuestionData, clozeContent, clozeOption);
                    // Remove the event listener after the button is clicked
                    this.closeClozeQuestionModal(e);
                    this.completeQuiz = curQuestionData;
                    resolve(curQuestionData);
                }

                button.removeEventListener("click", handleClick);
            }

            button.addEventListener("click", handleClick);
        })
    }

    closeClozeQuestionModal(e) {
        e.preventDefault();
        let clozeQuestionModal = document.querySelector(".create-cloze-q + dialog");
        clozeQuestionModal.close();
    }

    multipleChoiceHandler(e) {
        e.preventDefault();
        let clozeType = e.target.value;
        let optionInputDiv = document.querySelector(".option-input-div");
        switch (clozeType) {
            case "FILL_BLANK":
                document.querySelector(".num-of-options").classList.add("hide");
                document.querySelector(".option-input-div").classList.add("hide");
                break;
            case "MULTIPLE_CHOICE":
                document.querySelector(".num-of-options").classList.remove("hide");
                optionInputDiv.classList.remove("hide");
                document.querySelector(".num-of-options").addEventListener("change", (e) => {
                    let numOfOptions = Number(e.target.value);
                    optionInputDiv.innerHTML = "";
                    for (let i = 0; i < numOfOptions; i++) {
                        let optionInput = document.createElement("li");
                        optionInput.innerHTML = `<input type="text" class="option-input">`;
                        optionInputDiv.appendChild(optionInput);
                    }
                })
                break;
        }
    }

    replaceString(originalString, partToCloze, clozeType, clozeAnswer) {
        let clozeResult;
        switch (clozeType) {
            case "FILL_BLANK":
                clozeResult = originalString.replace(partToCloze, `{FB:${partToCloze}}`);
                console.log(clozeResult);
                return clozeResult;
            case "MULTIPLE_CHOICE":
                // clozeAnswer is an array of possible answers, it is only used for multiple choice questions
                return originalString.replace(partToCloze, `{MCQ:${clozeAnswer}}`);
        }
    }

    straightenOptions(options) {
        let initialStr = options[0];
        for (let i = 1; i < options.length; i++) {
            initialStr += `~${options[i]}`;
        }
        return initialStr;
    }

    parseAndReplaceCloze(previewContainer) {
        // Clear the previous quiz answer
        this.quizAnswerMap.length = 0;
        previewContainer = previewContainer.querySelector(".quiz-preview");

        previewContainer.innerHTML = this.completeQuiz;

        // Replace MCQ placeholders with dropdowns
        previewContainer.innerHTML = previewContainer.innerHTML.replace(/{MCQ:([^}]+)}/g, (match, p1) => {
            let options = p1.split("~");
            let select = document.createElement("select");
            select.style.padding = "0.3rem 0";
            select.style.marginInline = "10px";
            options.forEach(option => {
                let optionElement = document.createElement("option");
                if (option.startsWith("[") && option.endsWith("]")) {
                    this.quizAnswerMap.push(option.slice(1, -1));
                    option = option.slice(1, -1);
                }
                optionElement.value = option;
                optionElement.textContent = option;
                select.appendChild(optionElement);
            });
            return select.outerHTML;
        });

        // Replace FB placeholders with textboxes
        previewContainer.innerHTML = previewContainer.innerHTML.replace(/{FB:([^}]+)}/g, (match, p1) => {
            let input = document.createElement("input");
            input.type = "text";
            input.style.padding = "0.3rem 0";
            input.style.marginInline = "10px";
            input.value = p1;
            this.quizAnswerMap.push(p1);
            return input.outerHTML;
        });

        // Display the preview in a modal or pop-up
        let previewModal = document.createElement("div");
        previewModal.innerHTML = `<div class="preview-content">${previewContainer.innerHTML}</div>`;
    }

    registerAnswer(answer) {
        this.quizAnswerMap.push(answer);
    }

    // Setter for the raw quiz data
    setRawQuizData(rawQuizData) {
        this.completeQuiz = rawQuizData;
    }
}