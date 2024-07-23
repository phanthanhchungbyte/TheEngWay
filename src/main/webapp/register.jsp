<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--  Add favicon  --%>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/register.css">
    <script href="js/searchLesson.js"></script>
</head>


<body>
<div class="container">
    <nav class="top-nav">
        <div class="logodiv">
            <a class="logo" href="${pageContext.request.contextPath}/index">
                <h1>TheEngWay</h1>
            </a>
        </div>
        <input type="checkbox" id="nav-toggle" class="nav-toggle">
        <ul class="menu-items">
            <li class="search">
                <form action="${pageContext.request.contextPath}/actSearchLessonServlet" method="get">
                    <i class="fad fa-search"></i>
                    <input class="search-bar" id="search-bar" name="searchString" placeholder="Search lessons here" onkeyup="searchSuggestions()">
                    <button type="submit" class="search-button">Search</button>
                    <div id="suggestions" class="suggestions"></div>
                </form>

            </li>
            <li> <a href="${pageContext.request.contextPath}/login" class="navlogin">Đăng nhập</a> </li>
            <li> <a href="${pageContext.request.contextPath}/register" class="registerlogin">Đăng ký</a> </li>
        </ul>
        <label for="nav-toggle" class="nav-toggle-label">
            <span></span>
        </label>
    </nav>

    <section class="course-div">
        <ul class="course-nav" aria-label="nav">
            <li>
                <a href="${pageContext.request.contextPath}/index"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="vocabulary.html">Từ vựng</a>
            </li>
            <li>
                <a href="grammar.html">Ngữ pháp</a>
            </li>
            <li>
                <a href="pronounciation.html">Phát âm</a>
            </li>
            <li>
                <a href="skills.html">Kĩ năng</a>
            </li>
            <li>
                <a href="exam.html">Kiểm tra</a>
            </li>
            <li>
                <a href="quiz.html">Quiz</a>
            </li>
            <li>
                <a href="faqs.html">FAQs</a>
            </li>
        </ul>
        </section>

    <div class="main-content">
        <div class="content">
            <div class="register-form">
                <div class="register-shape">
                    <div class="register-title">
                        <h1>ĐĂNG KÍ</h1>
                    </div>
                </div>

                <div class="register-input">
                    <form action="${pageContext.request.contextPath}/actRegister" method="post">
                        <div class="input-group">
                            <div class="label"><label for="username">Tên đăng nhập</label></div>
                            <div class="input" ><input onchange="checkUsername()" type="text" id="username" name="username" placeholder="Tên đăng nhập"></div>
                            <div class="message username-message">
                                <i class="far icon"></i>
                                <p id="username-new-message"></p>
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="label"><label for="password">Mật khẩu</label></div>
                            <div class="input"><input onchange="checkPassword()" type="password" id="password" name="password" placeholder="Mật khẩu"></div>
                            <div class="message password-message">
                                <i class="far icon"></i>
                                <p id="password-new-message"></p>
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="label"><label for="confirm-password">Xác nhận mật khẩu</label></div>
                            <div class="input"><input onchange="checkRePassword()" type="password" id="confirm-password" name="confirm-password" placeholder="Xác nhận mật khẩu"></div>
                            <div class="message repassword-message">
                                <i class="far icon"></i>
                                <p id="repassword-new-message"></p>
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="label"><label for="password">Email</label></div>
                            <div class="input"><input onchange="checkEmail()" type="text" id="email" name="email" placeholder="Email"></div>
                            <div class="message email-message">
                                <i class="far icon"></i>
                                <p id="email-new-message"></p>
                            </div>
                        </div>
