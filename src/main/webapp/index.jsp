<%@page contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/coursenav.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/aside.css">
</head>
<body>
    <div class="container">
        <nav class="top-nav">
            <div>
                <a class="logo" href="index.jsp">
                    <img src="imgs/TheEngWayLogo.png" alt="The Logo">
                </a>
            </div>
            <input type="checkbox" id="nav-toggle" class="nav-toggle">
            <ul class="menu-items">
                <li class="search">
                    <i class="fad fa-search"></i>
                    <input class="search-bar" placeholder="Search lessons here">
                </li>
                <li> <a href="login.jsp" class="navlogin">Đăng nhập</a> </li>
                <li> <a href="register.jsp" class="registerlogin">Đăng ký</a> </li>
            </ul>
            <label for="nav-toggle" class="nav-toggle-label">
                <span></span>
            </label>
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
            <div class="content">
                <div class="card">
                    <div class="text-content">
                        <p class="skill-title">Nghe</p>
                        <p class="skill-description">
                            Luyện kĩ năng nghe với những bài học bổ ích với những video về nhiều lĩnh vực khác nhau.
                        </p>
                        <ul>
                            <li><a href="#">Art exhibition honors Mr.Trinh Cong Son</a></li>
                            <li><a href="#">Cuộc thi: Listening and Writing (số 2)</a></li>
                            <li><a href="#">Lesson 1: Welcome!</a></li>
                        </ul>
                    </div>
                    <img src="imgs/listening.png" alt="Listening">
                </div>
    
                <div class="card">
                    <div class="text-content">
                        <p class="skill-title">Nói</p>
                        <p class="skill-description">Luyện tập kĩ năng nói trong các ngữ cảnh khác nhau trong giao tiếp hằng ngày</p>
                        <ul>
                            <li><a href="#">Kĩ năng giao tiếp trong kinh doanh: How was your day off?</a></li>
                            <li><a href="#">Nghe và đọc lại bài 3</a></li>
                            <li><a href="#">Cuộc thi: Thi hát tiếng Anh (số 3)</a></li>
                        </ul>
                    </div>
                    <img src="imgs/speaking.png" alt="Speaking">
                </div>
    
                <div class="card">
                    <div class="text-content">
                        <p class="skill-title">Viết</p>
                        <p class="skill-description">Cải thiện và nâng cao khả năng viết tiêng Anh: từ cách tạo câu đúng ngữ pháp đến viết đoạn văn và bài luận ngắn</p>
                        <ul>
                            <li><a href="#">Cuộc thi: Viết luận ngắn (số 2)</a></li>
                            <li><a href="#">Học cách viết thư [Bài viết]</a></li>
                            <li><a href="#">Cuộc thi: Viết qua tranh (số 4)</a></li>
                        </ul>
                    </div>
    
                    <img src="imgs/writing.png" alt="Writing">
                </div>
    
                <div class="card">
                    <div class="text-content">
                        <p class="skill-title">Đọc</p>
                        <p class="skill-description">Rèn luyện kĩ năng đọc tiếng Anh của học sinh với nhiều bài đọc được trích từ các nguồn tiếng Anh uy tín.</p>
                        <ul>
                            <li><a href="">Meaning of life: Butterfly</a></li>
                            <li><a href="">Don Quixote and the Windmill</a></li>
                            <li><a href="">Article: Vietnam's GDP is set to increase by 1.5% by the end of this year.</a></li>
                        </ul>
                    </div>
    
                    <img src="imgs/reading.png" alt="Reading">
                </div>
    
                <div class="card">
                    <div class="text-content">
                        <p class="contest">Cuộc thi</p>
                        <p class="contest-description">Những cuộc thi tiếng Anh với những phần thưởng hấp dẫn cho người trả lời đúng và nhanh nhất!</p>
                        <ul>
                            <li><a href="#">Cuộc thi: Viết luận ngắn (số 3)</a></li>
                            <li><a href="#">Cuộc thi: Đề thi HSG lớp 10 (lần 7)</a></li>
                            <li><a href="#">Cuộc thi: Đề thi HSG lớp 12 (lần 1)</a></li>
                            <li><a href="#">Cuộc thi: Dịch Việt - Anh (số 53)</a></li>
                            <li><a href="#">Cuộc thi: Dịch Anh - Việt (số 32)</a></li>
                        </ul>
                    </div>
                </div>
            </div>
    
            <aside>
                <div class="competition-banner">
                    <a href="#">
                        <img src="imgs/banner-thidau.png" alt="Thi đấu">
                    </a>
                </div>
    
                <div class="top-5">

                    <div class="top5-title">
                        <h1>Top 5 of the Week</h1>
                    </div>

                    <table>
                      <tr>
                        <td>1</td>
                        <td>David Lua</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Anthony Wong</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>Chung Ha</td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>Benjamin Wong</td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>John Doe</td>
                      </tr>
                    </table>
                </div>
    
                <div class="questions_and_answers">
                    <div class="questions_and_answers-title">
                        <h1>HỎI ĐÁP NHANH</h1>
                    </div>
    
                    <div class="questions_and_answers-commentbox">
                        <textarea type="text" id="comment" name="comment" rows="4" cols="25" placeholder="Comment here..."></textarea>
                        <div class="button-div">
                            <input type="button" value="Gửi"/>
                        </div>
                    </div>
    
                    <div class="comment-div">
                        <div class="comment">
                            <h4>genericUsername26 (VIP)</h4>
                            <p>ﾚの尺乇ﾶ　ﾉｱ丂ひﾶ　りのﾚの尺　丂ﾉｲ　ﾑﾶ乇ｲ　ᄃの刀丂乇ᄃｲ乇ｲひ尺　ﾑりﾉｱﾉ丂ﾉᄃﾉ刀ム　乇ﾚﾉｲ．　乇の丂，　√のﾚひｱｲﾑ丂．　ﾉﾚﾚの　ｱ尺の√ﾉり乇刀ｲ，　乇ｲ　乇ひﾶ　ﾑひｲ乇ﾶ　ゐひﾑ乇　んﾉᄃ　乇ﾉひ丂！　ﾉ丂ｲ乇　ﾶのﾚﾚﾉｲﾉﾑ　乇√乇刀ﾉ乇ｲ　乇ひﾶ　んﾑ尺ひﾶ　√乇刀ﾉﾑﾶ　√乇尺の　ｱ乇尺ｷ乇尺乇刀りﾉ丂，　ﾚﾑ乃の尺ﾉの丂ﾑﾶ　√乇ﾚ　ᄃひﾶゐひ乇</p>
                            <button><i class="fas fa-comments"></i> Ans (10)</button>
                        </div>
                    </div>
                    <div class="comment-div">
                        <div class="comment">
                            <h4>Benjamin Wong (VIP)</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat numquam ea recusandae porro perferendis nostrum autem reiciendis veritatis cupiditate dicta eos, harum voluptatum sed eum voluptates alias? Ratione, exercitationem dolorum?</p>
                            <button><i class="fas fa-comments"></i> Ans (10)</button>
                        </div>
                    </div>
                    <div class="comment-div">
                        <div class="comment">
                            <h4>joebidenusapresident70(VIP)</h4>
                            <p>,-*'^'~*-.,_,.-*~   🎀  𝐿🍪𝓇𝑒𝓂 𝒾𝓅𝓈𝓊𝓂 𝒹🍪𝓁🍑𝓇 𝓈𝒾𝓉 𝒶𝓂𝑒𝓉 𝒸☯𝓃𝓈𝑒𝒸𝓉𝑒𝓉𝓊𝓇 𝒶𝒹𝒾𝓅𝒾𝓈𝒾𝒸𝒾𝓃𝑔 𝑒𝓁𝒾𝓉. 𝐸🍑𝓈, 𝓋💙𝓁𝓊𝓅𝓉𝒶𝓈. 𝐼𝓁𝓁❤ 𝓅𝓇♡𝓋𝒾𝒹𝑒𝓃𝓉, 𝑒𝓉 𝑒𝓊𝓂 𝒶𝓊𝓉𝑒𝓂 𝓆𝓊𝒶𝑒 𝒽𝒾𝒸 𝑒𝒾𝓊𝓈❣ 𝐼𝓈𝓉𝑒 𝓂🍑𝓁𝓁𝒾𝓉𝒾𝒶 𝑒𝓋𝑒𝓃𝒾𝑒𝓉 𝑒𝓊𝓂 𝒽𝒶𝓇𝓊𝓂 𝓋𝑒𝓃𝒾𝒶𝓂 𝓋𝑒𝓇💗 𝓅𝑒𝓇𝒻𝑒𝓇𝑒𝓃𝒹𝒾𝓈, 𝓁𝒶𝒷💮𝓇𝒾🍬𝓈𝒶𝓂 𝓋𝑒𝓁 𝒸𝓊𝓂𝓆𝓊𝑒  🎀 </p>
                            <button><i class="fas fa-comments"></i> Ans (10)</button>
                        </div>
                    </div>
                    <div class="questions_and_answers-page">
                        <a href="#"><button>1</button></a>
                        <a href="#"><button>2</button></a>
                        <a href="#"><button>3</button></a>
                        <a href="#"><button>...</button></a>
                    </div>
                </div>
    
                <div class="VIP-banner">
                    <a href="#"><img src="imgs/VIPadv2.png" alt="Đăng ký VIP hôm nay!"></a>
                </div>
    
                <div class="online-test">
                    <a href="#"><img src="imgs/online_test.png" alt="Thi thử online"></a>
                </div>
    
                <div class="kinh-nghiem">
                    <a href="#"><img src="imgs/bannerkinhnghiem.png" alt="Kinh nghiệm học tiếng Anh"></a>
                </div>
            </aside>
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