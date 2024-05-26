package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "HomeServlet",urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in
//        HttpSession session = request.getSession();
//        if (session != null && session.getAttribute("loggedInUser") != null) {
//            request.getRequestDispatcher("home.jsp").forward(request, response);
//        } else {
//            // If no user is logged in, redirect to the login page
//            response.sendRedirect("login.jsp");
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
    }
}
