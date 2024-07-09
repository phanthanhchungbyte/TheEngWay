package servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.JdbcUserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.xml.bind.DatatypeConverter;
import utils.SecurityUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "NewPassword", value = "/actNewPassword")
public class NewPasswordServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());
    private static final String passwordRegexString = "^(?=.*[0-9])"
            + "(?=.*[a-z])(?=.*[A-Z])"
            + "(?=.*[@#$%^&+=])"
            + "(?=\\S+$).{8,20}$";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcUserDao dao = new JdbcUserDao();
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("email");
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("repassword");
        String field = request.getParameter("field");
        Map<String, String> responseMap = new HashMap<>();
        if(field != null) {
            switch(field) {
                case "2":
                    checkPasswordValid(responseMap, request);
                    writeResponse(response, responseMap);
                    break;
                case "3":
                    checkRePasswordMatch(responseMap, request);
                    writeResponse(response, responseMap);
                    break;
            }
        }

        RequestDispatcher dispatcher = null;
        Logger logger = Logger.getLogger(RegisterServlet.class.getName());
        if (newPassword.equals(confPassword) && checkPasswordValid(newPassword)){
            // Hash the new password
            String saltString = null;
            byte[] salt = null;

            try {
                salt = SecurityUtils.getSalt();
                saltString = DatatypeConverter.printHexBinary(salt);
            } catch (Exception e) {
                logger.log(Level.SEVERE, e.getMessage(), e);
            }
            String hashed_password = SecurityUtils.getSHA_256_HashedPassword(newPassword, salt);

            if(dao.updatePassword(hashed_password, saltString, email)){
                try {
                    request.setAttribute("message","Thay doi mat khau thanh cong");
                    dispatcher = request.getRequestDispatcher("login");
                    dispatcher.forward(request,response);
                } catch (IOException | ServletException e) {
                    logger.log(Level.SEVERE, e.getMessage(), e);
                }
            }
        } else {
            try {
                request.setAttribute("message", "Your password is incorrect");
                dispatcher = request.getRequestDispatcher("newpassword");
                dispatcher.forward(request, response);
            } catch (IOException | ServletException e) {
                logger.log(Level.SEVERE, e.getMessage(), e);
            }
        }
    }

    public static boolean checkPasswordValid(String password) {
        // Ise t
        Pattern regexPattern = Pattern.compile(passwordRegexString);
        Matcher matcher = regexPattern.matcher(password);

        // Success case
        return matcher.matches();
    }

    public static void checkPasswordValid(Map<String, String> responseMap, HttpServletRequest request) {
        String password = request.getParameter("password");

        // Use this if response was sent to XML HttpRequest.
        // Check if password matches the regex (used for validation and safety purpose)
        Pattern regexPattern = Pattern.compile(passwordRegexString);
        Matcher matcher = regexPattern.matcher(password);

        responseMap.put("field", "2");
        if (!matcher.matches()) {
            responseMap.put("error_message2", "Password must be at least 8 characters and has at least" +
                    "\n - 1 uppercase letter" +
                    "\n - 1 digit" +
                    "\n - 1 special character");
        } else {
            // Success case
            responseMap.put("success_message2", "Good password");
        }
    }

    public static void checkRePasswordMatch(Map<String, String> responseMap, HttpServletRequest request) {
        String password = request.getParameter("password");
        String rePassword = request.getParameter("confirm-password");

        responseMap.put("field", "3");
        if (!password.equals(rePassword)) {
            responseMap.put("error_message3", "Passwords do not match");
        } else {
            responseMap.put("success_message3", "Passwords match");
        }
    }

    public static void writeResponse(HttpServletResponse response, Map<String, String> responseMap) {
        try {
            String jsonData = new ObjectMapper().writeValueAsString(responseMap);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.println(jsonData);
            out.flush();
        } catch (IOException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        }
    }
}