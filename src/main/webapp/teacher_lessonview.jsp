<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách bài học </title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/teacher-only/lessonview.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="cropperjs/cropper.css">
    <!-- Include the cropper script -->
    <script src="cropperjs/cropper.js"></script>
</head>

<body>
<div class="container">
    <nav class="top-nav">
        <div class="logo-div">
            <a class="logo" href="teacherHome.jsp">
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
                <img src="${sessionScope.loggedInUser.getAvatar()}" alt="" class="cur-avatar">
                <div class="shown-info">
                    <p class="username-profile">${sessionScope.loggedInUser.getUserName()}</p>
                    <p class="level-profile">LV1</p>
                    <p><span>0</span> thông báo mới</p>
                </div>
                <div>
                    <a href="userProfile.jsp"><img src="imgs/user/UserSettings.png" id="setting_icon" alt=""></a>
                    <ul>
                        <li class="setting-cog"><a href="index.jsp">Exit</a></li>
                    </ul>
                </div>
            </div>
            <div class="profile-home-card-mini">
                <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar"/>
                <i class="fas fa-caret-down fa-2x"></i>
                <ul class="mini-profile-dropdown">
                    <li class="settings">
                        <a href="userProfile.jsp">Settings</a>
                    </li>
                    <li class="exit">
                        <a href="index.jsp">Exit</a>
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
                <a href="home.jsp"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="#">Kĩ năng</a>
                <ul class="dropdown">
                    <li><a href="skillJSPs/skillListening.jsp">Listening</a></li>
                    <li><a href="skillJSPs/skillReading.jsp">Reading</a></li>
                    <li><a href="skillJSPs/skillWriting.jsp">Writing</a></li>
                    <li><a href="#">Grammar</a></li>
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
                            <h4>Giáo viên</h4>
                            <p>Giới tính: <span>${sessionScope.loggedInUser.getGender()}</span></p>
                            <p>Bài viết: <span>10</span></p>
                            <p>Tham gia ngày: <span>06/09/2012</span></p>
                            <p>Online cách đây: <span>Đang online</span></p>
                            <p><span>"Never gonna give you up"</span> <a href="#">[Sửa..]</a></p>
                        </div>

                    </div>

                    <div class="student-buttonside">
                        <ul class="student-buttons">
                            <li>
                                <button class="personal-info" onclick="location.href='profileShow.jsp';"><i
                                        class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân
                                </button>
                            </li>

                            <li>
                                <button class="changeavatar-button"><i class="far fa-image-polaroid fa-lg"></i>Thay đổi
                                    avatar
                                </button>
                            </li>

                            <li>
                                <button onclick="location.href='forgotpassword.jsp';"><i
                                        class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu
                                </button>
                            </li>

                            <li>
                                <button><i class="fas fa-cog fa-lg"></i>Cài đặt</button>
                            </li>

                            <li>
                                <button onclick="location.href='index.jsp';"><i class="fas fa-power-off fa-lg"></i>Thoát
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>

                <dialog class="modal" id="modal">
                    <h3>Đổi avatar</h3>
                    <img src="${sessionScope.loggedInUser.getAvatar()}" alt="" class="cur-avatar">
                    <form action="" method="dialog" enctype="multipart/form-data">
                        <div class="input-avatar">
                            <input type="file" alt="insert one" id="imageInput" accept="image/*"/>
                        </div>
                        <!-- Initially put the crop image modal to none -->
                        <button class="submit-avatar" type="submit" onclick="changeAvatar()" disabled>Submit</button>
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
                        <img src="#" alt="" id="output">
                    </div>
                    <button class="go-back">Close</button>
                    <button class="return-to-main">Close</button>
                </dialog>
                <div class="separator"></div>
            </section>

            <section class="profile-sections">

            </section>

            <%-- Author: HoLePhuongNam --%>
            <section class="viewlesson-section">
                <div class="viewlesson-title">
                    <h2>Bài học đã tạo</h2>

                    <div class="createlesson-button">
                        <i class="fas fa-feather-alt"></i>
                        <button onclick="location.href='teacher_createlesson.jsp'">Tạo mới</button>
                    </div>
                </div>

                <div class="createdlessons-section">
                    <div class="created-lesson-card" style="display: none">
                        <img src="" alt="" class="skill-icon">
                        <div class="created-lesson-info">
                            <h2 class="lesson-title"></h2>
                            <p>Ngày tạo: <span class="created-at"></span></p>
                            <p>Chỉnh sửa gần nhất : <span class="updated-at"></span></p>
                            <p>Người tạo: <span class="creator-name"></span></p>
                        </div>

                        <div class="lesson-creator-buttons">
                            <div class="lesson-view-button">
                                <i class="far fa-binoculars"></i>
                                <button>Xem</button>
                            </div>

                            <div class="lesson-edit-button">
                                <i class="fas fa-pen-alt"></i>
                                <button>Sửa</button>
                            </div>

                            <div class="lesson-delete-button">
                                <i class="fas fa-trash-alt"></i>
                                <button>Xóa</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="createdlessons-navigation">
                    <div class="navigation-buttons fa-lg">
                        <i class="fas fa-caret-left fa-lg"></i>
                        <button class="navigate-prev">Trang trước</button>
                    </div>

                    <div class="navigation-page-indicator">
                        <h2 class="indicator-num">1</h2>
                    </div>

                    <div class="navigation-buttons fa-lg">
                        <button class="navigate-next">Trang sau</button>
                        <i class="fas fa-caret-right fa-lg"></i></a>
                    </div>
                </div>
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
<script>

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
<script src="js/sortLessonsByDate.js"></script>
</body>

</html>