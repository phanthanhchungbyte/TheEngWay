<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css" />
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
</head>

<body>
<div class="container">
    <nav class="top-nav">
        <div class="logo-div">
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
                    <a href="${pageContext.request.contextPath}/userProfile"><img src="imgs/user/UserSettings.png" id="setting_icon" alt=""></a>
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

        <div class="student-profile">
            <!--Whatever is within span tag are data needs to be fetched from database-->

            <section class="student-basic-profile">

                <div class="student-info">

                    <div class="student-avatar">
                        <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                        <h2><span>${sessionScope.loggedInUser.getUserName()}</span></h2>
                    </div>

                    <button>Thêm bạn bè</button>
                </div>

            </section>

            <section class="profile-settings">

                <div class="section-link" onclick="location.href='${pageContext.request.contextPath}/userProfile'">
                    <a href="${pageContext.request.contextPath}/userProfile">Profile</a>
                </div>

                <div class="section-link" onclick="location.href='${pageContext.request.contextPath}/profileFriends'">
                    <a href="${pageContext.request.contextPath}/profileFriends">Bạn bè</a>
                </div>

                <div class="section-link" onclick="location.href='${pageContext.request.contextPath}/profileComments'">
                    <a href="${pageContext.request.contextPath}/profileComments">Bình luận</a>
                </div>

            </section>

            <div class="student-data">
                <ul class="student-buttons">
                    <li>
                        <button><i class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân</button>
                    </li>

                    <li>
                        <button><i class="far fa-image-polaroid fa-lg"></i>Thay đổi avatar</button>
                    </li>

                    <li>
                        <button><i class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu</button>
                    </li>

                    <li>
                        <button><i class="fas fa-power-off fa-lg"></i>Thoát</button>
                    </li>
                </ul>

                <section class="friend-info">
                    <ul>
                        <li>
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="">
                            <h3>snaeenjoyer10</h3>
                            <button>Hủy kết bạn</button>
                        </li>

                        <li>
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="">
                            <h3>frogeadmin</h3>
                            <button>Hủy kết bạn</button>
                        </li>
                        <li>
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="">
                            <h3>tenjointsintheyear</h3>
                            <button>Hủy kết bạn</button>
                        </li>
                        <li>
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="">
                            <h3>purplegirl2003</h3>
                            <button>Hủy kết bạn</button>
                        </li>
                        <li>
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="">
                            <h3>oguumf123</h3>
                            <button>Hủy kết bạn</button>
                        </li>
                    </ul>

                    <div class="pagination">
                        <ol>
                            <li><button onclick="getPageId(event)">1</button></li>
                            <li><button onclick="getPageId(event)">2</button></li>
                            <li><button onclick="getPageId(event)">3</button></li>
                        </ol>
                    </div>
                </section>
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
</body>

</html>