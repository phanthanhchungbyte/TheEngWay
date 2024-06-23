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
        JdbcUserDao dao = new JdbcUserDao();
        int otpEmail = (int) session.getAttribute("otp");
        int otp = Integer.parseInt(request.getParameter("verificationCode"));
        if (otpEmail == otp) {
            User u = (User) session.getAttribute("tk");
            String username = u.getUserName();
            String hashed_password = u.getPasswordHash();
            String saltString = u.getPasswordSalt();
            String email = u.getEmail();
            String usertype = u.getUserType();
            // Check the usertype to set the appropriate default avatar.
            String avatar = "";
            if(usertype.equals("Student")) {
                avatar = "https://drive.google.com/thumbnail?id=1lwtEx3HBcTtV0q_bJGqsZLcXGC6Or2Jk";
            } else if(usertype.equals("Teacher")) {
                avatar = "https://drive.google.com/thumbnail?id=1oe7Ttyj4PrmI9T-Z2p8-D76Fz3KcSU9A";
            }

            if (dao.insertAccount(username, hashed_password, saltString, email, usertype, avatar)) {
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