<%--
    Document   : newpassword
    Created on : Mar 4, 2024, 8:16:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Select new Password</title>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/footer.css">
    <script href="js/searchLesson.js"></script>
    <style>
        .main-content {
            height: fit-content;
            width: 500px;
            margin-inline: auto;
            display: flex;
            text-align: center;
            margin-bottom: 4vh;
        }

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .container {
            height: 100vh;
            position: relative;
        }
    </style>
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
            <li><a href="${pageContext.request.contextPath}/login" class="navlogin">Đăng nhập</a></li>
            <li><a href="${pageContext.request.contextPath}/register" class="registerlogin">Đăng ký</a></li>
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
        <div class="login-form">
            <!-- White Container -->
            <div class="login-title">
                <h1>Reset mật khẩu</h1>
            </div>

            <div class="login-input">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/actNewPassword" method="POST">
                    <!-- User Name Input -->
                        <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                        <% } %>
                    <div class="input-group">
                        <div class="label"><label for="password">
                            <h3>Mật khẩu</h3>
                        </label></div>
                        <div class="input">
                            <input type="password" name="password" id="password" placeholder="Nhập mật khẩu mới">
                        </div>
                    </div>
                    <!-- Password Input -->
                    <div class="input-group">
                        <div class="label"><label for="password">
                            <h3>Nhập lại mật khẩu</h3>
                        </label></div>
                        <div class="input">
                            <input type="password" name="repassword" id="repassword" placeholder="Xác nhận mật khẩu">
                        </div>
                    </div>
                    <!-- Log in Button -->
                    <div class="login-confirmation">
                        <button type="submit" value="Reset">Reset</button>
                    </div>
            </div>
            </form>
        </div>
    </div>

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


</div>
<script type="text/javascript">
    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault();

        if (formSubmission()) {
            this.submit();
        }
    })

    function sendXHR(params) {
        let xhr = new XMLHttpRequest();
        if (!xhr) {
            alert('Giving up: (Cannot create an XMLHttp instance)');
            return false;
        }

        xhr.onload = handleSuccess;
        // xhr.onerror = function () {
        //     alert('Request failed');
        // };

        xhr.open('POST', `${pageContext.request.contextPath}/register`, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(params);

        return true;
    }

    function handleSuccess(response) {
        const data = JSON.parse(response.target.responseText);

        switch (data.field) {
            case "2":
                processMessage(data, 'password', 'password-message', 2);
                break;
            case "3":
                processMessage(data, 'confirm-password', 'repassword-message', 3);
                break;
        }
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
        const inputField2 = document.getElementById('repassword');

        const passwordInput = inputField1.value;
        const rePasswordInput = inputField2.value;

        if (!preProcessMessage('confirm-password', 'repassword-message')) return;

        let params = 'password=' + encodeURIComponent(passwordInput) + '&confirm-password=' + encodeURIComponent(rePasswordInput) + '&field=3';
        sendXHR(params, 'confirm-password', 'repassword-message', 3);
    }

    const preProcessMessage = (input_field) => {
        var inputElement = document.getElementById(input_field);

        if (inputElement.value.trim().length === 0) {
            inputElement.classList.add('warning');
            return false;
        } else if (inputElement.value.includes(' ')) {
            inputElement.classList.add('warning');
            return false;
        }
        return true;
    }

    const processMessage = (data, input_field, field, caseNumber) => {
        var inputElement = document.getElementById(input_field);
        if (data[`success_message` + caseNumber]) {
            inputElement.classList.add('success');
        }

        if (data[`error_message` + caseNumber]) {
            inputElement.classList.add('fail');
        }
    }

    // // Final check for Form Submission
    const formSubmission = () => {
        // Check each field
        let inputList = document.querySelectorAll("input[type='password']");
        let warning = false;
        let error = false;

        for (let i = 0; i < 2; i++) {
            let input = inputList[i];
            if (input.classList.contains('success'))
                continue;
            let inputId = input.id;
            if (!preProcessMessage(inputId)) {
                warning = true;
            } else {
                // Manually trigger the onchange event
                let event = new Event('change');
                input.dispatchEvent(event);
                if (input.classList.contains("fail"))
                    error = true;
            }
        }
        // Simplified expression.
        return !(warning || error);
    }
</script>
</body>
</html>