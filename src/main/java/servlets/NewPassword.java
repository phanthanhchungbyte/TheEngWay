package servlets;

import dao.JdbcUserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "NewPassword", value = "/newpassword")
public class NewPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcUserDao dao = new JdbcUserDao();
        HttpSession session = request.getSession();
        String emails = (String)session.getAttribute("email");
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                if(dao.UpdatePassword(newPassword, emails)){
                    request.setAttribute("message","Thay doi mat khau thanh cong");
                    request.getRequestDispatcher("loginform.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}