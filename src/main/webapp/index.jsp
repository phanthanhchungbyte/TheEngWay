<%@page contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css" />
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip></head>

<body>
<div class="container">
    <nav class="top-nav">
        <div>
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
                <a href="${pageContext.request.contextPath}/skills/vocabulary">Từ vựng</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/grammar">Ngữ pháp</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/pronunciation">Phát âm</a>
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

    <section class="main-banner">
        <a href="imgs/banner.png"><img src="imgs/banner.png" alt="VIP banner"></a>
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
            <a href="skills/reading.jsp" data-tilt data-tilt-glare>
                <div class="section-card">
                    <img src="imgs/index-assets/ReadingIndexCard.svg" alt="Reading Card">
                    <div class="card-intro">
                        <h2>Kĩ năng đọc</h2>
                        <span>Đọc hiểu các bài văn mấu bằng tiếng Anh</span>
                    </div>
                </div>
            </a>

            <!--Build lesson creator for this part-->
            <a href="skills/writing.jsp" data-tilt data-tilt-glare>
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
<script src="js/checkUserLoggedIn.js"></script>
<script src="js/tilt.js"></script>
</body>
</html>