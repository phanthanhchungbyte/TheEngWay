package dao;

import DBConnect.Connect;
import model.Comment;
import utils.SqlUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcCommentDao implements CommentDao {
    private static final Logger logger = Logger.getLogger(JdbcCommentDao.class.getName());
    private static final String INSERT_INTO_COMMENT = "INSERT INTO COMMENT (LESSONID, USERNAME, COMMENT_CONTENT, COMMENT_TIMESTAMP) VALUES (?, ?, ?, ?)";
    private static final String GET_COMMENTS_WITH_LESSON =  "SELECT * FROM comment\n" +
                                                            "WHERE LESSONID = (\n" +
                                                            "    SELECT LESSONID FROM lesson\n" +
                                                            "    WHERE LESSON_FOLDER_ID = ? AND LESSON_TITLE = ?\n" +
                                                            ") ORDER BY COMMENT_TIMESTAMP DESC;\n";

    @Override
    public void insertComment(Comment comment) {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(INSERT_INTO_COMMENT);
            ptm.setInt(1, comment.getLessonId());
            ptm.setString(2, comment.getUserName());
            ptm.setString(3, comment.getCommentContent());
            ptm.setTimestamp(4, comment.getCommentCreatedDate());
            ptm.executeUpdate();
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm);
        }
    }

    @Override
    public ArrayList<Comment> getCommentsWithLesson(int lessonFolderId, String lessonName) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_COMMENTS_WITH_LESSON);
            ptm.setInt(1, lessonFolderId);
            ptm.setString(2, lessonName);
            rs = ptm.executeQuery();
            ArrayList<Comment> comments = new ArrayList<>();
            while (rs.next()) {
                Comment comment = new Comment(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5)
                );
                comments.add(comment);
            }
            return comments;
        } catch(SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            return null;
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
    }
}
