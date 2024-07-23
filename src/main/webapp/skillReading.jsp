<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css" />
    <base href="${pageContext.request.contextPath}"/>
    <link rel="icon" href="imgs/favicon/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="css/navbar.css">
    <link rel="stylesheet" type="text/css" href="css/coursenav.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/skills/skill.css">
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
    <style>
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
        <div>
            <a class="logo" href="${pageContext.request.contextPath}/index">
                <img src="imgs/TheEngWayLogo.png" alt="The Logo">
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
            <li> <a href="${pageContext.request.contextPath}/login" class="navlogin">Đăng nhập</a> </li>
            <li> <a href="${pageContext.request.contextPath}/register" class="registerlogin">Đăng ký</a> </li>
        </ul>
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
                    <li><a href="${pageContext.request.contextPath}/listening">Nghe</a></li>
                    <li><a href="${pageContext.request.contextPath}/reading" class="nav-link" data-page-id="reading">Đọc</a></li>
                    <li><a href="${pageContext.request.contextPath}/writing">Viết</a></li>
                    <li><a href="${pageContext.request.contextPath}/speaking">Nói</a></li>
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
            <p>Đọc</p>
        </div>

        <%-- Lessondisplay is used to display ythe dynamic lesson content --%>
        <section class="lesson-display">
            <div class="card">
                <div class="skill-level">
                    <h3>Reading IELTS</h3>
                </div>

                <div class="inner-content">
                    <p class="goal">Trong phần học này chúng ta sẽ cùng đọc các bài tiếng Anh trình độ dễ và làm bài tập cuối
                        mỗi bài</p>
                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no1.png" alt="">
                        <div>
                            <h4>Australian painter Margaret Preston</h4>
                            <p>Margaret Rose McPherson in Port Adelaide, South Australia in 1875, the daughter of David
                                McPherson, a Scottish marine engineer and his wife Prudence Lyle. She and her sister ...</p>
                        </div>
                    </div>

                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no2.png" alt="">
                        <div>
                            <h4>William Gilbert and Magnetism</h4>
                            <p>The 16th and 17th centuries saw two great pioneers of modern science: Galileo and Gilbert. The
                                impact of their findings in eminent. Gilbert was the first modern scientist, also the acceridted
                                father of the science of eletricity and magnetism...</p>
                        </div>
                    </div>

                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no3.png" alt="">
                        <div>
                            <h4>The dingo debate</h4>
                            <p>Glaziers see them as pessts, and poisoning is common, but some biologists think Australia's
                                dingoes are the best weapon in a war against imported cats and foxes. A plane flies a slow
                                pattern</p>
                        </div>
                    </div>

                    <div class="button-div">
                        <button>Xem tất cả >>></button>
                    </div>
                </div>
            </div>

            <div class="mid-card card">
                <div class="skill-level">
                    <h3>Reading B1</h3>
                </div>
                <div class="inner-content">
                    <p class="goal">Trong phần học này chúng ta sẽ cùng đọc các bài tiếng Anh trình độ trung bình và làm bài
                        tập cuối mỗi bài</p>
                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no4.png" alt="">
                        <div>
                            <h4>Australian parrots and their adaptation</h4>
                            <p>Margaret Preston was born Margaret Rose McPherson in Port Adelaide, South Australia in 1875, the
                                daughter of David McPherson, a Scottish marine engineer and his wife Prudence Lyle. She and her
                                sister</p>
                        </div>
                    </div>

                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no4.png" alt="">
                        <div>
                            <h4>Australian parrots and their adaptation</h4>
                            <p>Margaret Preston was born Margaret Rose McPherson in Port Adelaide, South Australia in 1875, the
                                daughter of David McPherson, a Scottish marine engineer and his wife Prudence Lyle. She and her
                                sister</p>
                        </div>
                    </div>

                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no4.png" alt="">
                        <div>
                            <h4>Australian parrots and their adaptation</h4>
                            <p>Margaret Preston was born Margaret Rose McPherson in Port Adelaide, South Australia in 1875, the
                                daughter of David McPherson, a Scottish marine engineer and his wife Prudence Lyle. She and her
                                sister</p>
                        </div>
                    </div>

                    <div class="button-div">
                        <button>Xem tất cả >>></button>
                    </div>
                </div>
            </div>

            <div class="hard-card card">
                <div class="skill-level">
                    <h3>Reading A1</h3>
                </div>
                <div class="inner-content">
                    <p class="goal">Trong phần học này chúng ta sẽ cùng đọc các bài tiếng Anh trình độ khó và làm bài tập
                        cuối mỗi bài</p>
                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no5.png" alt="">
                        <div>
                            <h4>Fear of the Unknown</h4>
                            <p>American companies fear that innovation is the secret of success-and that they cannot innovate.
                                And the small Umagic office in midtown Manhattan, a team of 30 computer...</p>
                        </div>
                    </div>

                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no5.png" alt="">
                        <div>
                            <h4>Fear of the Unknown</h4>
                            <p>American companies fear that innovation is the secret of success-and that they cannot innovate.
                                And the small Umagic office in midtown Manhattan, a team of 30 computer...</p>
                        </div>
                    </div>

                    <div class="mini-card">
                        <img src="../../imgs/skills_reading/reading_no5.png" alt="">
                        <div>
                            <h4>Fear of the Unknown</h4>
                            <p>American companies fear that innovation is the secret of success-and that they cannot innovate.
                                And the small Umagic office in midtown Manhattan, a team of 30 computer...</p>
                        </div>
                    </div>

                    <div class="button-div">
                        <button>Xem tất cả >>></button>
                    </div>
                </div>
            </div>
        </section>
    </div>

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
    let userType = `${sessionScope.loggedInUser.getUserType()}`
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

    // Change the home logo navigation based on usertype
    switch(userType) {
        case "Teacher":
            document.querySelector("#home-navigation").href = contextPath + "/teacherHome";
            break;
        case "Student":
            document.querySelector("#home-navigation").href = contextPath + "/studentHome";
            break;
        default:
            document.querySelector("#home-navigation").href = contextPath + "/index";
    }
</script>
<script src="js/toggleHomeBar.js"></script>
<script type="module" src="js/loadContentDynamic.js"></script>
<script type="text/javascript" src="js/commentRender.js"></script>
</body>

</html>