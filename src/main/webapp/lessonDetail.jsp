<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Từ vựng</title>
    <base href="/demo/"/>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/skills/skill.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .lesson-content {
            li {
                color: unset;
                list-style-type: circle;
                list-style-position: inside;
                box-sizing: content-box;
                padding-left: 1em;
            }
        }
    </style>
</head>

<body>
<div class="container">
    <nav class="top-nav">
        <div>
            <a class="logo" href="${pageContext.request.contextPath}/studentHome">
                <h1>TheEngWay</h1>
            </a>
        </div>
        <input type="checkbox" id="nav-toggle" class="nav-toggle">
        <div class="home-page">
            <div class="menu-items-div">
                <ul class="menu-items">
                    <li class="search">
                        <form action="${pageContext.request.contextPath}/actSearchLessonServlet" method="get">
                            <i class="fad fa-search"></i>
                            <input class="search-bar" id="search-bar" name="searchString" placeholder="Search lessons here" onkeyup="searchSuggestions()">
                            <button type="submit" class="search-button">Search</button>
                            <div id="suggestions" class="suggestions"></div>
                        </form>

                    </li>
                </ul>
            </div>

            <div class="profile-home-card">
                <img src="${sessionScope.loggedInUser.getAvatar()}" alt="">
                <div class="shown-info">
                    <p class="username-profile">${sessionScope.loggedInUser.getUserName()}</p>
                    <p><span>0</span> thông báo mới</p>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/userProfile"><img src="./imgs/user/UserSettings.png"
                                                                                  id="setting_icon" alt=""></a>
                    <li class="setting-cog"><a href="${pageContext.request.contextPath}/index">Exit</a></li>
                </div>
            </div>

            <div class="profile-home-card-mini">
                <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar"/>
                <i class="fas fa-caret-down fa-2x"></i>
                <ul class="mini-profile-dropdown">
                    <li class="settings">
                        <a href="${pageContext.request.contextPath}/userProfile">Settings</a>
                    </li>
                    <li class="exit">
                        <a href="${pageContext.request.contextPath}/index">Exit</a>
                    </li>
                </ul>
            </div>
            <label for="nav-toggle" class="nav-toggle-label">
                <span></span>
            </label>
        </div>
    </nav>

    <section class="course-div">
        <ul class="course-nav" aria-label="nav">
            <li>
                <a href="${pageContext.request.contextPath}/studentHome"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/vocabulary">Từ vựng</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/grammar">Ngữ pháp</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/pronunciation">Phát âm</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/others/exams">Kiểm tra</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/others/quiz">Quiz</a>
            </li>
            <li>
                <a href="faqs.html">FAQs</a>
            </li>
        </ul>
    </section>

    <section class="skill-content">
        <div class="content-title">
            <h1 class="lesson-title">ENGLISH <span class="lesson-type-display"></span></h1>
        </div>

        <div class="lesson-content" style="padding: 1.6em">

        </div>
    </section>

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
    let loggedInUser = `${sessionScope.loggedInUser}`;
    let pageContext = `${pageContext.request.contextPath}`;
</script>
<script src="js/redirectToLogin.js"></script>
<script>
    // GET THE LESSON CONTENT AND LESSON TYPE TO DISPLAY
    let lessonContent = `${pageContext.request.getAttribute("lessonContent")}`;
    let lessonType = `${pageContext.request.getAttribute("lessonType")}`;
    document.querySelector(".lesson-type-display").textContent = lessonType;
    document.querySelector(".lesson-type-display").style.color = "white";
    if(lessonContent) {
        console.log("%cLesson Content is available, read from file successfully!", "color: green", "background-color: limegreen");
    }

    // Load the lesson content into the div.
    document.querySelector(".lesson-content").innerHTML = decodeHTML(lessonContent);

    function decodeHTML(html) {
        let txt = document.createElement("textarea");
        txt.innerHTML = html;
        return txt.value;
    }
</script>
</body>
</html>