<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/editprofile.css">
    <link rel="stylesheet" href="css/footer.css">
    <scrip href="js/searchLesson.js"></scrip>
    <!-- Include the cropper css -->
    <link rel="stylesheet" href="cropperjs/cropper.css">
    <script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>
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
            <a class="logo" href="${pageContext.request.contextPath}/home">
                <img src="imgs/TheEngWayLogo.png" alt="The Logo">
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
                <img src="${sessionScope.loggedInUser.getAvatar()}" alt="" class="cur-avatar">
                <div class="shown-info">
                    <p class="username-profile">${sessionScope.loggedInUser.getUserName()}</p>
                    <p class="level-profile">LV1</p>
                    <p><span>0</span> thông báo mới</p>
                </div>
                <div>
                    <a href="userProfile"><img src="imgs/user/UserSettings.png" id="setting_icon" alt=""></a>
                    <li class="setting-cog"><a href="${pageContext.request.contextPath}/index">Exit</a></li>
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

            <section class="wall-student-card">

                <div class="student-maininfo">

                    <div class="student-info">

                        <div class="student-avatar">
                            <img src="${sessionScope.loggedInUser.getAvatar()}" alt="Avatar">
                            <h2><span>${sessionScope.loggedInUser.getUserName()}</span></h2>
                        </div>

                    </div>

                    <div class="student-buttonside">
                        <ul class="student-buttons">
                            <li>
                                <button><i class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân</button>
                            </li>

                            <li>
                                <button class="changeavatar-button"><i class="far fa-image-polaroid fa-lg"></i>Thay đổi avatar</button>
                            </li>

                            <li>
                                <button><i class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu</button>
                            </li>

                            <li>
                                <button><i class="fas fa-cog fa-lg"></i>Cài đặt</button>
                            </li>

                            <li>
                                <button><i class="fas fa-power-off fa-lg"></i>Thoát</button>
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
                    <button class="go-back"></button>
                    <button class="return-to-main">Close</button>
                </dialog>
            </section>

            <section class="profile-sections">

                <div class="section-link">
                    <a href="#">Dashboard</a>
                </div>

                <div class="section-link">
                    <a href="#">Bạn bè</a>
                </div>

                <div class="section-link">
                    <a href="#">Bình luận</a>
                </div>

                <%--                <div class="section-link">--%>
                <%--                    <a href="#">Báo cáo</a>--%>
                <%--                </div>--%>

            </section>

            <section class="edit-section">
                <div class="edit-title">
                    <h2>Chỉnh sửa thông tin</h2>
                </div>

                <div class="edit-form-section">
                    <form action="${pageContext.request.contextPath}/actUpdate" method="post">
                        <div class="input-row">
                            <label for="full_name">Tên đầy đủ:</label>
                            <input type="text" name="full_name" id="full_name">
                            <div class="toggle">
                                <input type="checkbox" id="full_name_checkbox"
                                       value="${sessionScope.loggedInUser.getDateOfBirth()}">
                                <label for="full_name_checkbox">Ẩn</label>
                            </div>
                        </div>

                        <div class="input-row">
                            <label for="date_of_birth">Ngày sinh:</label>
                            <input type="date" name="date_of_birth" id="date_of_birth"
                                   value="${sessionScope.loggedInUser.getDateOfBirth()}">
                            <div class="toggle">
                                <input type="checkbox" id="dob_checkbox">
                                <label for="dob_checkbox">Ẩn</label>
                            </div>
                        </div>

                        <div class="gender-row">
                            <div>
                                <p for="gender">Giới tính</p>
                            </div>

                            <div class="button-group">
                                <div>
                                    <input type="radio" id="Male" name="gender" value="Nam" checked>
                                    <label for="Male">Nam</label>
                                </div>

                                <div>
                                    <input type="radio" id="Female" name="gender" value="Nữ">
                                    <label for="Female">Nữ</label>
                                </div>
                            </div>
                        </div>

                        <div class="input-row">
                            <label for="address">Địa chỉ:</label>
                            <input type="text" name="address" id="address">
                            <div class="toggle">
                                <input type="checkbox" id="address_checkbox"
                                       value="${sessionScope.loggedInUser.getAddress()}">
                                <label for="address_checkbox">Ẩn</label>
                            </div>
                        </div>

                        <div class="input-row">
                            <label for="phone">Số ĐT:</label>
                            <input type="tel" name="phone" id="phone">
                            <div class="toggle">
                                <input type="checkbox" id="phone_checkbox"
                                       value="${sessionScope.loggedInUser.getPhoneNumber()}">
                                <label for="phone_checkbox">Ẩn</label>
                            </div>
                        </div>

                        <div class="input-row">
                            <label for="email">Email:</label>
                            <input type="email" name="email" id="email">
                            <div class="toggle">
                                <input type="checkbox" id="email_checkbox"
                                       value="${sessionScope.loggedInUser.getEmail()}" disabled>
                                <label for="email_checkbox">Ẩn</label>
                            </div>
                        </div>

                        <div class="submit-button">
                            <button type="submit">Lưu thông tin</button>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>

    <div class="clear"></div>

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

<%--Get user state without using JSTL--%>
<script type="text/javascript">
    let contextPath = `${pageContext.request.contextPath}`;
    let curUserType = `${sessionScope.loggedInUser.getUserType()}`;
</script>
<script type="text/javascript" src="js/changeAvatar.js"></script>
<script>
    const profileHomeCardMini = document.querySelector('.profile-home-card-mini');
    const profileHomeDropdown = document.querySelector('.mini-profile-dropdown');

    // Default that the profile home dropdown to not show
    profileHomeCardMini.addEventListener("click", () => {
        if(profileHomeDropdown.style.display === "") {
            profileHomeDropdown.style.display = "block";
        } else if(profileHomeDropdown.style.display === "block") {
            profileHomeDropdown.style.display = "";
        }
    })

    console.log(curUserType);
    if(curUserType === "Teacher") {
        let studentPart = document.querySelector(".student-profile");
        studentPart.removeChild(document.querySelector(".VIP-status-ribbon"));
        studentPart.removeChild(document.querySelector(".wall-profile-statcard"));
    }
</script>
</body>
</html>
