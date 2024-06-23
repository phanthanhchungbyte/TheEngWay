<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/19/2024
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="css/teacher-only/createlessonview.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="cropperjs/cropper.css">
    <script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>
    <!-- Include the cropper script -->
    <script src="cropperjs/cropper.js"></script>
</head>

<body>
<div class="container">
    <nav class="top-nav">
        <div class="logo-div">
            <a class="logo" href="home.jsp">
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
                <a href="index.jsp"><i class="far fa-home-lg-alt fa-2x"></i></a>
            </li>
            <li>
                <a href="#">Nghe</a>
                <ul class="dropdown">
                    <li><a href="#">Course 1</a></li>
                    <li><a href="#">Course 2</a></li>
                    <li><a href="#">Course 3</a></li>
                    <li><a href="#">Course 4</a></li>
                    <li><a href="#">Course 5</a></li>
                    <li><a href="#">Course 6</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Nói</a>
                <ul class="dropdown">
                    <li><a href="#">Course 1</a></li>
                    <li><a href="#">Course 2</a></li>
                    <li><a href="#">Course 3</a></li>
                    <li><a href="#">Course 4</a></li>
                    <li><a href="#">Course 5</a></li>
                    <li><a href="#">Course 6</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Đọc</a>
                <ul class="dropdown">
                    <li><a href="#">Course 1</a></li>
                    <li><a href="#">Course 2</a></li>
                    <li><a href="#">Course 3</a></li>
                    <li><a href="#">Course 4</a></li>
                    <li><a href="#">Course 5</a></li>
                    <li><a href="#">Course 6</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Viết</a>
                <ul class="dropdown">
                    <li><a href="#">Course 1</a></li>
                    <li><a href="#">Course 2</a></li>
                    <li><a href="#">Course 3</a></li>
                    <li><a href="#">Course 4</a></li>
                    <li><a href="#">Course 5</a></li>
                    <li><a href="#">Course 6</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Tổng hợp</a>
                <ul class="dropdown">
                    <li><a href="#">Course 1</a></li>
                    <li><a href="#">Course 2</a></li>
                    <li><a href="#">Course 3</a></li>
                    <li><a href="#">Course 4</a></li>
                    <li><a href="#">Course 5</a></li>
                    <li><a href="#">Course 6</a></li>
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
                                <button class="personal-info" onclick="location.href='profileShow.jsp';"><i class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân</button>
                            </li>

                            <li>
                                <button class="changeavatar-button"><i class="far fa-image-polaroid fa-lg"></i>Thay đổi avatar</button>
                            </li>

                            <li>
                                <button onclick="location.href='forgotpassword.jsp';"><i class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu</button>
                            </li>

                            <li>
                                <button><i class="fas fa-cog fa-lg"></i>Cài đặt</button>
                            </li>

                            <li>
                                <button onclick="location.href='index.jsp';"><i class="fas fa-power-off fa-lg"></i>Thoát</button>
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

                <div class="edit-form-section">
                    <form action="">
                        <section class="skills">
                            <p>Chọn địa chỉ bài học:</p>
                            <div class="skill-config">
                                <div>
                                    <select name="skill" id="skill">
                                        <option value="listening">Nghe</option>
                                        <option value="speaking">Nói</option>
                                        <option value="reading">Đọc</option>
                                        <option value="writing">Viết</option>
                                    </select>
                                </div>
                                <div>
                                    <select name="level" id="level">
                                        <option value="beginner">Trình độ cơ bản</option>
                                        <option value="intermediate">Trình độ trung cấp</option>
                                        <option value="advanced">Trình độ khó</option>
                                    </select>
                                </div>
                            </div>
                        </section>
                        <section class="lesson-content">
                            <div>
                                <p>Nội dung:</p>
                                <div class="textarea-centering">
                              <textarea name="lessonbox" id="lessonbox" rows="35">
                              </textarea>
                                </div>
                            </div>
                        </section>
                        <section class="createquiz-section">
                            <div>
                                <p>Tạo quiz:</p>
                                <div class="quiz-section">
                                    <div class="quiz-specification">
                                        <div class="config-inputdiv">
                                            <label for="title">Tiêu đề:</label>
                                            <input type="text" name="title" class="title-input" id="title">
                                        </div>
                                        <div class="config-inputdiv">
                                            <p>Nội dung:</p>
                                            <textarea id="description" name="description" rows="10"></textarea>
                                        </div>
                                        <div class="config-inputdiv">
                                            <p>Cài đặt câu hỏi</p>
                                            <div class="toggle">
                                                <input type="checkbox" id="address_checkbox">
                                                <label for="address_checkbox">Hiện đáp án sau quiz</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="quiz-creator">
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
                                        <div class="question-navigator">
                                            <input type="number" class="navigator-input">
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
                            <button class="save-draft">
                                <i class="fal fa-save fa-lg"></i>
                                Lưu bản thảo
                            </button>
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
            <img src="../../imgs/logogov.png" alt="Bộ Công thương">
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
<script src="js/createQuiz.js"></script>
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

</body>

</html>