<%@page contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/homebar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>
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
                <img src="imgs/stock-avatar.jpg" alt="">
                <div class="shown-info">
                    <p class="username-profile">${sessionScope.loggedInUser.getUserName()}</p>
                    <p class="level-profile">LV1</p>
                    <p><span>0</span> thông báo mới</p>
                </div>
                <div>
                    <a href="student_profile.jsp"><img src="imgs/user/UserSettings.png" id="setting_icon" alt=""></a>
                    <li class="setting-cog"><a href="index.jsp">Exit</a></li>
                </div>
            </div>
            <div class="profile-home-card-mini">
                <img src="imgs/stock-avatar.jpg" alt="Avatar"/>
                <i class="fas fa-caret-down fa-2x"></i>
                <ul class="mini-profile-dropdown">
                    <li class="settings">
                        <a href="student_profile.jsp">Settings</a>
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
                            <img src="imgs/stock-avatar.jpg" alt="Avatar">
                            <h2><span>JohnDoe420</span></h2>
                        </div>

                        <div class="student-bio">
                            <h4>Tiếng Anh cơ bản hoàn thành</h4>
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
                                <button><i class="fas fa-user-alt fa-lg"></i>Thông tin cá nhân</button>
                            </li>

                            <li>
                                <button><i class="far fa-image-polaroid fa-lg"></i>Thay đổi avatar</button>
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

                <div class="section-link">
                    <a href="#">Dashboard</a>
                </div>

                <div class="section-link">
                    <a href="#">Bạn bè</a>
                </div>

                <div class="section-link">
                    <a href="#">Bài tập</a>
                </div>

                <div class="section-link">
                    <a href="#">Báo cáo</a>
                </div>

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
                            <progress id="levelbar" value="30" max="100"> 1 </progress>
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
                            <img src="imgs/stock-avatar.jpg" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>JohnDoe17 - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="imgs/stock-avatar.jpg" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>JohnDoe17 - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="imgs/stock-avatar.jpg" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>JohnDoe17 - <span>17:24:46 ngày 29-11-2018</span></p>
                            <p>No comment.</p>
                        </div>
                    </div>

                    <div class="comment-bar">
                        <div class="comment-avatar">
                            <img src="imgs/stock-avatar.jpg" alt="Avatar">
                        </div>

                        <div class="comment-content">
                            <p>JohnDoe17 - <span>17:24:46 ngày 29-11-2018</span></p>
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
</body>
</html>