package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RedirectServlet", value = "/redirect")
public class RedirectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User checkLoginUser = (User) request.getSession().getAttribute("loggedInUser");
        String pageToRedirect = request.getParameter("page");
        // Check if the user wants to logout;
        String logoutConfirmation = request.getParameter("logout");

        if (pageToRedirect.equals("index") && logoutConfirmation.equals("true")) {

            logOut(request);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            System.out.println("Session invalidated");
            return;

        } else if (checkLoginUser == null) {

            if (redirectToLogin(request, response, pageToRedirect)) {

                response.sendRedirect("login");
                // Only redirect once, not caught in an infinite loop
//                request.setAttribute("redirected", true);
                return;

            }

        }

        request.setAttribute("redirected", false);
        request.getRequestDispatcher(pageToRedirect + ".jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private static void logOut(HttpServletRequest request) {

        HttpSession curSession = request.getSession(false);
        curSession.invalidate();

    }

    private static boolean redirectToLogin(HttpServletRequest request, HttpServletResponse response, String pageToRedirect) throws IOException {
        List<String> pageListToRedirect = List.of(
                "profileShow", "student_profileedit",
                "studentHome", "teacher_createlesson", "teacher_createquiz",
                "teacher_lessonview", "teacherHome", "userProfile", "profileFriends",
                "profileComments", "lessonDetail"
        );
        if (pageListToRedirect.contains(pageToRedirect)) {
            return true;
        }
        return false;
    }
}