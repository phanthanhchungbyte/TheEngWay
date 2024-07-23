export class MatchingQuizCreator {

    constructor() {
        // For the user to check the obj A and obj B to create a match query
        this.matchingMode = false;
        this.matchingState = "start";
        this.totalPairs = 0;
        this.registeredPairs = 0;
        this.quizName = "";
        this.answerMap = [];
        this.leftOptions = [];
        this.rightOptions = [];
        this.questionObj = [];
        this.wordDivTemplate = document.querySelector(".matching-content").cloneNode(true);
    }

    // Create the matching quiz
    startQuizCreation() {
        /* Listen to the event of word pairs number being typed,
        if greater than 10, notify the user that it is too many
        and ask for a smaller number */
        let wordPairsNumInput = document.getElementById("match-number");
        let matchingButton = document.querySelector(".matching-mode-btn");
        matchingButton.addEventListener("click", this.checkPairs.bind(this));
        wordPairsNumInput.addEventListener("keydown", (e) => {
            if(e.key === "Enter") {
                e.preventDefault();
                if(e.target.value.trim() !== ""){
                    wordPairsNumInput.dispatchEvent(new Event("change"));
                }
            }
        });
        wordPairsNumInput.addEventListener("change", this.detectNumPairsChange.bind(this));
    }

    detectNumPairsChange(e) {
        let numPair = e.target.value;
        e.preventDefault();
        console.log("Current number of pairs is: " + numPair);
        if (numPair < 5) {
            this.toggleNotification("ON");
            document.querySelector(".first-notification").textContent = "Too few pairs, please enter a number greater than 5";
            return;
        } else if (numPair > 10) {
            this.toggleNotification("ON");
            document.querySelector(".first-notification").textContent = "Too many pairs, please enter a number less than 10";
            return;
        } else {
            this.toggleNotification("OFF");
        }
        // Return true if the number of pairs is valid
        this.totalPairs = Number(numPair);
        this.generateWordPairsTemplate();
    }

    generateWordPairsTemplate() {
        let wordPairsNum = this.totalPairs;
        let wordPairsHolder = [document.querySelector(".matching-left"),
            document.querySelector(".matching-right")];

        for (let template of wordPairsHolder) {
            // Clear the previous word pairs
            template.innerHTML = '';
            for (let i = 0; i < wordPairsNum; i++) {
                let wordDiv = this.wordDivTemplate.cloneNode(true);
                wordDiv.classList.remove("hide");
                if (template.classList.contains("matching-left")) {
                    wordDiv.dataset.id = `left${i}`;
                    wordDiv.querySelector("p").textContent = `Word no ${i + 1}`;
                    template.appendChild(wordDiv);
                } else if (template.classList.contains("matching-right")) {
                    wordDiv.dataset.id = `right${i}`;
                    wordDiv.querySelector("p").textContent = `Từ vựng số ${i + 1}`;
                    template.appendChild(wordDiv);
                }
            }
        }

        this.lockSideOptions("left", [-1]); // Lock all left options
        this.lockSideOptions("right", [-1]); // Lock all right options
    }

    checkPairs(e) {
        e.preventDefault();
        // Check if the quiz name is defined or not
        let quizName = document.getElementById("match-title").value;
        if(quizName.trim() == "") {
            alert("Please enter the quiz name!");
            return;
        }
        this.quizName = quizName;

        if(this.matchingState === "done") {
            alert("Matching mode is already done!");
            return;
        }

        alert("Matching mode started!");
        let inputs = Array.from(document.getElementsByClassName("matching-content-input"));
        // Calling one for loop to check all the inputs
        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value === "") {
                alert("Please fill in all the blanks!");
                return;
            } else {
                i < inputs.length / 2 ?
                    this.leftOptions.push({"optionId": i, "optionContent": inputs[i].value}) :
                    this.rightOptions.push({"optionId": i - inputs.length / 2, "optionContent": inputs[i].value});
            }
        }

        // Start matching the pairs, lock the option after matching
        this.matchingMode = true;
        this.matchPairs();

        console.log("%cAll data filled successfully!", "color: green");
    }

    matchPairs() {
        let matchCheckboxes = Array.from(document.getElementsByClassName("matching-content-checkbox"));
        let currentLeftIndex = 0;  // Track the current allowed index on the left
        this.lockSideOptions("left", [0]);  // Lock all left options except the first one
        this.lockSideOptions("right", [-1]);  // Lock all right options

        let rightLockedOptions = [];

        // Iterate over the left options
        for (let i = 0; i < matchCheckboxes.length / 2; i++) {
            let leftCheckbox = matchCheckboxes[i];
            let rightCheckbox = matchCheckboxes[i + matchCheckboxes.length / 2];

            rightCheckbox.addEventListener('change', () => {
                if(rightCheckbox.checked) {
                    let indexOfRightOpt = matchCheckboxes.indexOf(rightCheckbox) - matchCheckboxes.length / 2;
                    rightLockedOptions.push(indexOfRightOpt)
                    this.answerMap.push(indexOfRightOpt);
                }

                if(rightLockedOptions.length === matchCheckboxes.length / 2) {
                    alert("All options are matched!");
                    this.matchingState = "done";
                    // TODO: To log the object of the question to the console.
                    this.submitQuizToServer();
                }

                setTimeout(() => {
                    // -1 means all options are chosen to take action
                    this.lockSideOptions("right", [-1]);
                    this.lockSideOptions("left", [currentLeftIndex]);
                }, 300);
            });

            // Add event listener to each left checkbox
            leftCheckbox.addEventListener('change', () => {
                // Check if the left checkbox is checked
                if (leftCheckbox.checked) {
                    // Check if it's the next sequential option
                    if (i === currentLeftIndex) {
                        // Increment the current allowed index on the left
                        currentLeftIndex++;
                        // unlock the right options except the ones that are already matched
                        this.unlockSideOptions("right", rightLockedOptions);

                        // Example: Logging the match
                        console.log(`Matched left option ${i} with right option ${i + matchCheckboxes.length / 2}`);
                    }
                }
            });
        }
    }

    lockSideOptions(side, keepOpenOptions) {
        let arr = Array.from(document.querySelectorAll(`.matching-${side} .matching-content-checkbox`));
        for(let i = 0; i < arr.length; i++) {
            if(!keepOpenOptions.includes(i) || keepOpenOptions[0] === -1) {
                arr[i].disabled = true;
            } else {
                arr[i].disabled = false
            }
        }
    }

    unlockSideOptions(side, keepLockedOptions) {
        let arr = Array.from(document.querySelectorAll(`.matching-${side} .matching-content-checkbox`));
        for(let i = 0; i < arr.length; i++) {
            arr[i].disabled = !(!keepLockedOptions.includes(i) || keepLockedOptions[0] === -1);
        }
    }

    // TODO: to submit quiz to server
    submitQuizToServer() {
        // Create the question object from the data made.
        let questionObj = {};
        questionObj["quizName"] = this.quizName;
        questionObj["questionId"] = 0;
        questionObj["questionType"] = "matching";
        questionObj["leftSideOptions"] = this.leftOptions;
        questionObj["rightSideOptions"] = this.rightOptions;
        questionObj["answerMapping"] = this.answerMap;

        console.table(questionObj);
    }

    // Toggle notification
    toggleNotification(command) {
        switch (command) {
            case "ON":
                document.querySelector(".first-notification").classList.remove("hide");
                document.querySelector(".matching-left").classList.add("hide");
                document.querySelector(".matching-right").classList.add("hide");
                break;
            case "OFF":
                document.querySelector(".first-notification").classList.add("hide");
                document.querySelector(".matching-left").classList.remove("hide");
                document.querySelector(".matching-right").classList.remove("hide");
                break;
        }
    }
}