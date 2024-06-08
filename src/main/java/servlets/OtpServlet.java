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

@WebServlet(name = "OtpServlet", urlPatterns = "/verify-otp")
public class OtpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int otpEmail = (int) session.getAttribute("otp");
        int otp = Integer.parseInt(request.getParameter("verificationCode"));
        if (otpEmail == otp) {
            User u = (User) session.getAttribute("tk");
            String username = u.getUserName();
            String hashed_password = u.getPasswordHash();
            String saltString = u.getPasswordSalt();
            String email = u.getEmail();
            String usertype = u.getUserType();

            JdbcUserDao dao = new JdbcUserDao();
            if (dao.insertAccount(username, hashed_password, saltString, email, usertype)) {
                request.setAttribute("message", "Đăng ký thành công");
            } else {
                request.setAttribute("message", "Đăng ký thất bại");
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Mã OTP không chính xác");
            request.getRequestDispatcher("otp.jsp").forward(request, response);
        }
    }
}