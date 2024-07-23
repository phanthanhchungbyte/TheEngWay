<%@page contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
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

            <div class="login-title">
                <h1>ĐĂNG NHẬP</h1>
            </div>

            <div class="login-input">

                <form action="${pageContext.request.contextPath}/actLogin" method="post">

                    <div class="input-group">
                        <div class="label">
                            <label for="username">
                                <h3>Tên đăng nhập</h3>
                            </label>
                        </div>
                        <div class="input"><input type="text" id="username" name="username" placeholder="Tên đăng nhập">
                        </div>
                    </div>

                    <div class="input-group">
                        <div class="label"><label for="password">
                            <h3>Mật khẩu</h3>
                        </label></div>
                        <div class="input"><input type="password" id="password" name="password" placeholder="Mật khẩu">
                        </div>
                    </div>

                    <a href="${pageContext.request.contextPath}/forgotpassword">Quên mật khẩu?</a>

                    <div class="login-confirmation">
                        <button type="submit" name="login">Đăng nhập</button>
                        <a href="${pageContext.request.contextPath}/register">Chưa có tài khoản? Đăng ký ngay!</a>
                    </div>

                </form>

            </div>

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
<script>
    let redirected = `${pageContext.request.getAttribute("redirected")}`
    if(redirected === true) {
        window.location.href = `${pageContext.request.contextPath}/login`;
    }
</script>
</body>

</html>