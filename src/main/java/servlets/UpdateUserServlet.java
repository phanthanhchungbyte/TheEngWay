package servlets;

import dao.JdbcUserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "UpdateUserServlet", value = "/actUpdate")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Phương thức GET không được sử dụng trong trường hợp này.
        // Bạn có thể đưa người dùng về trang nào đó nếu cần.
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            response.sendRedirect("login");
            return;
        }

        // Initialize DAO
        JdbcUserDao dao = new JdbcUserDao();

        // Retrieve parameters from the request
        String fullName = request.getParameter("full_name");
        String dobStr = request.getParameter("date_of_birth");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Validate and parse input
        Date dob = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(dobStr);
            dob = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Call DAO to update user
        boolean success = dao.updateUserProfile(fullName, dob, gender, address, phone, loggedInUser.getUserID());
        // Manually set the loggedInUser profile to tyhe specified things.
        loggedInUser.setFullName(fullName);
        loggedInUser.setDateOfBirth(dob);
        loggedInUser.setGender(gender);
        loggedInUser.setAddress(address);
        loggedInUser.setPhoneNumber(phone);

        // Forward to a confirmation page or back to the form with error message
        if (success) {
            response.sendRedirect("userProfile"); // Redirect to the user's profile page
        } else {
            request.setAttribute("errorMessage", "Failed to update user information.");
            request.getRequestDispatcher("student_profileedit").forward(request, response); // Forward back to the form
        }
    }
}
