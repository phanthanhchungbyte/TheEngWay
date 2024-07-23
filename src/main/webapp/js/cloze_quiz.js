function gatherQuizContent() {
    let rawQuizData = tinyMCE.activeEditor.getContent();
    return { type: 'cloze_quiz', rawQuizData };
}