package servlets;

import dao.JdbcUserDao;
import dao.UserDao;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.xml.bind.DatatypeConverter;
import utils.SecurityUtils;

import java.io.IOException;
import java.util.logging.Logger;

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

        String salt = dao.getUserSalt(username);
        byte[] newsalt = DatatypeConverter.parseHexBinary(salt);
        String hashedPassword = SecurityUtils.getSHA_256_HashedPassword(password, newsalt);

        User loggedInUser = dao.userLogin(username, hashedPassword);
        if (loggedInUser != null) {
            String type = loggedInUser.getUserType();
            if (type.equalsIgnoreCase("admin")) {
                session.setAttribute("loggedInUser", loggedInUser);
                response.sendRedirect("AdminServlet");
            } else {
                session.setAttribute("loggedInUser", loggedInUser);
                response.sendRedirect("home.jsp");
            }
        } else {
            request.setAttribute("loginMessage", "Sai Tài Khoản");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}