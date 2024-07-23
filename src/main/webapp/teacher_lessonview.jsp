<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/teacher-only/lessonview.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
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
                    <a href="${pageContext.request.contextPath}/userProfile"><img src="imgs/user/UserSettings.png"
                                                                                  id="setting_icon" alt=""></a>
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
                <a href="faqs.jsp">FAQs</a>
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


                <%-- Author: HoLePhuongNam --%>
                <section class="viewlesson-section">
                    <div class="viewlesson-title">
                        <h2>Bài học đã tạo</h2>

                        <div class="createlesson-button">
                            <i class="fas fa-feather-alt"></i>
                            <button onclick="location.href='${pageContext.request.contextPath}/teacher_createlesson'">
                                Tạo mới
                            </button>
                        </div>
                    </div>
                    <%--If teacher hasn't created any lessons, show this--%>
                    <div class="notification hide">
                        <p>You haven't created any lesson yet!</p>
                    </div>
                    <div class="createdlessons-section">
                        <div class="created-lesson-card" style="display: none">
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
    <script type="text/javascript">
        let contextPath = `${pageContext.request.contextPath}`;
        let curUserType = `${sessionScope.loggedInUser.getUserType()}`;
    </script>
    <script>
        // If teacher haven't created any lessons, show him/her a message

        async function loadData(userType) {
            try {
                const response = await fetch("jsons/sectionLinks.json")
                let sectionLinkChoices = await response.json(); // We get the array of objects here
                document.querySelector(".profile-settings").innerHTML = sectionLinkChoices.find(section => section.userType === userType).sectionContent;
                console.log(sectionLinkChoices);
            } catch (error) {
                console.error("Error fetching JSON:", error);
            }
        }

        loadData(curUserType);

    </script>
    <script src="js/sortLessonsByDate.js"></script>
    <script src="js/changeAvatar.js"></script>
</div>
</body>

</html>