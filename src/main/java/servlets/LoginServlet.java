package servlets;

import dao.JdbcUserDao;
import dao.UserDao;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcUserDao dao = new JdbcUserDao();
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User loggedInUser = dao.userLogin(username, password);
        if (loggedInUser != null) {
            String type = loggedInUser.getUserType();
            if (type.equalsIgnoreCase("admin")) {
                session.setAttribute("loggedInUser", loggedInUser);
                response.sendRedirect("controller.HomeServlet");
            } else {
                session.setAttribute("loggedInUser", loggedInUser);
                response.sendRedirect("controller.HomeServlet");
            }
        } else {
            request.setAttribute("loginMessage", "Sai Tài Khoản");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}