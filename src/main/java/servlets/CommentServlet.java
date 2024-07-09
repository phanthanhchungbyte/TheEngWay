package servlets;

import java.sql.Timestamp;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.JdbcCommentDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Comment;
import model.User;

import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(name ="CommentServlet", value = "/actSubmitComment")
public class CommentServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CommentServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JdbcCommentDao commentDAO = new JdbcCommentDao();
        // If there is no valid session and the create parameter is set to false, it returns null.
        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("loggedInUser");
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        String userName = user.getUserName();
        String commentContent = request.getParameter("comment-section");
        logger.log(Level.INFO, "User" + user.getUserName() + "comments: " + commentContent);
        Timestamp commentCreatedDate = new Timestamp(System.currentTimeMillis());

        Comment comment = new Comment();
        comment.setLessonId(lessonId);
        comment.setUserName(userName);
        comment.setCommentContent(commentContent);
        comment.setCommentCreatedDate(commentCreatedDate);

        commentDAO.insertComment(comment);
        ObjectMapper mapper = new ObjectMapper();

        response.getWriter().write(mapper.writeValueAsString(comment));

        // @TODO Remove because this page doesn't correlate to the lesson page
        // response.sendRedirect("skillListening"); // Redirect to the lesson page after submitting the comment
    }
}
