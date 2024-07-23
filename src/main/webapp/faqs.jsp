<%@page contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frequently Asked Questions</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/faqs.css">
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
                            <input class="search-bar" id="search-bar" name="searchString"
                                   placeholder="Search lessons here" onkeyup="searchSuggestions()">
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
                    <p class="level-profile">LV1</p>
                    <p><span>0</span> thông báo mới</p>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/userProfile"><img src="imgs/user/UserSettings.png"
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
                <a href="${pageContext.request.contextPath}/index"><i class="far fa-home-lg-alt fa-2x"></i></a>
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

    <section class="main-banner">
        <a><img src="imgs/banner.png" alt="VIP banner"></a>
    </section>


    <section class="main-content">
        <div class="faqs-content">

            <h1 style="text-align: center;"><span style="color: #e03e2d;">FREQUENTLY ASKED QUESTIONS</span></h1>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <h2><span style="color: #e67e23;">1. General Questions</span></h2>
            <p>&nbsp;</p>
            <p style="padding-left: 40px;">Q: What is this platform?</p>
            <p style="padding-left: 40px;">A: This platform is an online English learning service designed to help users
                improve their English skills through lessons and quizzes.&nbsp;</p>
            <p style="padding-left: 40px;">&nbsp;</p>
            <p style="padding-left: 40px;">Q: How do I sign up?</p>
            <p style="padding-left: 40px;">A: You can sign up by clicking the "Sign Up" button on the homepage and
                filling out the registration form with your details.&nbsp;</p>
            <p style="padding-left: 40px;">&nbsp;</p>
            <p style="padding-left: 40px;">Q: What levels of English proficiency do you cover?</p>
            <p style="padding-left: 40px;">A: We offer lessons for all levels, from beginner to advanced, to ensure that
                learners at any stage can benefit from our platform.</p>
            <p>&nbsp;</p>
            <h2><span style="color: #e67e23;">2. Lessons and Learning&nbsp;</span></h2>
            <p>&nbsp;</p>
            <p style="padding-left: 40px;">Q: What types of lessons are available?&nbsp;</p>
            <p style="padding-left: 40px;">A: We offer a variety of lessons, including grammar, vocabulary,
                pronunciation, reading, writing, listening, and speaking.</p>
            <p style="padding-left: 40px;">&nbsp;</p>
            <p style="padding-left: 40px;">Q: How often are new lessons added?</p>
            <p style="padding-left: 40px;">A: New lessons are added regularly to ensure that our content stays fresh and
                relevant.</p>
            <p>&nbsp;</p>
            <h2><span style="color: #e67e23;">3. Technical Questions</span></h2>
            <p>&nbsp;</p>
            <p style="padding-left: 40px;">Q: What devices can I use to access the platform?</p>
            <p style="padding-left: 40px;">A: Our platform is accessible on desktops, laptops, tablets, and smartphones.
                All you need is an internet connection.</p>
            <p style="padding-left: 40px;">&nbsp;</p>
            <p style="padding-left: 40px;">Q: Do I need any special software to use the platform?</p>
            <p style="padding-left: 40px;">A: No special software is needed. You can access all lessons and features
                through your web browser.</p>
            <p style="padding-left: 40px;">&nbsp;</p>
            <p style="padding-left: 40px;">Q: What should I do if I encounter technical issues?</p>
            <p style="padding-left: 40px;">A: If you experience any technical problems, please contact our support team
                through the "Help" section or email us at&nbsp;<a href="mailto:theengwaymaster@8zulieu.com">theengwaymaster@8zulieu.com</a>
            </p>
            <p>&nbsp;</p>
            <div class="contact-line">&nbsp;</div>
            <p>&nbsp;</p>
            <h2><span style="color: #e67e23;">4. User Account&nbsp;</span></h2>
            <p>&nbsp;</p>
            <p style="padding-left: 40px;">Q: How do I reset my password?</p>
            <p style="padding-left: 40px;">A: To reset your password, click the "Forgot Password" link on the login page
                and follow the instructions to receive a reset link via email.</p>
            <p style="padding-left: 40px;">&nbsp;</p>
            <p style="padding-left: 40px;">Q: Can I change my username or email address?</p>
            <p style="padding-left: 40px;">A: You cannot change your email address after registration. You will have to
                create a new account.</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>

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
<script src="js/tilt.js"></script>
</body>

</html>
