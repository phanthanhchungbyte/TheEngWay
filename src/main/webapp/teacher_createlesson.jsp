<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/teacher-only/createlessonview.css">
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
                <section class="createlesson-section">
                    <div class="edit-title">
                        <h1>Tạo bài học</h1>
                        <a href="${pageContext.request.contextPath}/teacher_createquiz">
                            <button>Tạo quiz</button>
                        </a>
                    </div>

                    <div class="edit-form-section">
                        <form>
                            <section class="skills">
                                <p>Chọn địa chỉ bài học</p>
                                <div class="skill-config">
                                    <div>
                                        <select name="skill" id="skill">
                                            <option value="Vocabulary" selected>Từ vựng</option>
                                            <option value="Listening">Nghe</option>
                                            <option value="Pronunciation">Phát âm</option>
                                            <option value="Reading">Đọc</option>
                                            <option value="Writing">Viết</option>
                                            <option value="Grammar">Ngữ pháp</option>
                                        </select>
                                    </div>
                                    <div>
                                        <input type="text" placeholder="Nhập tên bài học" id="lessonName">
                                    </div>
                                </div>
                            </section>

                            <section class="lesson-content">
                                <div>
                                    <p>Nội dung:</p>
                                    <div class="textarea-centering">
                                        <textarea name="lessonbox" id="lessonbox" rows="35"></textarea>
                                    </div>
                                </div>
                            </section>

                            <section class="submitbutton-row">
                                <button class="save-and-submit" type="submit">
                                    <i class="fas fa-check fa-lg"></i>
                                    Đăng ngay
                                </button>
                            </section>
                        </form>
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
        <script>
            //TODO: SCRIPT TO ADD NEW LESSON TO THE SERVER, RESOURCES ARE STORED LOCALLY ON THE LESSONS FOLDER.
            // Script to get the lesson content and upload it to server to make a new file
            document.addEventListener("DOMContentLoaded", () => {
                let button = document.querySelector(".save-and-submit");
                button.addEventListener("click", submitLesson)
            })

            function submitLesson(e) {
                // Make an AJAX request to the servlet for additional checks
                e.preventDefault();
                let value = document.getElementById("lessonName").value;
                // Get the lesson type
                let lessonType = document.getElementById("skill").value;
                if(value === "") {
                    alert("Lesson name must not be empty!");
                    // Early return to avoid future errors
                    return;
                }

                let lessonContent = tinyMCE.activeEditor.getContent();
                // Make AJAX request
                let request = new XMLHttpRequest();
                let sendData = new FormData;
                sendData.append("lesson-title", value);
                sendData.append("lesson-content", lessonContent);
                sendData.append("lesson-type", lessonType);
                request.open("POST", `${pageContext.request.contextPath}/actAddNewLesson`);

                // Set up a callback to handle the response
                request.onreadystatechange = function() {
                    if(request.readyState === 4 && request.status === 200) {
                        console.log(request.responseText);
                    }
                }

                // Send the request
                request.send(sendData);
            }
        </script>
        <script src="plugins/tinymce/tinymce.min.js"></script>
        <script src="plugins/tinymce/init-tinymce.js"></script>
        <script src="js/toggleProfileHomeDropdown.js"></script>
    </div>
</div>
</body>

</html>