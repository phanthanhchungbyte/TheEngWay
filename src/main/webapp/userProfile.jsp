<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/footer.css">
    <%--  Include the cropper css  --%>
    <link rel="stylesheet" href="cropperjs/cropper.css">
    <%--  Include the cropper script  --%>
    <script src="cropperjs/cropper.js"></script>
    <style>
        .hide {
            display: none;
        }
    </style>
</head>

<body>
<div class="container">
    <nav class="top-nav">
        <div class="logo-div">
            <a class="logo" href="${pageContext.request.contextPath}/home">
                <img src="imgs/TheEngWayLogo.png" alt="The Logo">
            </a>
        </div>

        <input type="checkbox" id="nav-toggle" class="nav-toggle">
        <div class="home-page">
            <div class="menu-items-div">
                <ul class="menu-items">
                    <li class="search">
                        <i class="fad fa-search"></i>
                        <input class="search-bar" placeholder="Search lessons here">
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
                    <a href="userProfile"><img src="imgs/user/UserSettings.png" id="setting_icon" alt=""></a>
                    <ul>
                        <li class="setting-cog"><a href="${pageContext.request.contextPath}/index">Exit</a></li>
                    </ul>
                </div>
            </div>
            <div class="profile-home-card-mini">
                <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar"/>
                <i class="fas fa-caret-down fa-2x"></i>
                <ul class="mini-profile-dropdown">
                    <li class="settings">
                        <a href="userProfile">Settings</a>
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

    <div class="banner">
        <a href="#"><img src="imgs/VIP-image.png" alt="VIP banner"></a>
    </div>

    <div class="main-content">

        <div class="student-profile">
            <!--Whatever is within span tag are data needs to be fetched from database-->

            <section class="wall-student-card">

                <div class="student-maininfo">

                    <div class="student-info">

                        <div class="student-avatar">
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                            <h2><span>${sessionScope.loggedInUser.getUserName()}</span></h2>
                        </div>

                        <div class="student-bio">
                            <%-- Dựa vào userType để xác định title phù hợp --%>
                            <c:set value="${sessionScope.loggedInUser.getUserType()}" var="userType"/>
                            <c:choose>
                                <c:when test="${userType eq 'Student'}">
                                    <h4>Học sinh tập sự</h4>
                                </c:when>
                                <c:when test="${userType eq 'Teacher'}">
                                    <h4>Giáo viên</h4>
                                </c:when>
                            </c:choose>
                            <p>Giới tính: <span>Nam</span></p>
                            <p>Bài viết: <span>690</span></p>
                            <p>Tham gia ngày: <span>06/09/2012</span></p>
                            <p>Online cách đây: <span>20s</span></p>
                            <p><span>"Never gonna give you up"</span> <a href="#">[Sửa..]</a></p>
                        </div>

                    </div>

                    <div class="student-buttonside">
                        <ul class="student-buttons">
                            <li>
                                <button class="personal-info"
                                        onclick="location.href='${pageContext.request.contextPath}/profileShow';"><i
                                        class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân
                                </button>
                            </li>

                            <li>
                                <button class="changeavatar-button"><i class="far fa-image-polaroid fa-lg"></i>Thay đổi
                                    avatar
                                </button>
                            </li>

                            <li>
                                <button onclick="location.href='${pageContext.request.contextPath}/forgotpassword';"><i
                                        class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu
                                </button>
                            </li>

                            <li>
                                <button><i class="fas fa-cog fa-lg"></i>Cài đặt</button>
                            </li>

                            <li>
                                <button onclick="location.href='${pageContext.request.contextPath}/index';"><i
                                        class="fas fa-power-off fa-lg"></i>Thoát
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>

                <%--Modal to serve change avatar, modal = popup--%>
                <dialog class="modal" id="modal">
                    <h3>Đổi avatar</h3>
                    <img src="${sessionScope.loggedInUser.getAvatar()}" alt="avatar" class="cur-avatar">
                    <form action="" method="dialog" enctype="multipart/form-data">
                        <div class="input-avatar">
                            <input type="file" alt="insert one" id="imageInput" accept="image/*"/>
                        </div>
                        <!-- Initially put the crop image modal to none -->
                        <button class="submit-avatar" type="submit" disabled>Submit</button>
                    </form>
                    <button class="button close-button">Close</button>
                    <button class="shownextmodal" style="display: none;">Open modal 2</button>
                </dialog>

                <dialog class="showImageModal" id="modal2">
                    <div class="img-container">
                        <img src="#" alt="Testing" id="image">
                    </div>
                    <button id="crop-button">Crop</button>
                    <div class="cropped-container">
                        <img src="#" alt="Testing2" id="output">
                    </div>
                    <button class="go-back">Close</button>
                    <button class="return-to-main">Save</button>
                </dialog>

                <div class="separator">

                </div>
                <div class="student-statistics">
                    <div class="student-individual-statistic">
                        <h1>Friends</h1>
                        <p><span>12</span></p>
                    </div>

                    <div class="student-individual-statistic">
                        <h1>Average score</h1>
                        <p><span>6.9</span></p>
                    </div>

                    <div class="student-individual-statistic">
                        <h1>Title</h1>
                        <p><span>42</span></p>
                    </div>

                    <div class="student-individual-statistic">
                        <h1>Experience Points</h1>
                        <p><span>169420</span></p>
                    </div>
                </div>
            </section>

            <section class="profile-sections">
                <%--Section links to be filled--%>
            </section>

            <div class="VIP-status-ribbon">
                <p>Tài khoản của bạn còn <span>69</span> ngày VIP</p>
            </div>

            <section class="wall-profile-statcard">

                <div class="profile-level">
                    <div class="profile-level-inner">
                        <!--Level progress bar should fetch data from server or database-->
                        <label for="levelbar">Level <span>0</span></label>
                        <div class="progress">
                            <progress id="levelbar" value="30" max="100"> 1</progress>
                        </div>
                        <div class="start-end">
                            <span>0</span>
                            <span>1</span>
                        </div>
                        <p>Bạn cần 7XP để lên cấp!</p>
                    </div>
                </div>

                <div class="profile-streak">
                    <div class="profile-streak-inner">
                        <div class="profile-streak-info">
                            <div>
                                <h2>Streak <span>283</span></h2>
                                <br>
                                <p>Giữ streak của bạn hôm nay.</p>
                            </div>
                            <img src="imgs/profile_assets/flame.png" alt="Flame">
                        </div>

                        <div class="profile-streak-weekbar">
                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x on"></i>
                                <p>M</p>
                            </div>

                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x on"></i>
                                <p>Tu</p>
                            </div>

                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x"></i>
                                <p>W</p>
                            </div>

                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x"></i>
                                <p>Th</p>
                            </div>

                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x"></i>
                                <p>F</p>
                            </div>

                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x"></i>
                                <p>Sa</p>
                            </div>

                            <div class="streak-weekday">
                                <i class="fas fa-circle fa-2x"></i>
                                <p>Su</p>
                            </div>

                        </div>
                    </div>

                </div>

            </section>

            <section class="wall-profile-achievements">

                <div class="achievement-title">
                    <h1>Tất cả thành tích</h1>
                </div>

                <div class="separator"></div>

                <div class="achievement-list">

                    <div class="achievement-card">
                        <div class="achievement-cup">
                            <img src="imgs/trophy-white.png" alt="trophy">
                        </div>

                        <div class="achievement-progress">
                            <h2>Lửa rừng</h2>
                            <progress id="progress1" value="30" max="100"></progress>
                            <p>Đăng nhập 30 ngày liên tiếp</p>
                        </div>
                    </div>

                    <div class="achievement-card">
                        <div class="achievement-cup">
                            <img src="imgs/trophy-white.png" alt="trophy">
                        </div>

                        <div class="achievement-progress">
                            <h2>Cao thủ</h2>
                            <progress id="progress2" value="30" max="100"></progress>
                            <p>Hoàn thành 100 khóa học</p>
                        </div>
                    </div>

                    <div class="achievement-card">
                        <div class="achievement-cup">
                            <img src="imgs/trophy-white.png" alt="trophy">
                        </div>

                        <div class="achievement-progress">
                            <h2>Pháp sư</h2>
                            <progress id="progress3" value="30" max="100"></progress>
                            <p>Đạt điểm tuyệt đối 5 lần liên tiếp</p>
                        </div>
                    </div>

                </div>

            </section>

            <section class="wall-comment">
                <div class="comment-section">

                    <div class="comment-title">
                        <h2>Bình luận</h2>
                    </div>

                    <div class="separator"></div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>${sessionScope.loggedInUser.getUserName()} - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>${sessionScope.loggedInUser.getUserName()} - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>${sessionScope.loggedInUser.getUserName()} - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>${sessionScope.loggedInUser.getUserName()} - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>
                </div>

                <button>Xem thêm</button>
            </section>
        </div>
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
<script type="text/javascript">
    let contextPath = `${pageContext.request.contextPath}`;
    let curUserType = `${sessionScope.loggedInUser.getUserType()}`;
