package servlets;

import com.google.gson.Gson;
import dao.JdbcLessonDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lesson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/actSearchLessonServlet")
public class SearchLessonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchString = request.getParameter("searchString");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();

        if (searchString != null && !searchString.trim().isEmpty()) {
            JdbcLessonDao lessonDAO = new JdbcLessonDao();
            List<Lesson> lessons = lessonDAO.searchLessonsByTitle(searchString);

            if (lessons.isEmpty()) {
                Map<String, String> message = new HashMap<>();
                request.setAttribute("lessons",lessons);
                request.getRequestDispatcher("notFound.jsp").forward(request,response);
            } else {
               request.setAttribute("lessons",lessons);
               request.getRequestDispatcher("searchList.jsp").forward(request,response);
            }
            out.flush();
        } else {
            Map<String, String> message = new HashMap<>();
            message.put("message", "Vui lòng nhập từ khóa tìm kiếm");
            out.print(gson.toJson(message));
            out.flush();
        }
    }
}