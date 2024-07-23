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
    <%--  Include the cropper css  --%>
    <link rel="stylesheet" href="cropperjs/cropper.css">
    <%--  Include the cropper script  --%>
    <script src="js/searchLesson.js"></script>
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
                            <input class="search-bar" id="search-bar" name="searchString"
                                   placeholder="Search lessons here" onkeyup="searchSuggestions">
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
                <a href="${pageContext.request.contextPath}/skills/vocabulary.jsp">Từ vựng</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/grammar.jsp">Ngữ pháp</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/skills/pronunciation.jsp">Phát âm</a>
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
                <section class="createlesson-section">
                    <div class="edit-form-section">
                        <form method="post" class="quiz-form"
                              id="quizForm">
                            <section class="createquiz-section">
                                <div>
                                    <p>Tạo quiz:</p>
                                    <div class="quiztype-choose">
                                        <h1>Chọn loại quiz</h1>
                                        <select name="quiztype" id="quiztype">
                                            <!-- <option value="" default>Chọn loại quiz</option> -->
                                            <option value="mc_quiz" data-id="1" selected>Multiple choice quiz</option>
                                            <option value="matching_quiz" data-id="2">Matching quiz</option>
                                            <option value="cloze_quiz" data-id="3">Fill blank question
                                            </option>
                                        </select>
                                        <input type="hidden" name="quizTitle" id="quizTitleInput">
                                    </div>
                                    <div class="quiz-creator quiz mc_quiz">
                                        <section class="mc-quiz-title">
                                            <label for="mc-quiz-title">Tên quiz:</label>
                                            <input type="text" id="mc-quiz-title">
                                        </section>
                                        <div class="button-row">
                                            <div>
                                                <button class="add">
                                                    <i class="fad fa-plus fa-lg"></i>
                                                    Thêm câu hỏi
                                                </button>
                                                <button class="deleteall">
                                                    <i class="fal fa-eraser fa-lg" style="color: whitesmoke;"></i>
                                                    Xóa tất cả
                                                </button>
                                            </div>
                                            <div class="question-navigator">
                                                <input type="number" class="navigator-input">
                                                /<span class="current-max">10</span>
                                            </div>
                                        </div>
                                        <div class="question-creator" style="border-top-right-radius: 1px;">
                                            <div class="left-button">
                                                <!-- For navigation -->
                                                <i class="fas fa-angle-left fa-3x"></i>
                                            </div>
                                            <div class="question-card">
                                                <p style="color: black">Câu hỏi <span id="curQuestionId">1</span></p>
                                                <div class="question-part">
                                                    <div>
                                                        <p style="color: black">Câu hỏi</p>
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
                                                            <label for="inputA">D</label>
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
                                    <div class="matching_quiz quiz hide">
                                        <div class="matching-title">
                                            <label for="match-title">Tên quiz:</label>
                                            <input type="text" class="match-title" id="match-title"/>
                                        </div>
                                        <div class="matching-creation-number">
                                            <label for="match-number">Chọn số cặp từ: </label>
                                            <input type="number" class="match-number" id="match-number">
                                        </div>
                                        <div class="matching-creator">
                                            <p class="first-notification" style="margin: 0 auto; color: black;">Please
                                                type the number of word pairs</p>
                                            <div class="matching-left hide">
                                                <div class="matching-content hide">
                                                    <div class="checkbox-title">
                                                        <input type="checkbox"
                                                               class="matching-content-checkbox">
                                                        <p style="color: black">Từ 6</p>
                                                    </div>
                                                    <input type="text" class="matching-content-input">
                                                </div>
                                            </div>

                                            <div class="matching-right hide">
                                                <div class="matching-content hide">
                                                    <div class="checkbox-title">
                                                        <input type="checkbox"
                                                               class="matching-content-checkbox">
                                                        <p style="color: black">Từ 6</p>
                                                    </div>
                                                    <input type="text" class="matching-content-input">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="matchingModeDiv">
                                            <button class="matching-mode-btn">Start matching</button>
                                        </div>
                                    </div>
                                    <div class="cloze_quiz quiz hide">
                                        <section>
                                            <label for="quiz-title">Tên quiz:</label>
                                            <input type="text" id="quiz-title">
                                        </section>
                                        <div class="control-cloze-quiz">
                                            <button class="create-cloze-q">Create answer options</button>
                                            <dialog>
                                                <h1>Choose your type of cloze question</h1>
                                                <div class="select-cloze-type-div">
                                                    <select name="cloze_question_type" id="">
                                                        <option value="FILL_BLANK" selected>Fill in the blank</option>
                                                        <option value="MULTIPLE_CHOICE">Multiple choice</option>
                                                    </select>
                                                </div>

                                                <select class="num-of-options hide">
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>

                                                <p class="clozed-question" style="color: black">Clozed portion here:
                                                    <span></span></p>

                                                <ul class="option-input-div hide">
                                                    <li>
                                                        <input type="text">
                                                    </li>
                                                    <li>
                                                        <input type="text">
                                                    </li>
                                                </ul>

                                                <button>Apply</button>
                                                <div class="q_and_a_type hide">
                                                    <input type="text">
                                                </div>
                                            </dialog>

                                            <button class="view-answers">View answers</button>
                                            <dialog>
                                                <h1>View your answer here!</h1>
                                                <ul>
                                                    <li class="hide">Question 1: <span>Answer</span></li>
                                                </ul>
                                            </dialog>

                                            <button class="preview-quiz">Preview quiz</button>
                                            <dialog style="background-color: darkblue">
                                                <h1>Preview your quiz here!</h1>
                                                <div class="quiz-preview">

                                                </div>
                                            </dialog>
                                        </div>
                                        <textarea name="" class="tinymce"></textarea>
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
        <script src="plugins/tinymce/tinymce.min.js"></script>
        <script src="plugins/tinymce/init-tinymce.js"></script>
        <script type="module">
            import {MatchingQuizCreator} from './js/createMatchingQuiz.js';
            import {ClozeQuizCreator} from './js/createClozeQuiz.js';
            import {MCQuizCreator} from './js/createQuiz.js';

            let quizType = document.getElementById("quiztype");
            let mcQuizCreator = document.querySelector(".mc_quiz");
            let matchingQuizCreator = document.querySelector(".matching_quiz");
            let quizzes = document.querySelectorAll(".quiz");
            let quizObj = {};
            let curQuizType = -1;
            let clozeQuiz = null;
            let pageContext = `${pageContext.request.contextPath}`;
            changeQuizType(quizType.value);
            quizType.addEventListener("change", function () {
                let selectedOption = this.options[this.selectedIndex];
                changeQuizType(selectedOption.dataset.id);
            })

            function changeQuizType(quiztype) {
                openQuiz(quiztype)
            }

            function openQuiz(quizTypeIndex) {
                quizzes.forEach((quiz, index) => {
                    if (index === quizTypeIndex - 1) {
                        quiz.classList.remove("hide");
                    } else {
                        quiz.classList.add("hide");
                    }
                });
                curQuizType = quizTypeIndex;

                if (curQuizType.toString(10) == 1) {
                    let multipleChoiceQuiz = new MCQuizCreator(pageContext);
                } else if (curQuizType.toString(10) == 2) {
                    let matchingQuiz = new MatchingQuizCreator()
                    matchingQuiz.startQuizCreation();
                } else if (curQuizType.toString(10) == 3) {
                    let clozeButton = document.querySelector(".create-cloze-q");
                    // clozeQuiz.startQuizCreation();
                    clozeQuiz = new ClozeQuizCreator();
                    clozeButton.addEventListener("click", (e) => startClozing(e));
                }
            }

            function saveAndSendQuizData(quizData) {
                console.log(quizData);
            }

            // This function belongs to cloze quiz (3rd quiz type)
            async function startClozing(e) {
                e.preventDefault();
                let curQuestionData = tinyMCE.activeEditor.getContent(".tinymce");
                let clozeContent = tinyMCE.activeEditor.selection.getContent({format: 'text'});
                clozeQuiz.setRawQuizData(curQuestionData);
                curQuestionData = await clozeQuiz.clozeQuestion(curQuestionData, clozeContent);
                console.log(`%c${curQuestionData}`, "color: limegreen");
                tinyMCE.activeEditor.setContent(curQuestionData);
            }

            openQuiz(1);
        </script>
        <script src="js/toggleProfileHomeDropdown.js"></script>
    </div>
</div>
</body>

</html>