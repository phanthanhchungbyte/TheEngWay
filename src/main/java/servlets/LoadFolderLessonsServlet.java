package servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.JdbcCommentDao;
import dao.JdbcLessonDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Comment;
import model.Lesson;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoadFolderLessonsServlet", value = "/actLoadAllLessons")
public class LoadFolderLessonsServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoadFolderLessonsServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle the back end for producing lesson data based on the URL, and reroute to JSPs.
        int lessonFolderId = Integer.parseInt(request.getParameter("folderId"));
        String skill = request.getParameter("skill");
        String lessonName = request.getParameter("lessonName");
        logger.log(Level.INFO, "Lesson Folder Id is" + lessonFolderId);
        JdbcLessonDao lessonDao = new JdbcLessonDao();
        JdbcCommentDao commentDao = new JdbcCommentDao();
        if (lessonName == null) {
            ArrayList<Lesson> allLessons = lessonDao.getAllLessonsWithFolder(lessonFolderId);
            String allLessonsString = new ObjectMapper().writeValueAsString(allLessons);
            request.setAttribute("all_lessons", allLessonsString);
            request.getRequestDispatcher("skill" + skill + ".jsp").forward(request, response);
        } else {
            // Get the lessonId;
            String realLessonName = lessonName.replaceAll("_", " ");
            int lessonId = lessonDao.getLessonIdWithFolderAndName(lessonFolderId, realLessonName);
            ArrayList<String> lessonData = lessonDao.getLessonDataForFetch(URLDecoder.decode(realLessonName, StandardCharsets.UTF_8), lessonFolderId);
            String allLessonData = new ObjectMapper().writeValueAsString(lessonData);

            // Get the comments for the lessons
            ArrayList<Comment> commentArrayList = commentDao.getCommentsWithLesson(lessonFolderId, lessonName);
            String allLessonComments = new ObjectMapper().writeValueAsString(commentArrayList);
            request.setAttribute("lesson_data", allLessonData);
            request.setAttribute("lesson_comments", allLessonComments);
            request.setAttribute("lesson_id", lessonId);
            request.getRequestDispatcher("skill" + skill + ".jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}