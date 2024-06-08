<%--
    Document   : newpassword
    Created on : Mar 4, 2024, 8:16:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Snippet - BBBootstrap</title>
    <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
    <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'>
    <link rel="stylesheet" href="css/newpassword.css">
    <script type='text/javascript'
            src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <style>
        .placeicon {
            font-family: fontawesome
        }
        .custom-control-label::before {
            background-color: #dee2e6;
            border: #dee2e6
        }
    </style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
<div>
    <!-- Container containing all contents -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                <!-- White Container -->
                <div class="container bg-white rounded mt-2 mb-2 px-0">
                    <!-- Main Heading -->
                    <div class="row justify-content-center align-items-center pt-3">
                        <h1>
                            <strong>Reset mật khẩu</strong>
                        </h1>
                    </div>
                    <div class="pt-3 pb-3">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/newpassword" method="POST">
                            <!-- User Name Input -->
                            <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("errorMessage") %>
                            </div>
                            <% } %>
                            <div class="form-group row justify-content-center px-3">
                                <div class="col-9 px-0">
                                    <input type="password" name="password" id="password" placeholder="&#xf084; &nbsp; mật khẩu mới"
                                           class="form-control border-info placeicon">
                                </div>
                            </div>
                            <!-- Password Input -->
                            <div class="form-group row justify-content-center px-3">
                                <div class="col-9 px-0">
                                    <input type="password" name="repassword" id="repassword"
                                           placeholder="&#xf084; &nbsp; xác nhận mật khẩu"
                                           class="form-control border-info placeicon">
                                </div>
                            </div>

                            <!-- Log in Button -->
                            <div class="form-group row justify-content-center">
                                <div class="col-3 px-3 mt-3">
                                    <input type="submit" value="Reset"
                                           class="btn btn-block btn-info">
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- Alternative Login -->
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<script type="text/javascript">
    document.querySelector('form').addEventListener('submit', function(event) {
        event.preventDefault();

        if(formSubmission()) {
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
        xhr.onerror = function() {
            alert('Request failed');
        };

        xhr.open('POST', `${pageContext.request.contextPath}/register`, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(params);

        return true;
    }

    function handleSuccess(response) {
        const data = JSON.parse(response.target.responseText);

        switch(data.field) {
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

        if(inputElement.value.trim().length === 0) {
            inputElement.classList.add('warning');
            return false;
        } else if(inputElement.value.includes(' ')) {
            inputElement.classList.add('warning');
            return false;
        }
        return true;
    }

    const processMessage = (data, input_field, field, caseNumber) => {
        var inputElement = document.getElementById(input_field);
        if(data[`success_message` + caseNumber]) {
            inputElement.classList.add('success');
        }

        if(data[`error_message` + caseNumber]) {
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
            if(input.classList.contains('success'))
                continue;
            let inputId = input.id;
            if(!preProcessMessage(inputId)){
                warning = true;
            } else {
                // Manually trigger the onchange event
                let event = new Event('change');
                input.dispatchEvent(event);
                if(input.classList.contains("fail"))
                    error = true;
            }
        }
        // Simplified expression.
        return !(warning || error);
    }
</script>
</body>
</html>