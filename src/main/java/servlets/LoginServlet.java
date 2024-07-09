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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoginServlet",urlPatterns = "/actLogin")
public class LoginServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
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
//        Date date = loggedInUser.getDateOfBirth();
//        logger.log(Level.INFO, date.toString());

        if (loggedInUser != null) {
            session.setAttribute("loggedInUser", loggedInUser);
            String type = loggedInUser.getUserType();
            switch (type) {
                case "Admin":
                    response.sendRedirect("AdminServlet");
                    break;
                case "Student":
                    response.sendRedirect("studentHome");
                    break;
                case "Teacher":
                    response.sendRedirect("teacherHome");
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user type");
                    break;
            }
        } else {
            request.setAttribute("loginMessage", "Sai Tài Khoản");
            request.getRequestDispatcher("login").forward(request, response);
        }
    }
}