document.addEventListener("DOMContentLoaded", () => {
    fetch(`${contextPath}/checkLoggedIn`, {
        method: "GET"
    }).then(response => response.text())
        .then(checkLoggedIn => {
            if (checkLoggedIn === "false") {
                console.log("You haven't logged in yet");
            } else if (checkLoggedIn === "true") {
                console.log("You are logged in")
            }
        })
})