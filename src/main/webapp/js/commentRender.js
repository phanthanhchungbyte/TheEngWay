// Check if user is available, allow them to do comment;
if(loggedInUser !== "" && lessonRegex.test(pathname)) {
    document.querySelector(".comment-section").classList.remove("hide");
    commentBtn = document.querySelector(".submit-comment");
    // Function for handling comment;
    commentBtn.addEventListener("click", handleSubmitComment);
}

// Clone the comment for future usage
commentClone = document.querySelector(".comment-list").cloneNode(true);
document.querySelector(".comment-list").remove(); // Remove the first hidden comment after clone for future insert

function handleSubmitComment(e) {
    // Prevent instant submission
    e.preventDefault();
    // Checks
    let commentText = document.querySelector("#comment").value;
    let path = window.location.href;
    let parts = path.split("/")
    let folderName = parts[5];
    let lessonTitle = parts[6];

    if(commentText.trim() === "") {
        document.querySelector(".comment-warning").textContent = "Comment must not be empty or contains only white space.";
    } else if(commentText.trim().length > 250) {
        document.querySelector(".comment-warning").textContent = "Comment must not be longer than 250 characters.";
    } else {
        commentText = commentText.trim();
        let formData = new FormData();
        formData.append("comment", commentText);
        formData.append("comment-poster", username);
        formData.append("user-avatar", document.querySelector(".cur-avatar").src);
        formData.append("lessonId", lessonId);

        let xhr = new XMLHttpRequest();
        xhr.open("POST", `${contextPath}/actSubmitComment`, false);
        xhr.send(formData);
        xhr.addEventListener("load", (response) => {
            let newResponse = JSON.parse(response.target.responseText);
            let newComment = commentClone.cloneNode(true);
            newComment.querySelector(".commentor-avatar").src = document.querySelector(".cur-avatar").src;
            newComment.querySelector(".name").textContent = newResponse.userName;
            newComment.querySelector(".time").textContent = newResponse.commentCreatedDate.toString();
            newComment.querySelector(".comment-text").textContent = newResponse.commentContent;
            newComment.classList.remove("hide");
            document.querySelector(".comment-show > h2").insertAdjacentElement("afterbegin", newComment);
        })
    }
}

// document.addEventListener('onclick', () => {
//     const commentInput = document.getElementById('comment');
//     const commentText = document.getElementByClassName('comment-text');
//
//     if (commentText !== null) {
//         const commentContainer = getElementsByClassName('comment-content');
//         const commentElement = document.createElement('div');
//         commentElement.classList.add('comment');
//         commentElement.append(commentContainer);
//
//         commentContainer.appendChild(commentElement);
//     }
// })