<%--                        <div class="input-group">--%>
<%--                            <i class="fas fa-envelope fa-2x"></i>--%>
<%--                            <div class="label"><label>Select User Type:</label><br></div>--%>
<%--                            <div class="input"><input type="radio" id="student" name="usertype" value="Student" required></div>--%>
<%--                            <div class="label"><label for="student">Student</label><br></div>--%>
<%--                            <div class="input"><input type="radio" id="teacher" name="usertype" value="Teacher" required></div>--%>
<%--                            <div class="label"><label for="teacher">Teacher</label><br></div>--%>
<%--                            <div class="message usertype-message">--%>
<%--                                <i class="far icon"></i>--%>
<%--                                <p id="usertype-new-message"></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="register-confirmation">
                            <a href="${pageContext.request.contextPath}/login">Đã có tài khoản? Đăng nhập ngay!</a>
                            <button type="submit" name="submit">Đăng kí</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="clear"></div>

    <div class="footer">
        <div class="copyright">
            <p class="heading-para">Copyright TheEngWay.com © 2023 - 2024</p>
        </div>
        <div class="contact_phone">
            <p class="heading-para">Contact us via email:</p>
            <div class="contact-information">
                <div class="contact-line">
                    <p><i class="far fa-at fa-lg"></i> theengwaymaster@8zulieu.com</p>
                </div>

                <div class="contact-line">
                    <p><i class="fas fa-phone-alt fa-lg"></i> +84 0359 271 620</p>
                </div>
            </div>

        </div>
        <div class="contact_social">
            <p class="heading-para">Contact us via social medias:</p>
            <div class="contact-information">
                <div class="contact-line">
                    <i class="fab fa-facebook fa-lg"></i>
                    <a href="#">facebook.com/TheEngWay</a>
                </div>
                <div class="contact-line">
                    <i class="fab fa-linkedin-in fa-lg"></i>
                    <a href="#">linkedin.com/TheEngWay</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // document.querySelector('form').addEventListener('keypress', function(event) {
    //     if(event.key === 'Enter') {
    //         event.preventDefault();
    //     }
    // })

    let form = document.querySelector('form');

    form.addEventListener('submit', function(event) {
        event.preventDefault();

        if(formSubmission()) {
            let xhr = new XMLHttpRequest();
            xhr.open("POST", `${pageContext.request.contextPath}/actRegister`);

            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            let params = new URLSearchParams();
            params.append("username", document.querySelector("#username").value);
            params.append("password", document.querySelector("#password").value);
            params.append("email", document.querySelector("#email").value);

            xhr.onload = function() {
                if(xhr.status >= 200 && xhr.status < 300) {
                    window.location.href = `${pageContext.request.contextPath}/otp`;
                }
            }

            xhr.send(params);
        }
    })

    function sendXHR(params) {
        let xhr = new XMLHttpRequest();
        if (!xhr) {
            alert('Giving up: (Cannot create an XMLHttp instance)');
            return false;
        }

        xhr.onload = handleSuccess;
        // xhr.onerror = function() {
        //     alert('Request failed');
        // };

        xhr.open('POST', `${pageContext.request.contextPath}/actRegister`, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(params);

        return true;
    }

    function checkUsername() {
        const inputField = document.getElementById('username');
        const usernameInput = inputField.value;

        if (!preProcessMessage('username', 'username-message')) return;

        let params = 'username=' + encodeURIComponent(usernameInput) + '&field=1';
        sendXHR(params, 'username', 'username-message', 1);
    }

    function checkPassword() {
        const inputField = document.getElementById('password');
        const passwordInput = inputField.value;

        if (!preProcessMessage('password', 'password-message')) return;

        let params = 'password=' + encodeURIComponent(passwordInput) + '&field=2';
        sendXHR(params, 'password', 'password-message', 2);
    }

    function checkRePassword() {
        const inputField1 = document.getElementById('password');
        const inputField2 = document.getElementById('confirm-password');

        const passwordInput = inputField1.value;
        const rePasswordInput = inputField2.value;

        if (!preProcessMessage('confirm-password', 'repassword-message')) return;

        let params = 'password=' + encodeURIComponent(passwordInput) + '&confirm-password=' + encodeURIComponent(rePasswordInput) + '&field=3';
        sendXHR(params, 'confirm-password', 'repassword-message', 3);
    }

    function checkEmail() {
        const inputField = document.getElementById('email');
        const emailInput = inputField.value;

        if (!preProcessMessage('email', 'email-message')) return;

        let params = 'email=' + encodeURIComponent(emailInput) + '&field=4';
        sendXHR(params, 'email', 'email-message', 4);
    }

    function handleSuccess(response) {
        const data = JSON.parse(response.target.responseText);

        switch(data.field) {
            case "1":
                processMessage(data, 'username', 'username-message', 1);
                break;
            case "2":
                processMessage(data, 'password', 'password-message', 2);
                break;
            case "3":
                processMessage(data, 'confirm-password', 'repassword-message', 3);
                break;
            case "4":
                processMessage(data, 'email', 'email-message', 4);
                break;
        }
    }

    const preProcessMessage = (input_field, field) => {
        const targetElement = document.getElementsByClassName(field)[0]; // Get only one element of type xxx-message
        const inputElement = document.getElementById(input_field);
        let warning = false;

        const checkIcon = targetElement.getElementsByTagName('i')[0];
        const checkMessage = targetElement.getElementsByTagName('p')[0];

        if(inputElement.value.trim().length === 0) {
            inputElement.className = 'warning'; // Change className of the input field (the one we type in)
            targetElement.style.visibility = 'visible';
            checkMessage.innerText = 'Field must not be empty.';
            warning = true;
        } else if(inputElement.value.includes(' ')){
            inputElement.className = 'warning'; // Change className of the input field (the one we type in)
            targetElement.style.visibility = 'visible';
            checkMessage.innerText = 'Field must not contain space';
            warning = true;
        }

        if(warning === true) {
            if(checkIcon.classList.contains('fa-check-circle')) {
                checkIcon.classList.remove('fa-check-circle');
            }
            checkIcon.classList.add('fa-times-circle');
            return false;
        }
        return true;
    }

    const processMessage = (data, input_field, field, caseNumber) => {
        const targetElement = document.getElementsByClassName(field)[0];
        const inputElement = document.getElementById(input_field);
        if(data[`success_message` + caseNumber]) {
            inputElement.className = 'success';
            targetElement.style.visibility = 'visible';
            const checkIcon = targetElement.getElementsByTagName('i')[0];
            if(checkIcon.classList.contains('fa-times-circle')) {
                checkIcon.classList.remove('fa-times-circle');
            }
            checkIcon.classList.add('fa-check-circle');

            const checkMessage = targetElement.getElementsByTagName('p')[0];
            checkMessage.innerText = data[`success_message` + caseNumber];
        }

        if(data[`error_message` + caseNumber]) {
            inputElement.className = 'fail';
            targetElement.style.visibility = 'visible';
            const checkIcon = targetElement.getElementsByTagName('i')[0];
            if(checkIcon.classList.contains('fa-check-circle')) {
                checkIcon.classList.remove('fa-check-circle');
            }
            checkIcon.classList.add('fa-times-circle');

            const checkMessage = targetElement.getElementsByTagName('p')[0];
            checkMessage.innerText = data[`error_message` + caseNumber];
        }
    }

    // To show the messages
    const list = document.getElementsByClassName("icon");
    for(let item of list) {
        item.addEventListener("mouseover", (event) => {
            const message = event.target.nextElementSibling;
            message.style.opacity = 1;
        });

        item.addEventListener("mouseout", (event) => {
            const message = event.target.nextElementSibling;
            message.style.opacity = 0;
        });
    }

    // // Final check for Form Submission
    const formSubmission = () => {
        // Check each field
        let inputList = document.querySelectorAll(".input-group .input > input");
        let warning = false;
        let error = false;

        for (let i = 0; i < 4; i++) {
            let input = inputList[i];
            if(input.classList.contains('success'))
                continue;
            let inputId = input.id;
            let fatherInput = input.parentElement;
            let message = fatherInput.nextElementSibling.classList[1];
            if(!preProcessMessage(inputId, message)){
                warning = true;
            } else {
                // Manually trigger the onchange event
                let event = new Event('change');
                input.dispatchEvent(event);
                if(input.className === 'fail')
                    error = true;
            }
        }
        // Simplified expression.
        return !(warning || error);
    }
</script>
</body>
</html>