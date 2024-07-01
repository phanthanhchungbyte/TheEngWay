package servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.JdbcLessonFolderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LessonFolderList", urlPatterns = "/listfolder")
public class LessonFolderList extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LessonFolderList.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String skill = request.getParameter("skill");
        Map<String, ArrayList<String>> responseMap = new HashMap<>();

        ArrayList<String> lessonFolders = null;
        JdbcLessonFolderDao dao = new JdbcLessonFolderDao();
        lessonFolders = dao.getLessonFoldersWSkill(skill);

        // Add the folder list to the response map.
        responseMap.put("folderlist", lessonFolders);
        writeResponse(response, responseMap);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void writeResponse(HttpServletResponse response, Map<String, ArrayList<String>> responseMap) {
        try {
            String jsonData = new ObjectMapper().writeValueAsString(responseMap);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.println(jsonData);
            out.flush();
        } catch (IOException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        }
    }

}