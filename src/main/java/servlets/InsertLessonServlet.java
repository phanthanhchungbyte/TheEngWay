package servlets;

import dao.JdbcLessonDao;
import dao.JdbcLessonFolderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Lesson;
import model.User;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "InsertLessonServlet", value = "/actCreateLesson")
@MultipartConfig // For the servlet to handle multipart/form-data
public class InsertLessonServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(InsertLessonServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("doGet is not supported here");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcLessonDao dao = new JdbcLessonDao();
        JdbcLessonFolderDao folderDao = new JdbcLessonFolderDao();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        try {
            // Try writing to a file instead of logging
            String lessonId = request.getParameter("lessonId");
            logger.log(Level.INFO, "lessonId: " + lessonId);
            String quizId = request.getParameter("quizId");
            logger.log(Level.INFO, "quizId: " + quizId);
            String skill = request.getParameter("skill");
            logger.log(Level.INFO, "skill: " + skill);
            String lessonAvatar = request.getParameter("lessonAvatarURL");
            // Decode the URL because the URL was encoded in the before sending here
            lessonAvatar = URLDecoder.decode(lessonAvatar, StandardCharsets.UTF_8);
            String lessonFolder = request.getParameter("lessonFolder");
            logger.log(Level.INFO, "Lesson folder: " + lessonFolder);
            String lessonTitle = request.getParameter("lessonTitle");
            logger.log(Level.INFO, "Lesson title: " + lessonTitle);

            int folderId = folderDao.getLessonFolderId(skill, lessonFolder);

            Lesson lesson = new Lesson();
            lesson.setCreatorName(loggedInUser.getUserName());
            lesson.setLessonTitle(lessonTitle);
            lesson.setLessonFolderId(folderId);
            lesson.setLessonAvatarURL(lessonAvatar);
            lesson.setLessonContentId(lessonId);

            lesson.setLessonQuizId(quizId);
            lesson.setSkill(skill);
            lesson.setVersion(1);
            lesson.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
            lesson.setUpdatedAt(Timestamp.valueOf(LocalDateTime.now()));
            lesson.setStatus("Approved");
            dao.createLesson(lesson);

            response.sendRedirect("teacher_lessonview");
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        }
    }
}