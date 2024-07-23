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
<div>
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
                        <i class="fad fa-search"></i>
                        <input class="search-bar" placeholder="Search lessons here">
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
                    <a href="${pageContext.request.contextPath}/userProfile"><img src="imgs/user/UserSettings.png" id="setting_icon" alt=""></a>
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

        <section class="student-profile">
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
                    <li >
                        <button onclick="location.href='${pageContext.request.contextPath}/student_profileedit.jsp'"><i class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân</button>
                    </li>

                    <li>
                        <button class="changeavatar-button"><i class="far fa-image-polaroid fa-lg"></i>Thay đổi avatar</button>
                    </li>

                    <li>
                        <button onclick="location.href='${pageContext.request.contextPath}/newpassword.jsp'"><i class="fas fa-lock-alt fa-lg"></i>Thay đổi mật khẩu</button>
                    </li>

                    <li>
                        <button onclick="location.href='${pageContext.request.contextPath}/index'"><i class="fas fa-power-off fa-lg"></i>Thoát</button>
                    </li>
                </ul>

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

                <section class="student-info">
                    <ul>
                        <li>
                            <p>Tên đầy đủ:</p>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.getFullName() ne null}">
                                    <span>${sessionScope.loggedInUser.getFullName()}</span>
                                </c:when>

                                <c:otherwise>
                                    <span><i style="color: gray;">Not set yet</i></span>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li>
                            <p>Ngày sinh:</p>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.getDateOfBirth() ne null}">
                                    <span>${sessionScope.loggedInUser.getDateOfBirthString()}</span>
                                </c:when>

                                <c:otherwise>
                                    <span><i style="color: gray;">Not set yet</i></span>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li>
                            <p>Giới tính:</p>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.getGender() ne null}">
                                    <span>${sessionScope.loggedInUser.getGender()}</span>
                                </c:when>

                                <c:otherwise>
                                    <span><i style="color: gray;">Not set yet</i></span>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li>
                            <p>Địa chỉ:</p>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.getAddress() ne null}">
                                    <span>${sessionScope.loggedInUser.getAddress()}</span>
                                </c:when>

                                <c:otherwise>
                                    <span><i style="color: gray;">Not set yet</i></span>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li>
                            <p>Số điện thoại:</p>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.getPhoneNumber() ne null}">
                                    <span>${sessionScope.loggedInUser.getPhoneNumber()}</span>
                                </c:when>

                                <c:otherwise>
                                    <span><i style="color: gray;">Not set yet</i></span>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li class="profile-row">
                            <span>Email:</span>
                            <span>${sessionScope.loggedInUser.getEmail()}</span>
                        </li>
                    </ul>
                </section>
            </div>

        </section>
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
</div>
<script src="js/changeAvatar.js"></script>
<script>
    let usertype = `${sessionScope.loggedInUser.getUserType()}`
    let profileSettings = document.querySelector(".profile-settings");
    fetch("jsons/sectionLinks.json")
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if(usertype === "Student") {
                for(let section of data){
                    if(section.userType === "Student") profileSettings.innerHTML = section.sectionContent;
                }
            } else if(usertype === "Admin") {
                for(let section of data){
                    if(section.userType === "Admin") profileSettings.innerHTML = section.sectionContent;
                }
            }
        });
    // // sectionLinks.forEach((section) => {
    // //     console.log(section);
    // /
</script>
</body>
</html>