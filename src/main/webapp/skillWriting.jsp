<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
          type="text/css" />
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/skills/skill.css">
    <link rel="stylesheet" href="css/footer.css">
</head>

<body>
<div class="container">

    <nav class="top-nav">
        <div>
            <a class="logo" href="${pageContext.request.contextPath}/index">
                <img src="../../imgs/TheEngWayLogo.png" alt="The Logo">
            </a>
        </div>
        <input type="checkbox" id="nav-toggle" class="nav-toggle">
        <ul class="menu-items">
            <li class="search">
                <i class="fad fa-search"></i>
                <input class="search-bar" placeholder="Search lessons here">
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
                    <li><a href="">Tiếng Anh lớp 10</a></li>
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
        <a href="#"><img src="../../imgs/VIP-image.png" alt="VIP banner"></a>
    </div>

    <div class="skill-container">
        <div class="skill-title">
            <p>Kĩ năng</p>
            <p>Viết</p>
        </div>

        <div class="easy-card">
            <h3>Viết tiếng Anh trình độ dễ</h3>
        </div>

        <div class="mid-card">
            <h3>Viết tiếng Anh trình độ trung bình</h3>
        </div>

        <div class="hard-card">
            <h3>Viết tiếng Anh trình độ khó</h3>
        </div>
    </div>

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

<div class="clear"></div>

</div>
<script type="text/javascript">

</script>
</body>

</html>