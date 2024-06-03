//package utils;
//
//import jakarta.mail.*;
//import jakarta.mail.internet.InternetAddress;
//import jakarta.mail.internet.MimeMessage;
//import java.util.Properties;
//
//public class EmailUtils {
//    private static final String SMTP_SERVER = "smtp.gmail.com";
//    private static final String USERNAME = "troibietdatbiet1204@gmail.com";
//    private static final String PASSWORD = "12042000quan";
//
//    public static boolean sendOtpEmail(String recipientEmail, String otp) {
//        Properties properties = new Properties();
//        properties.put("mail.smtp.host", SMTP_SERVER);
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.port", "587");
//        properties.put("mail.smtp.starttls.enable", "true");
//
//        Session session = Session.getInstance(properties, new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(USERNAME, PASSWORD);
//            }
//        });
//
//        try {
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(USERNAME));
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
//            message.setSubject("Your OTP Code");
//            message.setText("Dear user,\n\nYour OTP code is: " + otp + "\n\nThank you!");
//            Transport.send(message);
//            return true;
//        } catch (MessagingException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//}
