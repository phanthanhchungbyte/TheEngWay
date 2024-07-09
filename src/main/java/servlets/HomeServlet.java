package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "HomeServlet",urlPatterns = "/actHome")
public class HomeServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String userType = user.getUserType();
            if ("Student".equalsIgnoreCase(userType)) {
                request.getRequestDispatcher("studentHome").forward(request, response);
            } else if ("Teacher".equalsIgnoreCase(userType)) {
                request.getRequestDispatcher("teacherHome").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user type");
            }
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}