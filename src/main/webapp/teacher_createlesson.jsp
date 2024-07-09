<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%-- Add a favicon to the web --%>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/teacher-only/createlessonview.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="cropperjs/cropper.css">
    <!-- Include the cropper script -->
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
            <a class="logo" href="${pageContext.request.contextPath}/teacherHome">
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
                <a href="${pageContext.request.contextPath}/teacherHome"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="#">Kĩ năng</a>
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/skillListening">Listening</a></li>
                    <li><a href="${pageContext.request.contextPath}/skillReading">Reading</a></li>
                    <li><a href="${pageContext.request.contextPath}/skillWriting">Writing</a></li>
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
                            <c:set value="${sessionScope.loggedInUser.getUserType()}" var="usertype"/>
                            <c:choose>
                                <c:when test="${usertype eq 'Teacher'}">
                                    <h4>Giáo viên</h4>
                                </c:when>
                                <c:when test="${usertype eq 'Student'}">
                                    <h4>Học sinh</h4>
                                </c:when>
                                <c:otherwise>
                                    <h4>Không xác định ☹</h4>
                                </c:otherwise>
                            </c:choose>
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
                                <button class="personal-info" onclick="location.href='${pageContext.request.contextPath}/profileShow';"><i class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân</button>
                            </li>

                            <li>
                                <button class="changeavatar-button"><i class="far fa-image-polaroid fa-lg"></i>Thay đổi avatar</button>
                            </li>

                            <li>
                                <button onclick="location.href='${pageContext.request.contextPath}/forgotpassword';"><i class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu</button>
                            </li>

                            <li>
                                <button><i class="fas fa-cog fa-lg"></i>Cài đặt</button>
                            </li>

                            <li>
                                <button onclick="location.href='${pageContext.request.contextPath}/index';"><i class="fas fa-power-off fa-lg"></i>Thoát</button>
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
                        <img src="#" alt="" id="output">
                    </div>
                    <button class="go-back">Close</button>
                    <button class="return-to-main">Save</button>
                </dialog>
            </section>

            <section class="profile-sections">
                <%--To be filled in with content--%>
            </section>

            <section class="createlesson-section">
                <div class="edit-title">
                    <h1>Tạo bài học</h1>
                </div>

                <%--Set the data source here, sql jstl will be used--%>
                <sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/theengway" user="root" password="hansniemann@GOAT"/>
                <div class="edit-form-section">
                    <form>
                        <section class="skills">
                            <p>Chọn địa chỉ bài học:</p>
                            <div class="skill-config">
                                <div>
                                    <select name="skill" id="skill">
                                        <option value="Listening" selected>Nghe</option>
                                        <option value="Speaking">Nói</option>
                                        <option value="Reading">Đọc</option>
                                        <option value="Writing">Viết</option>
                                        <option value="Grammar">Ngữ pháp</option>
                                        <option value="1st">Tiếng Anh lớp 1</option>
                                        <option value="3rd">Tiếng Anh lớp 2</option>
                                        <option value="4th">Tiếng Anh lớp 3</option>
                                        <option value="2nd">Tiếng Anh lớp 4</option>
                                        <option value="5th">Tiếng Anh lớp 5</option>
                                        <option value="6th">Tiếng Anh lớp 6</option>
                                        <option value="7th">Tiếng Anh lớp 7</option>
                                        <option value="8th">Tiếng Anh lớp 8</option>
                                        <option value="9th">Tiếng Anh lớp 9</option>
                                        <option value="10th">Tiếng Anh lớp 10</option>
                                        <option value="11th">Tiếng Anh lớp 11</option>
                                        <option value="12th">Tiếng Anh lớp 12</option>
                                    </select>
                                </div>
                                <div>
                                    <select name="lesson_folder" id="lesson_folder"></select>
                                </div>
                                <div>
                                    <input type="text" placeholder="Nhập tên bài học" id="lessonName">
                                    <button class="lesson-avatar-btn">
                                        Chọn ảnh bài học
                                    </button>
                                    <dialog>
                                        Choose an avatar for the lesson
                                        <div>
                                            <img class="avatar-display" src="" alt="First avatar">
                                        </div>
                                        <ul class="avatars-container">
                                            <li><img src="https://drive.google.com/thumbnail?id=1AKwsKfHmSX0nqAVWx7KiyTY1___CDtgy" alt="First avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1TpniPrro38J01XKvZQl9wyoBy17uoXpV" alt="Second avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1uVQuOSanehVL76Lh2mIzII8pU9j5ZQjo" alt="Third avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1RJyGUX1ja29-BxGoJI7B0jQElsCgamQS" alt="Fourth avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1cFjsFp-LZkMeqlz7aVvwjXj1b8d7JCtQ" alt="Fifth avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1IvXOeS8BSLB4LTRqual0IY2lO1ZRCJNi" alt="Sixth avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1UYcbqK0awS4sz2HSfMEIsSJ_QAySB-KK" alt="Seventh avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1Uu9Q9_prukFXshBB2kEEzv_OAumpbuI1" alt="Eight avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1SXwuIZfQgeJwz9_-ZXZkZuiBze8ujip3" alt="Ninth avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=18fyG_HgdtAsv-K18sQEz5qzQVvL9LKTa" alt="Tenth avatar"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1BbZRfEehEXJhYrUNh0pUdwoxObQrMYKU" alt="Coffee Pic"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1v_FtYKXmdqarB0PLe9Eo6SfHSPIXqheO" alt="Nice Flowers"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1pbMCYWSUvKyVliQoO-aPs2rzNgBDfy_I" alt="Nice Interior CoffeePicResized"></li>
                                            <li><img src="https://drive.google.com/thumbnail?id=1Go2r4fiYjV-NoGIGiIAbf8HPyWAM_MwP" alt="Simple Home viewport"></li>
                                        </ul>
                                        <button class="save-lessonavatar">Close</button>
                                    </dialog>
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
                        <section class="createquiz-section">
                            <div>
                                <p>Tạo quiz:</p>
                                <div class="toggle">
                                    <input type="checkbox" id="quizava_checkbox" onclick="quizToggle(this)">
                                    <label for="quizava_checkbox">Thêm quiz</label>
                                </div>
                                <div class="quiz-creator quiz">
                                    <div class="button-row">
                                        <div>
                                            <button class="add">
                                                <i class="fad fa-plus fa-lg"></i>
                                                Thêm câu hỏi
                                            </button>
                                            <button class="deleteall">
                                                <i class="fal fa-eraser fa-lg" style="color: whitesmoke;"></i>
                                                Xóa toàn bộ
                                            </button>
                                        </div>
                                        <input type="number" class="navigator-input">
                                        <div class="question-navigator">
                                            /<span class="current-max">10</span>
                                        </div>
                                    </div>
                                    <div class="question-creator">
                                        <div class="left-button">
                                            <!-- For navigation -->
                                            <i class="fas fa-angle-left fa-3x"></i>
                                        </div>
                                        <div class="question-card">
                                            <p>Câu hỏi <span id="curQuestionId">1</span></p>
                                            <div class="question-part">
                                                <div>
                                                    <p>Câu hỏi</p>
                                                    <button class="update-question">
                                                        <i class="fas fa-pencil-alt fa-lg"></i>
                                                        Update question
                                                    </button>
                                                    <button class="delete-single">
                                                        <i class="fal fa-trash fa-lg"></i>
                                                        Delete
                                                    </button>
                                                </div>
                                                <textarea name="" id="question-input" rows="5"></textarea>
                                            </div>
                                            <p>Lựa chọn</p>
                                            <span class="saveQ-annotation hide">Update the question first.</span>
                                            <span class="saveQ-successful hide">Question saved successfully!</span>
                                            <span class="updateQ-successful hide">Update question successfully</span>
                                            <ol>
                                                <li>
                                                    <div class="mc-option">
                                                        <label for="inputA">A</label>
                                                        <input type="text" class="option" name="inputA" id="inputA">
                                                        <input type="checkbox">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mc-option">
                                                        <label for="inputB">B</label>
                                                        <input type="text" class="option" name="inputB" id="inputB">
                                                        <input type="checkbox">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mc-option">
                                                        <label for="inputC">C</label>
                                                        <input type="text" class="option" name="inputC" id="inputC">
                                                        <input type="checkbox">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mc-option">
                                                        <label for="inputD">D</label>
                                                        <input type="text" class="option" name="inputD" id="inputD">
                                                        <input type="checkbox">
                                                    </div>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="right-button">
                                            <!-- For navigation -->
                                            <i class="fas fa-angle-right fa-3x"></i>
                                        </div>
                                    </div>
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
<script src="plugins/tinymce/tinymce.min.js"></script>
<script src="plugins/tinymce/init-tinymce.js"></script>
<script>
    // Change sectionLinks based on userType
    let webPath = "${pageContext.request.contextPath}";
    let curUserType = "${sessionScope.loggedInUser.getUserType()}";
    async function loadData(userType) {
        try {
            const response = await fetch("jsons/sectionLinks.json");
            let sectionLinkChoices = await response.json(); // We get the array of objects here
            document.querySelector(".profile-sections").innerHTML = sectionLinkChoices.find(section => section["userType"] === userType)["sectionContent"];
        } catch (error) {
            console.error("Error fetching JSON:", error);
        }
    }
    loadData(curUserType);

    const skillSelector = document.querySelector("#skill");
    skillSelector.addEventListener("change", (event) => {
        let xhr = new XMLHttpRequest();
        let skill = encodeURIComponent(event.target.value);
        xhr.open('GET', "${pageContext.request.contextPath}/actListFolder?skill=" + skill, true);
        xhr.onload = handleLessonFolders;
        xhr.send();
    })

    function handleLessonFolders(response) {
        const data = JSON.parse(response.target.responseText);
        // console.table(data.folderlist);

        const lessonFolderElement = document.querySelector("#lesson_folder");
        lessonFolderElement.innerHTML = ''; // Clear any existing folders before appending new one

        if(data.folderlist.length === 0) {
            let folderElement = document.createElement("option");
            folderElement.setAttribute("value", "Not Available");
            folderElement.textContent = "Not available";
            folderElement.disabled = true;
            lessonFolderElement.appendChild(folderElement);
        } else {
            for(let folder of data.folderlist) {
                let folderElement = document.createElement("option");
                folderElement.setAttribute("value", folder);
                folderElement.textContent = folder;
                lessonFolderElement.appendChild(folderElement);
            }
        }

    }

    document.addEventListener("DOMContentLoaded", () => {
        // Manually trigger the change event
        const event = new Event("change");
        skillSelector.dispatchEvent(event);
    })
</script>
<script src="js/changeAvatar.js"></script>
<script src="js/createQuiz.js"></script>
<script src="js/toggleProfileHomeDropdown.js"></script>
</body>

</html>