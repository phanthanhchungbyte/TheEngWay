function gatherQuizContent() {
    let pairs = [];
    document.querySelectorAll('.matching_quiz .matching-content').forEach(content => {
        let left = content.querySelector('.matching-left input').value;
        let right = content.querySelector('.matching-right input').value;
        pairs.push({ left, right });
    });
    return { type: 'matching_quiz', pairs };
}