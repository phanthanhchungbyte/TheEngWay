<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 7/17/2024
  Time: 7:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Từ vựng</title>
    <base href="/demo/"/>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <%--    <link rel="stylesheet" href="../css/homebar.css">--%>
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/skills/skill.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
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
                    <a href="${pageContext.request.contextPath}/userProfile"><img src="../imgs/user/UserSettings.png"
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
                <a class="home-link" href="${pageContext.request.contextPath}/index"><i class="far fa-home-lg-alt fa-2x"></i></a>
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
                <a href="faqs.jsp">FAQs</a>
            </li>
        </ul>
    </section>

    <section class="skill-content">
        <div class="content-title">
            <h1>Listening</h1>
        </div>

        <div class="second-title">
            <h2>Listening lessons list</h2>
        </div>

        <div class="content-contents">
            <ul>
                <c:forEach var="lesson" items="${lessons}">
                    <li>
                        <a href="${pageContext.request.contextPath}/actLessonDetail?id=${lesson.lessonId}">
                                ${lesson.lessonTitle}
                        </a>
                    </li>
                </c:forEach>
            </ul>
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
    // TODO: THIS SCRIPT IS USED TO CHECK IF THE USER IS LOGGED IN OR NOT. AND ACT ACCORDINGLY
    let curUser = `${sessionScope.loggedInUser}`;
    let homeData = null;

    async function fetchData() {
        let promise = await fetch("jsons/homeBarToggle.json");
        homeData = await promise.json();
        let navbar = document.querySelector(".top-nav");

        if(curUser === "") {
            // Replacing the content of top nav similar to the index page
            console.log(homeData);
            navbar.innerHTML = (homeData[0])["homeBarContent"];
            // Change the content of the coursenav
            let homeLink = document.querySelector(".course-nav > li:first-child a");
            homeLink.href = `${pageContext.request.contextPath}/index`;
            changeCSS(false);
        } else {
            // Get the avatar and the username
            let username = `${sessionScope.loggedInUser.getUserName()}`;
            let avatar = `${sessionScope.loggedInUser.getAvatar()}`;
            let userRole = `${sessionScope.loggedInUser.getUserType()}`;

            // Check the type of user available.
            if(userRole === "Student") {
                document.querySelector(".home-link").href = `${pageContext.request.contextPath}/studentHome`;
                document.querySelector(".logo").href = `${pageContext.request.contextPath}/studentHome`;
            } else if(userRole === "Admin") {
                document.querySelector(".home-link").href = `${pageContext.request.contextPath}/teacherHome`;
                document.querySelector(".logo").href = `${pageContext.request.contextPath}/teacherHome`;
            }

            // Fix the user data inside the HTML string.
            let homeBarContent = (homeData[1])["homeBarContent"];
            homeBarContent = homeBarContent.replaceAll('USERNAME', username);
            homeBarContent = homeBarContent.replaceAll(/AVATAR/g, avatar)
            console.log("User is available");
            navbar.innerHTML = homeBarContent;
            changeCSS(true);
        }
    }

    function changeCSS(curUserAvailable) {
        let link = document.createElement("link");
        link.rel = "stylesheet"; link.type = "text/css";
        if(!curUserAvailable) {
            link.href = "css/navbar.css";
        } else {
            link.href = "css/homebar.css";
        }
        document.head.appendChild(link);
    }

    fetchData();
</script>
</body>
</html>
