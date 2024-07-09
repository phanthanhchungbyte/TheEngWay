package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "CheckLoggedInServlet", value = "/checkLoggedIn")
public class CheckLoggedInServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CheckLoggedInServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String loggedIn =  session.getAttribute("loggedIn").toString();

        logger.log(Level.INFO, "Logged in: " + loggedIn);
        if(loggedIn.equals("true")) {
            response.setContentType("text/plain");
            response.getWriter().write("true");
        } else if(loggedIn.equals("false")) {
            response.setContentType("text/plain");
            response.getWriter().write("false");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}