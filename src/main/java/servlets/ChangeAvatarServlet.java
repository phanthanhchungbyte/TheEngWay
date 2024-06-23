package servlets;

import dao.JdbcUserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ChangeAvatarServlet", value = "/changeavatar")
public class ChangeAvatarServlet extends HttpServlet {
    private final Logger logger = Logger.getLogger(this.getClass().getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String avatarURL = request.getParameter("avatar");
        JdbcUserDao dao = new JdbcUserDao();
        HttpSession session = request.getSession();

        // Get the username of the current User
        User curUser = (User) session.getAttribute("loggedInUser");
        String username = curUser.getUserName();

        // Update the avatar in the database and change the data
        dao.updateAvatar(avatarURL, username);
        // Set the avatar for the current User/
        curUser.setAvatar(avatarURL);

        request.setAttribute("message", "Avatar changed successfully!");
        try {
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while changing the avatar.");
        }
    }
}