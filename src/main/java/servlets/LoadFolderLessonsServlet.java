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
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoadFolderLessonsServlet", value = "/actLoadAllLessons")
public class LoadFolderLessonsServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoadFolderLessonsServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle the back end for producing lesson data based on the URL, and reroute to JSPs.
        String skill = request.getParameter("skill");
        String lessonName = request.getParameter("lessonName");
        logger.log(Level.INFO, "Lesson Folder Id is" + skill);
        JdbcLessonDao lessonDao = new JdbcLessonDao();

        ArrayList<Lesson> lessonList = lessonDao.getAllLessonsWithFolder(skill);
        request.setAttribute("lessons",lessonList);
        request.setAttribute("skill",skill);
        request.getRequestDispatcher("/skills/" + skill +".jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
}