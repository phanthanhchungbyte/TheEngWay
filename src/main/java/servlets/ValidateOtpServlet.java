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
        int value=Integer.parseInt(request.getParameter("otp"));
        HttpSession session=request.getSession();
        int otp=(int)session.getAttribute("otp");
        String emails = (String)session.getAttribute("email");
        RequestDispatcher dispatcher ;


        if (value==otp)
        {
            request.setAttribute("email", emails);
            request.setAttribute("status", "success");
            dispatcher=request.getRequestDispatcher("newpassword");
            dispatcher.forward(request, response);
        }
        else
        {
            request.setAttribute("message","wrong otp");
            dispatcher=request.getRequestDispatcher("EnterOTP.jsp");
            dispatcher.forward(request, response);
        }
    }
}