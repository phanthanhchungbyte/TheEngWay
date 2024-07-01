<%@page contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/aside.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="container">
    <nav class="top-nav">
        <div>
            <a class="logo" href="index.jsp">
                <img src="imgs/TheEngWayLogo.png" alt="The Logo">
            </a>
        </div>
        <input type="checkbox" id="nav-toggle" class="nav-toggle">
        <ul class="menu-items">
            <li class="search">
                <i class="fad fa-search"></i>
                <input class="search-bar" placeholder="Search lessons here">
            </li>
            <li> <a href="login.jsp" class="navlogin">Đăng nhập</a> </li>
            <li> <a href="register.jsp" class="registerlogin">Đăng ký</a> </li>
        </ul>
        <label for="nav-toggle" class="nav-toggle-label">
            <span></span>
        </label>
    </nav>

    <div class="course-div">
        <ul class="course-nav" aria-label="nav">
            <li>
                <a href="index.jsp"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="#">Kĩ năng</a>
                <ul class="dropdown">
                    <li><a href="skillJSPs/skillListening.jsp">Listening</a></li>
                    <li><a href="skillJSPs/skillReading.jsp">Reading</a></li>
                    <li><a href="skillJSPs/skillWriting.jsp">Writing</a></li>
                    <li><a href="#">Grammar</a></li>
                    <li><a href="#">Từ vựng</a></li>
                </ul>
            </li>
            <li>
                <a href="#">TA Tiểu học</a>
                <ul class="dropdown">
                    <li><a href="#">Tiếng Anh lớp 1</a></li>
                    <li><a href="#">Tiếng Anh lớp 2</a></li>
                    <li><a href="#">Tiếng Anh lớp 3</a></li>
                    <li><a href="#">Tiếng Anh lớp 4</a></li>
                    <li><a href="#">Tiếng Anh lớp 5</a></li>
                </ul>
            </li>
            <li>
                <a href="#">TA Trung học CS</a>
                <ul class="dropdown">
                    <li><a href="#">Tiếng Anh lớp 6</a></li>
                    <li><a href="#">Tiếng Anh lớp 7</a></li>
                    <li><a href="#">Tiếng Anh lớp 8</a></li>
                    <li><a href="#">Tiếng Anh lớp 9</a></li>
                </ul>
            </li>
            <li>
                <a href="#">TA Trung học PT</a>
                <ul class="dropdown">
                    <li><a href="#">Tiếng Anh lớp 10</a></li>
                    <li><a href="#">Tiếng Anh lớp 11</a></li>
                    <li><a href="#">Tiếng Anh lớp 12</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Tổng hợp</a>
                <ul class="dropdown">
                    <li><a href="#">Articles</a></li>
                    <li><a href="#">Cuộc thi</a></li>
                    <li><a href="#">Test Kiểm tra trình độ</a></li>
                    <li><a href="#">Kiểm tra các khối</a></li>
                    <li><a href="#">Bài tập chấm điểm</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <div class="banner">
        <a href="#"><img src="imgs/VIP-image.png" alt="VIP banner"></a>
    </div>

    <div class="main-content">
        <div class="content">
            <div class="login-form">
                <div class="login-shape">
                    <div class="login-title">
                        <h2>ĐĂNG NHẬP</h2>
                    </div>
                </div>

                <div class="login-input">
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="input-group">
                            <i class="fas fa-user fa-2x"></i>
                            <div class="label"><label for="username">Tên đăng nhập</label></div>
                            <div class="input"><input type="text" id="username" name="username" placeholder="Tên đăng nhập"></div>
                        </div>
                        <div class="input-group">
                            <i class="fas fa-key fa-2x"></i>
                            <div class="label"><label for="password">Mật khẩu</label></div>
                            <div class="input"><input type="password" id="password" name="password" placeholder="Mật khẩu"></div>
                        </div>
                        <div class="login-confirmation">
                            <a href="forgotpassword.jsp">Quên mật khẩu?</a>
                            <button type="submit">Đăng nhập</button>
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
                        <p>ﾚの尺乇ﾶ　ﾉｱ丂ひﾶ　りのﾚの尺　丂ﾉｲ　ﾑﾶ乇ｲ　ᄃの刀丂乇ᄃｲ乇ｲひ尺　ﾑりﾉｱﾉ丂ﾉᄃﾉ刀ム　乇ﾚﾉｲ．　乇の丂，　√のﾚひｱｲﾑ丂．　ﾉﾚﾚの　ｱ尺の√ﾉり乇刀ｲ，　乇ｲ　乇ひﾶ　ﾑひｲ乇ﾶ　ゐひﾑ乇　んﾉᄃ　乇ﾉひ丂！　ﾉ丂ｲ　ﾶのﾚﾚﾉｲﾉﾑ　乇√乇刀ﾉ乇ｲ　乇ひﾶ　んﾑ尺ひﾶ　√乇刀ﾉﾑﾶ　√乇尺の　ｱ乇尺ｷ乇尺乇刀りﾉ丂，　ﾚﾑ乃の尺ﾉの丂ﾑﾶ　√乇ﾚ　ᄃひﾶゐひ乇</p>
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
</body>
</html>
