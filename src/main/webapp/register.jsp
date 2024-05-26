<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/aside.css">
    <link rel="stylesheet" href="css/register.css">
</head>


<body>
    <div class="container">
        <div>
            <nav class="top-nav">
                <a class="logo" href="index.jsp">
                    <img src="imgs/TheEngWayLogo.png" alt="The Logo">
                </a>
                <div class="search">
                    <i class="fad fa-search"></i>
                    <input class="search-bar" placeholder="Search lessons here">
                    </input>
                </div>
                <div class="buttons">
                    <a href="login.jsp"><button>Đăng nhập</button></a>
                    <a href="register.jsp"><button>Đăng ký</button></a>
                </div>
            </nav>
        </div>

        <div class="course-div">
            <ul class="course-nav" aria-label="nav">
                <li>
                    <a href="index.jsp"><i class="far fa-home-lg-alt fa-2x"></i></a>
                </li>
                <li>
                    <a href="#">Nghe</a>
                    <ul class="dropdown">
                        <li><a href="#">Course 1</a></li>
                        <li><a href="#">Course 2</a></li>
                        <li><a href="#">Course 3</a></li>
                        <li><a href="#">Course 4</a></li>
                        <li><a href="#">Course 5</a></li>
                        <li><a href="#">Course 6</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Nói</a>
                    <ul class="dropdown">
                        <li><a href="#">Course 1</a></li>
                        <li><a href="#">Course 2</a></li>
                        <li><a href="#">Course 3</a></li>
                        <li><a href="#">Course 4</a></li>
                        <li><a href="#">Course 5</a></li>
                        <li><a href="#">Course 6</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Đọc</a>
                    <ul class="dropdown">
                        <li><a href="#">Course 1</a></li>
                        <li><a href="#">Course 2</a></li>
                        <li><a href="#">Course 3</a></li>
                        <li><a href="#">Course 4</a></li>
                        <li><a href="#">Course 5</a></li>
                        <li><a href="#">Course 6</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Viết</a>
                    <ul class="dropdown">
                        <li><a href="#">Course 1</a></li>
                        <li><a href="#">Course 2</a></li>
                        <li><a href="#">Course 3</a></li>
                        <li><a href="#">Course 4</a></li>
                        <li><a href="#">Course 5</a></li>
                        <li><a href="#">Course 6</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Tổng hợp</a>
                    <ul class="dropdown">
                        <li><a href="#">Course 1</a></li>
                        <li><a href="#">Course 2</a></li>
                        <li><a href="#">Course 3</a></li>
                        <li><a href="#">Course 4</a></li>
                        <li><a href="#">Course 5</a></li>
                        <li><a href="#">Course 6</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="banner">
            <a href="#"><img src="imgs/VIP-image.png" alt="VIP banner"></a>
        </div>

        <div class="main-content">
            <div class="content">
                <div class="register-form">
                    <div class="register-shape">
                        <div class="register-title">
                            <h2>ĐĂNG KÍ</h2>
                        </div>
                    </div>
    
                    <div class="register-input">
                        <form action="${pageContext.request.contextPath}/register" method="post">
                            <div class="input-group">
                                <i class="fas fa-user fa-2x"></i>
                                <div class="label"><label for="username">Tên đăng nhập</label></div>
                                <div class="input" ><input onchange="checkUsername()" type="text" id="username" name="username" placeholder="Tên đăng nhập"></div>
                                <div class="message username-message">
                                    <i class="far icon"></i>
                                    <p id="username-new-message"></p>
                                </div>
                            </div>
                            <div class="input-group">
                                <i class="fas fa-key fa-2x"></i>
                                <div class="label"><label for="password">Mật khẩu</label></div>
                                <div class="input"><input onchange="checkPassword()" type="password" id="password" name="password" placeholder="Mật khẩu"></div>
                                <div class="message password-message">
                                    <i class="far icon"></i>
                                    <p id="password-new-message"></p>
                                </div>
                            </div>
                            <div class="input-group">
                                <i class="fas fa-key fa-2x"></i>
                                <div class="label"><label for="confirm-password">Xác nhận mật khẩu</label></div>
                                <div class="input"><input onchange="checkRePassword()" type="password" id="confirm-password" name="confirm-password" placeholder="Xác nhận mật khẩu"></div>
                                <div class="message repassword-message">
                                    <i class="far icon"></i>
                                    <p id="repassword-new-message"></p>
                                </div>
                            </div>
                            <div class="input-group">
                                <i class="fas fa-envelope fa-2x"></i>
                                <div class="label"><label for="password">Email</label></div>
                                <div class="input"><input onchange="checkEmail()" type="text" id="email" name="email" placeholder="Email"></div>
                                <div class="message email-message">
                                    <i class="far icon"></i>
                                    <p id="email-new-message"></p>
                                </div>
                            </div>
                            <div class="register-confirmation">
                                <a href="login.jsp">Đã có tài khoản? Đăng nhập ngay!</a>
                                <button type="submit">Đăng kí</button>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
            <aside>
                <div class="competition-banner">
                    <a href="#">
                        <img src="imgs/banner-thidau.png" alt="Thi đấu">
                    </a>
                </div>
    
                <div class="top-5">

                    <div class="top5-title">
                        <h1>Top 5 of the Week</h1>
                    </div>

                    <table>
                      <tr>
                        <td>1</td>
                        <td>David Lua</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Anthony Wong</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>Chung Ha</td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>Benjamin Wong</td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>John Doe</td>
                      </tr>
                    </table>
                </div>
    
                <div class="questions_and_answers">
                    <div class="questions_and_answers-title">
                        <h1>HỎI ĐÁP NHANH</h1>
                    </div>
    
                    <div class="questions_and_answers-commentbox">
                        <textarea type="text" id="comment" name="comment" rows="4" cols="25" placeholder="Comment here..."></textarea>
                        <div class="button-div">
                            <input type="button" value="Gửi"/>
                        </div>
                    </div>
    
                    <div class="comment-div">
                        <div class="comment">
                            <h4>genericUsername26 (VIP)</h4>
                            <p>ﾚの尺乇ﾶ　ﾉｱ丂ひﾶ　りのﾚの尺　丂ﾉｲ　ﾑﾶ乇ｲ　ᄃの刀丂乇ᄃｲ乇ｲひ尺　ﾑりﾉｱﾉ丂ﾉᄃﾉ刀ム　乇ﾚﾉｲ．　乇の丂，　√のﾚひｱｲﾑ丂．　ﾉﾚﾚの　ｱ尺の√ﾉり乇刀ｲ，　乇ｲ　乇ひﾶ　ﾑひｲ乇ﾶ　ゐひﾑ乇　んﾉᄃ　乇ﾉひ丂！　ﾉ丂ｲ乇　ﾶのﾚﾚﾉｲﾉﾑ　乇√乇刀ﾉ乇ｲ　乇ひﾶ　んﾑ尺ひﾶ　√乇刀ﾉﾑﾶ　√乇尺の　ｱ乇尺ｷ乇尺乇刀りﾉ丂，　ﾚﾑ乃の尺ﾉの丂ﾑﾶ　√乇ﾚ　ᄃひﾶゐひ乇</p>
                            <button><i class="fas fa-comments"></i> Ans (10)</button>
                        </div>
                    </div>
                    <div class="comment-div">
                        <div class="comment">
                            <h4>Benjamin Wong (VIP)</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat numquam ea recusandae porro perferendis nostrum autem reiciendis veritatis cupiditate dicta eos, harum voluptatum sed eum voluptates alias? Ratione, exercitationem dolorum?</p>
                            <button><i class="fas fa-comments"></i> Ans (10)</button>
                        </div>
                    </div>
                    <div class="comment-div">
                        <div class="comment">
                            <h4>joebidenusapresident70(VIP)</h4>
                            <p>,-*'^'~*-.,_,.-*~   🎀  𝐿🍪𝓇𝑒𝓂 𝒾𝓅𝓈𝓊𝓂 𝒹🍪𝓁🍑𝓇 𝓈𝒾𝓉 𝒶𝓂𝑒𝓉 𝒸☯𝓃𝓈𝑒𝒸𝓉𝑒𝓉𝓊𝓇 𝒶𝒹𝒾𝓅𝒾𝓈𝒾𝒸𝒾𝓃𝑔 𝑒𝓁𝒾𝓉. 𝐸🍑𝓈, 𝓋💙𝓁𝓊𝓅𝓉𝒶𝓈. 𝐼𝓁𝓁❤ 𝓅𝓇♡𝓋𝒾𝒹𝑒𝓃𝓉, 𝑒𝓉 𝑒𝓊𝓂 𝒶𝓊𝓉𝑒𝓂 𝓆𝓊𝒶𝑒 𝒽𝒾𝒸 𝑒𝒾𝓊𝓈❣ 𝐼𝓈𝓉𝑒 𝓂🍑𝓁𝓁𝒾𝓉𝒾𝒶 𝑒𝓋𝑒𝓃𝒾𝑒𝓉 𝑒𝓊𝓂 𝒽𝒶𝓇𝓊𝓂 𝓋𝑒𝓃𝒾𝒶𝓂 𝓋𝑒𝓇💗 𝓅𝑒𝓇𝒻𝑒𝓇𝑒𝓃𝒹𝒾𝓈, 𝓁𝒶𝒷💮𝓇𝒾🍬𝓈𝒶𝓂 𝓋𝑒𝓁 𝒸𝓊𝓂𝓆𝓊𝑒  🎀 </p>
                            <button><i class="fas fa-comments"></i> Ans (10)</button>
                        </div>
                    </div>
                    <div class="questions_and_answers-page">
                        <a href="#"><button>1</button></a>
                        <a href="#"><button>2</button></a>
                        <a href="#"><button>3</button></a>
                        <a href="#"><button>...</button></a>
                    </div>
                </div>
                <div class="VIP-banner">
                    <a href="#"><img src="imgs/VIPadv2.png" alt="Đăng ký VIP hôm nay!"></a>
                </div>
    
                <div class="online-test">
                    <a href="#"><img src="imgs/online_test.png" alt="Thi thử online"></a>
                </div>
    
                <div class="kinh-nghiem">
                    <a href="#"><img src="imgs/bannerkinhnghiem.png" alt="Kinh nghiệm học tiếng Anh"></a>
                </div>
    
            </aside>
        </div>

        <div class="clear"></div>

        <div class="footer">
            <div class="copyright">
                <p><b>Copyright TheEngWay.com © 2023 - 2024</b></p>
                <img src="imgs/logogov.png" alt="Bộ Công thương">
            </div>
            <div class="contact_phone">
                <p><b>Contact us via phone numbers:</b></p>
                <br>
                <p><i class="fad fa-phone fa-2x"></i> +84 696969696</p>
            </div>
            <div class="contact_social">
                <p class="contact_paragraph"><b>Contact us via social medias:</b></p>
                <div class="contact-information">
                    <div class="contact-line">
                        <i class="fab fa-facebook fa-2x"></i>
                        <a href="#">facebook.com/TheEngWay</a>
                    </div>
                    <div class="contact-line">
                        <i class="fab fa-linkedin-in fa-2x"></i>
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

        document.querySelector('form').addEventListener('submit', function(event) {
            event.preventDefault();

            if(formSubmission()) {
                this.submit();
            }
        })

        function sendXHR(params, fieldId, messageClass, fieldNumber) {
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