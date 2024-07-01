package dao;

import DBConnect.Connect;
import model.Lesson;
import utils.SqlUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcLessonDao implements LessonDao {
    private static final Logger logger = Logger.getLogger(JdbcLessonDao.class.getName());
    private static final String INSERT_LESSON_QUERY = "INSERT INTO LESSON (CREATOR_USERNAME, LESSON_TITLE, LESSON_TYPE, LESSON_FOLDER_ID, LESSON_CONTENTID, LESSON_QUIZID, CREATED_AT, UPDATED_AT, VERSION, LESSON_STATUS) " +
            "VALUE (?,?,?,?,?,?,?,?,?,?)";
    private static final String SORT_LESSONS_WITH_CREATORNAME = "select * from LESSON \n" +
                                                                "WHERE CREATOR_USERNAME = ?\n" +
                                                                "ORDER BY (`UPDATED_AT`) DESC;";


    // Author: DoanHongQuan
    @Override
    public boolean createLesson(Lesson lesson) {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(INSERT_LESSON_QUERY);
            ptm.setString(1, lesson.getCreatorName());
            ptm.setString(2, lesson.getLessonTitle());
            ptm.setString(3, lesson.getSkill());
            ptm.setInt(4, lesson.getLessonFolderId());
            ptm.setString(5, lesson.getLessonContentId());
            ptm.setString(6, lesson.getLessonQuizId());
            ptm.setTimestamp(7, lesson.getCreatedAt());
            ptm.setTimestamp(8, lesson.getUpdatedAt());
            // Version is to check if the lesson has been updated or not.
            ptm.setInt(9, lesson.getVersion());
            ptm.setString(10, lesson.getStatus());
            // Insert the lesson in the database
            return (ptm.executeUpdate() > 0);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            return false;
        } finally {
            SqlUtils.close(ptm, conn);
        }
    }

    @Override
    public ArrayList<Lesson> getAllLessonsByCreator(String creatorUsername) {
        ArrayList<Lesson> createdLessons = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(SORT_LESSONS_WITH_CREATORNAME);
            ptm.setString(1, creatorUsername);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson(
                        rs.getString("CREATOR_USERNAME"),
                        rs.getString("LESSON_TITLE"),
                        rs.getString("LESSON_CONTENTID"),
                        rs.getInt("LESSON_FOLDER_ID"),
                        rs.getString("LESSON_QUIZID"),
                        rs.getString("LESSON_TYPE"),
                        rs.getTimestamp("CREATED_AT"),
                        rs.getTimestamp("UPDATED_AT"),
                        rs.getInt("VERSION"),
                        rs.getString("LESSON_STATUS")
                );
                createdLessons.add(lesson);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            return null;
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return createdLessons;
    }
}
