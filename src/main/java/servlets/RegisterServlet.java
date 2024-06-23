
package servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.JdbcUserDao;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.xml.bind.DatatypeConverter;
import model.User;
import utils.SecurityUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());
    private static final String passwordRegexString = "^(?=.*[0-9])"
            + "(?=.*[a-z])(?=.*[A-Z])"
            + "(?=.*[@#$%^&+=])"
            + "(?=\\S+$).{8,20}$";
    private static final String emailRegexString = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+(@gmail.com)$";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedOperationException {
        // Password cannot be shown on the URL.
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcUserDao dao = new JdbcUserDao();
        String usertype = request.getParameter("usertype");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String field = request.getParameter("field");
        Map<String, String> responseMap = new HashMap<>();

        if (field != null) {
            switch (field) {
                case "1":
                    checkUsernameAvailable(responseMap, request, dao);
                    writeResponse(response, responseMap);
                    break;
                case "2":
                    checkPasswordValid(responseMap, request);
                    writeResponse(response, responseMap);
                    break;
                case "3":
                    checkRePasswordMatch(responseMap, request);
                    writeResponse(response, responseMap);
                    break;
                case "4":
                    checkGmailValid(responseMap, request, dao);
                    writeResponse(response, responseMap);
                    break;
            }
        } else {
            String saltString = null;
            byte[] salt = null;

            try {
                salt = SecurityUtils.getSalt();
                saltString = DatatypeConverter.printHexBinary(salt);
            } catch (Exception e) {
                logger.log(Level.SEVERE, e.getMessage(), e);
            }
            String hashed_password = SecurityUtils.getSHA_256_HashedPassword(password, salt);
            HttpSession mySession = request.getSession();
            User u = new User();
            u.setUserType(usertype);
            u.setEmail(email);
            u.setUserName(username);
            u.setPasswordHash(hashed_password);
            u.setPasswordSalt(saltString);
            u.setAvatar("");
            int otpvalue = 0 ;
            if(email!=null || !email.equals("")) {
                // sending otp
                SecureRandom rand = new SecureRandom();
                otpvalue = rand.nextInt(1255650);

                String to = email;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("bagdnh@gmail.com", "koos bjxz sczv oocb");// Put your email
                        // id and
                        // password here
                    }
                });
                // compose message
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Hello");
                    message.setText("your register OTP is: " + otpvalue);
                    // send message
                    Transport.send(message);
                    System.out.println("message sent successfully");
                }

                catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("message","OTP is sent to your email id");
                //request.setAttribute("connection", con);
                mySession.setAttribute("otp",otpvalue);
                mySession.setAttribute("tk",u);
                //request.setAttribute("status", "success");
                request.getRequestDispatcher("otp.jsp").forward(request, response);
            }

        }
    }

    public static void checkUsernameAvailable(Map<String, String> responseMap, HttpServletRequest request, JdbcUserDao dao) {
        String username = request.getParameter("username");

        // Use this if response was sent to XML HttpRequest.
        responseMap.put("field", "1");
        if (!dao.checkUsernameAvailable(username)) {
            responseMap.put("error_message1", "Username is already taken");
        } else {
            // Success case (optional)
            responseMap.put("success_message1", "Username available");
        }
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

    public static void checkGmailValid(Map<String, String> responseMap, HttpServletRequest request, JdbcUserDao dao) {
        String gmail = request.getParameter("email");

        Pattern regexPattern = Pattern.compile(emailRegexString);
        Matcher matcher = regexPattern.matcher(gmail);

        responseMap.put("field", "4");

        if (!matcher.matches()) {
            responseMap.put("error_message4", "Email address is not valid");
        } else if (!dao.checkEmailAvailable(gmail)) {
            responseMap.put("error_message4", "Email address is already taken");
        } else {
            responseMap.put("success_message4", "Good email");
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