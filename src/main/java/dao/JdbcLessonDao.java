package dao;

import DBConnect.Connect;
import model.Lesson;
import utils.SqlUtils;

import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcLessonDao implements LessonDao {
    private static final Logger logger = Logger.getLogger(JdbcLessonDao.class.getName());
    private static final String INSERT_LESSON_QUERY = "INSERT INTO LESSON (CREATOR_USERNAME, LESSON_TITLE, LESSON_TYPE, CREATED_AT, UPDATED_AT) " +
            "VALUE (?,?,?,?,?)";

    private static final String GET_ALL_LESSONS_FOR_SKILL = "SELECT *\n" +
            "FROM LESSON\n" +
            "WHERE LOWER(LESSON_TYPE) = LOWER(?)\n" +
            "ORDER BY UPDATED_AT DESC\n";
    private static final String GET_LESSON_BY_ID = "SELECT * FROM LESSON WHERE lessonId = ?";
private static final String SEARCH_LESSONS_BY_TITLE= "SELECT * FROM LESSON WHERE LESSON_TITLE LIKE ?";
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
            ptm.setTimestamp(4, Timestamp.from(Instant.now()));
            ptm.setTimestamp(5, Timestamp.from(Instant.now()));
            // Version is to check if the lesson has been updated or not.
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
    public ArrayList<Lesson> getAllLessonsWithFolder(String lessonSkill) {
        ArrayList<Lesson> createdLessons = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_ALL_LESSONS_FOR_SKILL);
            ptm.setString(1, lessonSkill);
            rs = ptm.executeQuery();
            while(rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonId(rs.getInt("LESSONID"));
                lesson.setCreatorName(rs.getString("CREATOR_USERNAME"));
                lesson.setLessonTitle(rs.getString("LESSON_TITLE"));
                lesson.setSkill(rs.getString("LESSON_TYPE"));
                lesson.setCreatedAt(rs.getTimestamp("CREATED_AT"));
                lesson.setUpdatedAt(rs.getTimestamp("UPDATED_AT"));
                createdLessons.add(lesson);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return createdLessons;
    }
    public Lesson getLessonById(int lessonId) {
        Lesson lesson = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement("SELECT * FROM LESSON WHERE lessonId = ?");
            ptm.setInt(1, lessonId);
            rs = ptm.executeQuery();
            if (rs.next()) {
                lesson = new Lesson(
                        rs.getInt("lessonId"),
                        rs.getString("CREATOR_USERNAME"),
                        rs.getString("LESSON_TITLE"),
                        rs.getString("LESSON_TYPE"),
                        rs.getTimestamp("CREATED_AT"),
                        rs.getTimestamp("UPDATED_AT")
                );
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return lesson;
    }


    @Override
    public ArrayList<Lesson> searchLessonsByTitle(String searchString) {
        ArrayList<Lesson> lessons = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(SEARCH_LESSONS_BY_TITLE);
            ptm.setString(1, "%" + searchString + "%");
            rs = ptm.executeQuery();

            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonId(rs.getInt("LESSONID"));
                lesson.setLessonTitle(rs.getString("LESSON_TITLE"));
                // Populate other fields as needed
                lessons.add(lesson);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return lessons;
    }

}
