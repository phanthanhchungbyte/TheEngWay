<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <base href="${pageContext.request.contextPath}/">
    <link rel="icon" href="imgs/favicon/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="css/coursenav.css">
    <link rel="stylesheet" type="text/css" href="css/skills/skill.css">
    <link rel="stylesheet" type="text/css" href="css/quiz_style.css">
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <link rel="stylesheet" type="text/css" href="css/comment.css">
    <style>
        .hide {
            display: none;
        }

        [role="progressbar"] {
            --size: 132px;
            --bar-width: 20px;
            --background-color: rgb(157, 200, 238);
            --loading-color: rgb(4, 0, 255);

            font-size: 2rem;
            width: var(--size);
            aspect-ratio: 1 / 1;

            background: conic-gradient(var(--loading-color) var(--progress, 0),
            var(--background-color) 0%);
            border-radius: 50%;

            display: grid;
            place-items: center;

            &::after {
                content: attr(aria-valuenow) "%";
                background: white;
                border-radius: inherit;
                width: calc(100% - var(--bar-width));
                /* The width of the running white around the circle */
                aspect-ratio: 1 / 1;

                /* Display grid because the number will be put in the center */
                display: grid;
                place-items: center;
            }

            font-family: Helvetica,
            sans-serif;
            margin: 0 auto;

            span {
                display: none;
            }
        }

        .changebuttondiv {
            display: flex;
            justify-content: center;
            margin-top: 2em;

            .changebutton {
                padding: 0.75rem 0.5rem;
            }
        }

        .progressbar:not([role="progressbar"]) {
            color: red;
            width: fit-content;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            margin: 0 auto;

            span {
                display: none;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <nav class="top-nav">
        <div class="logo-div">
            <a class="logo" href="${pageContext.request.contextPath}/index">
                <img src="imgs/TheEngWayLogo.png" alt="The Logo">
            </a>
        </div>
        <%--Homebar change based on if the user is logged in or not--%>
        <input type="checkbox" id="nav-toggle" class="nav-toggle">

        <label for="nav-toggle" class="nav-toggle-label">
            <span></span>
        </label>
    </nav>

    <div class="course-div">
        <ul class="course-nav" aria-label="nav">
            <li>
                <a href="${pageContext.request.contextPath}/index"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="#">Kĩ năng</a>
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/skillListening">Nghe</a></li>
                    <li><a href="${pageContext.request.contextPath}/skillReading">Đọc</a></li>
                    <li><a href="${pageContext.request.contextPath}/skillWriting">Viết</a></li>
                    <li><a href="#">Ngữ pháp</a></li>
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

    <div class="skill-container">
        <div class="skill-title">
            <p>Kĩ năng</p>
            <p>Nghe</p>
        </div>

        <!-- Lesson display is used to display the dynamic lesson content. -->
        <section class="lesson-display">
            <div class="card" data-lesson-folder="1">
                <div class="skill-level-wrap">
                    <div class="skill-level">
                        <h3 class="skill-title">Listening with BC</h3>
                    </div>
                    <div class="inner-content">
                        <a href="" class="mini-card-link">
                            <div class="mini-card">
                                <img class="lesson-avatar" src="" alt="">
                                <div>
                                    <h4 class="lesson-title"></h4>
                                    <p class="lesson-description"></p>
                                </div>
                            </div>
                        </a>
                        <div class="button-div">
                            <button class="see-all-lessons" data-lesson-folder="1">Xem tất cả >>></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card" data-lesson-folder="2">
                <div class="skill-level-wrap">
                    <div class="skill-level">
                        <h3 class="skill-title">Listening through Conversation</h3>
                    </div>
                    <div class="inner-content">
                        <!-- We add the lesson name as the data attribute for the links -->
                        <a href="" class="mini-card-link">
                            <div class="mini-card">
                                <img class="lesson-avatar" src="" alt="">
                                <div>
                                    <h4 class="lesson-title"></h4>
                                    <p class="lesson-description"></p>
                                </div>
                            </div>
                        </a>
                        <div class="button-div">
                            <button class="see-all-lessons" data-lesson-folder="2">Xem tất cả >>></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card" data-lesson-folder="3">
                <div class="skill-level-wrap">
                    <div class="skill-level">
                        <h3 class="skill-title">Listening B1 Level</h3>
                    </div>
                    <div class="inner-content">
                        <a href="" class="mini-card-link">
                            <div class="mini-card">
                                <img class="lesson-avatar" src="" alt="">
                                <div>
                                    <h4 class="lesson-title"></h4>
                                    <p class="lesson-description"></p>
                                </div>
                            </div>
                        </a>
                        <div class="button-div">
                            <button class="see-all-lessons" data-lesson-folder="3">Xem tất cả >>></button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <section class="quiz-section hide">
        <!-- Show instantly after start, disappears after user starts the quiz -->
        <div class="startquiz-section">
            <div class="label-div">
                <p class="quiz-label">Quiz</p>
            </div>
            <div class="welcome-screen">
                <h2>Quiz Name: Listening for the life</h2>
                <p>During this quiz, you'll learn how to use tenses</p>
                <p>Time limit: none</p>
                <p>Num of questions: <span class="question-num">15</span></p>
            </div>
            <div class="navigation-row">
                <button class="startquiz-btn">Start Quiz</button>
            </div>
        </div>

        <!-- Show temporarily, disappears after quiz finishes -->
        <div class="doquiz-section hide">
            <div class="label-div">
                <p class="quiz-label">Quiz</p>
                <p class="progress-counter">
                    Hoàn thành: &nbsp;
                    <span class="answered-count">0</span>
                    &nbsp;/&nbsp;
                    <span class="total-count">10</span>
                </p>
            </div>
            <div class="number-row">
                <i class="fad fa-long-arrow-alt-left fa-3x" id="prev-navigation"
                   style="--fa-primary-color: #b3dfcc; --fa-secondary-color: #b3dfcc;"></i>
                <ul class="question-numbers-row">

                </ul>
                <i class="fad fa-long-arrow-alt-right fa-3x" id="next-navigation"
                   style="--fa-primary-color: #b3dfcc; --fa-secondary-color: #b3dfcc;"></i>
            </div>
            <div class="temp-question-card hide">
                <p></p>
                <ul>

                </ul>
            </div>
            <div class="navigation-row">
                <button class="prev-btn">Prev</button>
                <button class="submit-quiz">Submit</button>
                <button class="next-btn">Next</button>
            </div>
        </div>

        <!-- Hide temporarily, appears after quiz finishes -->
        <div class="result-section hide">
            <div class="label-div">
                <p class="quiz-label">Quiz</p>
            </div>
            <div class="result-board">
                <h2 class="main-message">Congratulation! This is your result.</h2>
                <p>Time: <span class="final-time"></span></p>
                <p>Score: <span class="final-score"></span></p>
                <p class="message">You finished the quiz! Wanna try again?</p>
            </div>
            <div class="navigation-row">
                <button class="redo-quiz">Redo quiz</button>
                <button class="review-quiz">Review</button>
            </div>
        </div>
    </section>

    <section class="comment-section hide">
        <form>
            <div class="write-comment">
                <h2> Phản hồi về bài học này</h2>
                <div class="comment-part">
                    <label for="comment">Bình luận</label>
                    <textarea name="comment-fill-area" id="comment" cols="100" rows="10" placeholder="Nhập bình luận ở đây"></textarea>
                    <p style="color: red; font-style: oblique" class="comment-warning hide"></p>
                    <button class="submit-comment" type="submit">Gửi ngay</button>
                </div>
            </div>
        </form>

        <div class="comment-show">
            <h2> Bình luận</h2>
            <div class="comment-list hide">
                <div class="comment">
                    <div class="commentor">
                        <img src="" alt="Avatar" class="commentor-avatar">
                        <div class="commentor-info">
                            <p class="name">David Song</p>
                            <p class="time">Gửi lúc 00:00:00 ngày 20-01-2024</p>
                        </div>
                    </div>
                </div>
                <div class="comment-content">
                    <div class="comment-tag">
                        <h4>Bình luận</h4>
                    </div>
                    <div class="comment-text">
                        <p>I feel Hachiko...</p>
                    </div>
                </div>
            </div>
        </div>

    </section>
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

<script type="text/javascript">
    let contextPath = `${pageContext.request.contextPath}`;
    let loggedInUser = `${sessionScope.loggedInUser}`;
    let username = `${sessionScope.loggedInUser.getUserName()}`;
    let avatar = `${sessionScope.loggedInUser.getAvatar()}`;
    let curLessons = null;

    let lessonId = `${pageContext.request.getAttribute("lesson_id")}`;

    let pathname = window.location.pathname;
    let folderRegex = new RegExp(`^${pageContext.request.contextPath}/skillListening/[0-9]+$`);
    let lessonRegex = new RegExp(`^${pageContext.request.contextPath}/skillListening/[0-9]+/([a-zA-Z0-9_]+)$`)

    let demoLessonArray = `${pageContext.request.getAttribute("demo_lessons")}`;
    let allLessonArray = `${pageContext.request.getAttribute("all_lessons")}`;
    let lessonDataArray = `${pageContext.request.getAttribute("lesson_data")}`;
    // Lesson contents variables
    let commentClone = null;
    let commentBtn = null;
</script>
<script src="js/toggleHomeBar.js"></script>
<script type="module" src="js/loadContentDynamic.js"></script>
<script type="text/javascript" src="js/commentRender.js"></script>
</body>

</html>