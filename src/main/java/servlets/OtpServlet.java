package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.JdbcUserDao;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "OtpServlet", urlPatterns = "/actVerifyOTP")
public class OtpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        JdbcUserDao dao = new JdbcUserDao();
        int otpEmail = (int) session.getAttribute("otp");
        int otp = Integer.parseInt(request.getParameter("verificationCode"));
        if (otpEmail == otp) {
            User u = (User) session.getAttribute("tk");
            String username = u.getUserName();
            String hashed_password = u.getPasswordHash();
            String saltString = u.getPasswordSalt();
            String email = u.getEmail();
            // Check the usertype to set the appropriate default avatar.
            String avatar = "";
            avatar = "https://drive.google.com/thumbnail?id=1alzYgzpsKv9ATg7mQE6SCtDDmeKZ779b";
            String usertype = "Student";

            if (dao.insertAccount(username, hashed_password, saltString, email, usertype, avatar)) {
                response.sendRedirect("login");
            } else {
                response.sendRedirect("otp");
            }
        } else {
            response.sendRedirect("otp");
        }
    }
}