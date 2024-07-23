function gatherQuizContent() {
    let questions = [];
    document.querySelectorAll('.mc_quiz .question-card').forEach((card, index) => {
        let questionText = card.querySelector('#question-input').value;
        let options = [];
        card.querySelectorAll('.mc-option input[type="text"]').forEach(input => {
            options.push(input.value);
        });
        let correctAnswers = [];
        card.querySelectorAll('.mc-option input[type="checkbox"]').forEach((checkbox, idx) => {
            if (checkbox.checked) {
                correctAnswers.push(idx);
            }
        });
        questions.push({ questionText, options, correctAnswers });
    });
    return { type: 'mc_quiz', questions };
}