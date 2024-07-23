package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ValidateOtp", value = "/actValidate")
public class ValidateOtpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = 0;
        try {
            value = Integer.parseInt(request.getParameter("otp"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid otp");
            request.getRequestDispatcher("EnterOTP.jsp").forward(request, response);
        }
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        String emails = (String) session.getAttribute("email");
        RequestDispatcher dispatcher;

        if (value == otp) {
            response.sendRedirect("newpassword");
        } else {
            request.setAttribute("message", "wrong otp");
            dispatcher = request.getRequestDispatcher("EnterOTP.jsp");
            dispatcher.forward(request, response);
        }
    }
}