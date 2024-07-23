<%@page contentType="text/html" pageEncoding="utf-8" %>
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
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
    <script href="js/searchLesson.js"></script>
</head>
<body>
<div class="container">
    <nav class="top-nav">
        <div class="logo-div">
            <a class="logo" href="${pageContext.request.contextPath}/teacherHome">
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
                <a href="${pageContext.request.contextPath}/teacherHome"><i class="far fa-home-lg-alt fa-2x"></i></a>
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

    <section class="second-banner">
        <div class="banner-support"></div>
        <div class="welcome-banner">
            <h2>Welcome to TheEngWay!</h2>
            <p>Pick any category to start learning English today</p>
        </div>
        <div class="banner-support"></div>
    </section>

    <section class="main-content">
        <section class="courses">
            <!--Build lesson creator for this part-->
            <a href="skills/vocabulary" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/VocabIndexCard.svg" alt="Vocab Card">
                    <div class="card-intro">
                        <h2>Từ vựng tiếng Anh</h2>
                        <span>Học từ vựng theo chủ đề (và theo hình ảnh)</span>
                    </div>
                </div>
            </a>
<%----%>
            <!--Build lesson creator for this part-->
            <a href="skills/grammar" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/GrammarIndexCard.svg" alt="Grammar Card">
                    <div class="card-intro">
                        <h2>Ngữ pháp tiếng Anh</h2>
                        <span>Hướng dẫn ngữ pháp tiếng Anh từ cơ bản đến nâng cao</span>
                    </div>
                </div>
            </a>


            <!--No lesson creator for this part-->
            <a href="skills/pronunciation" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/PronunciationIndexCard.svg" alt="Pronounciation Card">
                    <div class="card-intro">
                        <h2>Phát âm tiếng Anh</h2>
                        <span>Học cách phát âm tiếng Anh chuẩn như người bản địa</span>
                    </div>
                </div>
            </a>

            <!--Build lesson creator for this part-->
            <a href="skills/listening" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/ListeningIndexCard.svg" alt="Listening Card">
                    <div class="card-intro">
                        <h2>Kĩ năng nghe</h2>
                        <span>Luyện nghe tiếng Anh qua các video thực tế, phóng sự , v.v</span>
                    </div>
                </div>
            </a>

            <!--Build lesson creator for this part-->
            <a href="skills/reading" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/ReadingIndexCard.svg" alt="Reading Card">
                    <div class="card-intro">
                        <h2>Kĩ năng đọc</h2>
                        <span>Đọc hiểu các bài văn mấu bằng tiếng Anh</span>
                    </div>
                </div>
            </a>

            <!--Build lesson creator for this part-->
            <a href="skills/writing" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/WritingIndexCard.svg" alt="Writing Card">
                    <div class="card-intro">
                        <h2>Kĩ năng viết</h2>
                        <span>Học cách viết tiếng Anh tại đây</span>
                    </div>
                </div>
            </a>

            <!--Build lesson creator for this part-->
            <a href="others/blog.jsp" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/EnglishBlogIndexCard.svg" alt="English Blog">
                    <div class="card-intro">
                        <h2>Blog tiếng Anh</h2>
                        <span>Các bài blog xuất bản hằng tuần theo nhiều chủ đề khác nhau</span>
                    </div>
                </div>
            </a>

            <!--Quiz creator for this part-->
            <a href="others/exams.jsp" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/ExamIndexCard.svg" alt="English Exam">
                    <div class="card-intro">
                        <h2>Bài thi tiếng Anh</h2>
                        <span>Trình độ tiếng Anh của bạn đến đâu? Kiểm tra ngay!</span>
                    </div>
                </div>
            </a>

            <!--No lesson creator for this part-->
            <a href="supportline.html" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/SupportIndexCard.svg" alt="Support">
                    <div class="card-intro">
                        <h2>Hỗ trợ</h2>
                        <span>Nơi giải đáp thắc mắc của bạn</span>
                    </div>
                </div>
            </a>
        </section>
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
<%--<script type="text/javascript">--%>
<%--    let linkList = document.getElementsByTagName("a");--%>
<%--    Array.of(linkList).forEach(element => {--%>
<%--        element.addEventListener("click", (e) => {--%>
<%--            e.preventDefault();--%>
<%--        })--%>
<%--    });--%>
<%--</script>--%>
<script src="js/tilt.js"></script>
</body>

</html>