</script>
<script type="text/javascript" src="js/changeAvatar.js"></script>
<script>
    const profileHomeCardMini = document.querySelector('.profile-home-card-mini');
    const profileHomeDropdown = document.querySelector('.mini-profile-dropdown');

    // Default that the profile home dropdown to not show.
    profileHomeCardMini.addEventListener("click", () => {
        if (profileHomeDropdown.style.display === "") {
            profileHomeDropdown.style.display = "block";
        } else if (profileHomeDropdown.style.display === "block") {
            profileHomeDropdown.style.display = "";
        }
    });

    // initialize an empty array
    // Hide the ribbon, profile-level and profile-streak if the user is a Teacher
    let displayProfileStat = [];
    displayProfileStat.push(document.querySelector('.VIP-status-ribbon'));
    displayProfileStat.push(document.querySelector('.profile-level'));
    displayProfileStat.push(document.querySelector('.profile-streak'));
    displayProfileStat.push(document.querySelector('.wall-profile-achievements'));

    if (curUserType === "Teacher") {
        displayProfileStat.forEach((element) => {
            element.classList.add('hide');
        })
    } else if (curUserType === "Student") {
        displayProfileStat.forEach((element) => {
            if (element.classList.contains('hide'))
                element.classList.remove('hide')
        })
    }

    async function loadData(userType) {
        try {
            const response = await fetch("jsons/sectionLinks.json")
            let sectionLinkChoices = await response.json(); // We get the array of objects here
            document.querySelector(".profile-sections").innerHTML = sectionLinkChoices.find(section => section.userType === userType).sectionContent;
            console.log(sectionLinkChoices);
        } catch (error) {
            console.error("Error fetching JSON:", error);
        }
    }

    loadData(curUserType);
</script>
</body>
</html>