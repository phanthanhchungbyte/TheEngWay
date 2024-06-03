package servlets;

import dao.JdbcUserDao;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Properties;

@WebServlet(name = "ForgotPasswordServlet", value = "/forgot")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcUserDao dao = new JdbcUserDao();
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        User us = dao.userLoginWithEmail(email);
        if(us != null){
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
                mySession.setAttribute("email",email);
                //request.setAttribute("status", "success");
                request.getRequestDispatcher("EnterOTP.jsp").forward(request, response);
            }
        }
        else {
            request.setAttribute("message", "Email khong ton tai");
        }
    }
}