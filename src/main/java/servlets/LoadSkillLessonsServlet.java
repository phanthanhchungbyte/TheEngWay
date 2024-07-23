//package servlets;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import dao.JdbcLessonDao;
//import dao.JdbcLessonFolderDao;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//import model.Lesson;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//@WebServlet(name = "LoadSkillLessonsServlet", value = "/actLoadSkillLessons")
//public class LoadSkillLessonsServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String skill = request.getParameter("skill");
//        // Create a JdbcFolderDao and JdbcLessonDao to get the lessons
//        JdbcLessonFolderDao lessonFolderDao = new JdbcLessonFolderDao();
//        JdbcLessonDao lessonDao = new JdbcLessonDao();
//
//        if(skill != null) {
//            ArrayList<Integer> lessonFolderIds = lessonFolderDao.getLessonFolderIdWSkill(skill);
//            ArrayList<Lesson> lessons = lessonDao.getAllLessonsWithFolder(lessonFolderIds);
//            // Use ObjectMapper to turn Java objects into Javascript JSON Strings
//            ObjectMapper mapper = new ObjectMapper();
//            String jsonLessons = mapper.writeValueAsString(lessons);
//            request.setAttribute("demo_lessons", jsonLessons);
//            // For example: If skill name is Listening then the file will be skill + Listening + ".jsp"
//            request.getRequestDispatcher("skill" + skill + ".jsp").forward(request, response);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}