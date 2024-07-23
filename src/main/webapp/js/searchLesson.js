function searchSuggestions() {
    let input = document.getElementById('search-bar').value;
    if (input.length == 0) {
        document.getElementById('suggestions').innerHTML = '';
        return;
    }

    fetch(`demo/actSearchLessonServlet?searchString=${input}`)
        .then(response => response.json())
        .then(data => {
            let suggestions = document.getElementById('suggestions');
            suggestions.innerHTML = '';
            if (data.length === 0) {
                let noResults = document.createElement('div');
                noResults.className = 'suggestion-item';
                noResults.innerHTML = 'Không tìm thấy';
                suggestions.appendChild(noResults);
            } else {
                data.forEach(lesson => {
                    let suggestion = document.createElement('div');
                    suggestion.className = 'suggestion-item';
                    suggestion.innerHTML = lesson.lessonTitle;
                    suggestion.onclick = () => {
                        document.getElementById('search-bar').value = lesson.lessonTitle;
                        suggestions.innerHTML = '';
                    };
                    suggestions.appendChild(suggestion);
                });
            }
        })
        .catch(error => console.error('Error:', error));
}
