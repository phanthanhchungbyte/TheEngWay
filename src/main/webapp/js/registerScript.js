function checkUsername () {
    // Send an xhr request to the Servlet to check the username availability.
    console.log("Onblur fired");
    const inputField = document.getElementById('username');
    const usernameInput = inputField.value;
    console.log(usernameInput);
    if(usernameInput === "") {
        alert("Username should not be empty");
    } else {
        let xhr = new XMLHttpRequest();
        if(!xhr) {
            alert('Giving up: (Cannot create an XMLHTTP instance)');
            return false;
        }

        // Include username parameter
        let params = 'username=' + usernameInput + '&field=1';

        xhr.onload = handleSuccess;

        xhr.open('POST', 'demo/register', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.send(params);
    }
}

function checkPassword () {
    // Send an xhr request to the Servlet to check the password validity.
    console.log("Onblur fired");
    const inputField = document.getElementById('password');
    const passwordInput = inputField.value;
    console.log(passwordInput);
    if(passwordInput === "") {
        alert("Password should not be empty");
    } else {
        let xhr = new XMLHttpRequest();
        if(!xhr) {
            alert('Giving up: (Cannot create an XMLHttp instance)');
            return false;
        }

        // Include password parameter
        let params = 'password=' + encodeURIComponent(passwordInput) + '&field=2';

        xhr.onload = handleSuccess;

        xhr.open('POST', 'demo/register', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.send(params);
    }
}

function checkRePassword() {
    // Send an xhr request to the Servlet to check the password
    console.log("Onblur fired"); // Will remove after
    const inputField1 = document.getElementById('password');
    const inputField2 = document.getElementById('confirm-password');

    const passwordInput = inputField1.value;
    const rePasswordInput = inputField2.value;

    console.log(passwordInput);
    console.log(rePasswordInput);

    if(rePasswordInput === "") {
        alert("rePassword should not be empty");
    } else {
        let xhr = new XMLHttpRequest();
        if(!xhr) {
            alert('Giving up: (Cannot create an XMLHttp instance)');
            return false;
        }

        // Include password and repassword parameters
        // Use encodeURIComponent to process special characters in the password.
        let params = 'password=' + encodeURIComponent(passwordInput) + '&confirm-password=' + encodeURIComponent(rePasswordInput) + '&field=3';

        xhr.onload = handleSuccess;

        xhr.open('POST', 'demo/register', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.send(params);
    }
}

function checkEmail() {
    // Send an xhr request to the Servlet to check the password validity.
    console.log("Onblur fired");
    const inputField = document.getElementById('email');
    const emailInput = inputField.value;
    console.log(emailInput);
    if(emailInput === "") {
        alert("Email should not be empty");
    } else {
        let xhr = new XMLHttpRequest();
        if(!xhr) {
            alert('Giving up: (Cannot create an XMLHttp instance)');
            return false;
        }

        // Include password parameter
        let params = 'email=' + encodeURIComponent(emailInput) + '&field=4';

        xhr.onload = handleSuccess;

        xhr.open('POST', 'demo/register', true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.send(params);
    }
}

function handleSuccess(response) {
    const data = JSON.parse(response.target.responseText);

    for (let i = 1; i <= 4; i++) {
        if (data.field === i.toString()) {
            let successMessage = data[`success_message${i}`];
            let errorMessage = data[`error_message${i}`];

            if (successMessage) {
                console.log(successMessage);
            }

            if (errorMessage) {
                alert(errorMessage);
            } else if (!successMessage && !errorMessage) {
                console.error("Unexpected response format - No messages found");
            }
        }
    }
}


function warn(msg){
    alert(msg);
}