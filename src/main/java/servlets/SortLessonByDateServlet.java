//package servlets;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import dao.JdbcLessonDao;
//import dao.LessonDao;
//import jakarta.mail.Session;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.Lesson;
//import model.User;
//
//import java.io.*;
//import java.util.ArrayList;
//import java.util.Comparator;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//import static com.mysql.cj.conf.PropertyKey.logger;
//
//
//@WebServlet(name = "SortLessonByDateServlet", value = "/actSortLessonByDate")
//public class SortLessonByDateServlet extends HttpServlet {
//    private static final Logger logger = Logger.getLogger(SortLessonByDateServlet.class.getName());
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        User loggedInUser = (User) session.getAttribute("loggedInUser");
//        JdbcLessonDao lessonDao = new JdbcLessonDao();
//        ArrayList<Lesson> createdLessons = lessonDao.getAllLessonsByCreator(loggedInUser.getUserName());
//        Map<String, ArrayList<Lesson>> createdLessonsMap = new HashMap<>();
//        createdLessonsMap.put("createdLessons", createdLessons);
//        writeResponse(response, createdLessonsMap);
//    }
//
//    private static void writeResponse(HttpServletResponse resp, Map<String, ArrayList<Lesson>> createdLessonsMap) throws IOException {
//        try {
//            String jsonData = new ObjectMapper().writeValueAsString(createdLessonsMap);
//            resp.setContentType("application/json");
//            resp.setCharacterEncoding("UTF-8");
//            PrintWriter out = resp.getWriter();
//            out.println(jsonData);
//            out.flush();
//        } catch (Exception e) {
//            logger.log(Level.SEVERE, e.getMessage(), e);
//        }
//    }
//
//}
