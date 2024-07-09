package dao;

import DBConnect.Connect;
import model.Lesson;
import utils.SqlUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcLessonDao implements LessonDao {
    private static final Logger logger = Logger.getLogger(JdbcLessonDao.class.getName());
    private static final String INSERT_LESSON_QUERY = "INSERT INTO LESSON (CREATOR_USERNAME, LESSON_TITLE, LESSON_AVATAR, LESSON_TYPE, LESSON_FOLDER_ID, LESSON_CONTENTID, LESSON_QUIZID, CREATED_AT, UPDATED_AT, VERSION, LESSON_STATUS) " +
            "VALUE (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SORT_LESSONS_WITH_CREATORNAME = "select * from LESSON \n" +
            "WHERE CREATOR_USERNAME = ?\n" +
            "ORDER BY (`UPDATED_AT`) DESC;";

    private static final String SORT_LESSONS_WITH_FOLDER_NAME = "SELECT * FROM theengway.lesson \n" +
            "WHERE LESSON_FOLDER_ID = ?\n" +
            "ORDER BY (`UPDATED_AT`) DESC; ";

    private static final String GET_FIRST_LESSONS_FOR_SKILL = "SELECT *\n" +
            "FROM LESSON\n" +
            "WHERE LESSON_FOLDER_ID = ?\n" +
            "ORDER BY UPDATED_AT DESC\n" +
            "LIMIT 3;\n";

    private static final String GET_LESSON_DATA_FOR_FETCH = "SELECT LESSON_CONTENTID, LESSON_QUIZID\n" +
            "FROM LESSON \n" +
            "WHERE (LESSON_TITLE = ?) AND (LESSON_FOLDER_ID = ?);";

    private static final String GET_LESSONID_WITH_NAME_AND_FOLDER = "SELECT LESSONID FROM LESSON WHERE LESSON_FOLDER_ID = ? AND LESSON_TITLE = ?";

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
            ptm.setString(3, lesson.getLessonAvatarURL());
            ptm.setString(4, lesson.getSkill());
            ptm.setInt(5, lesson.getLessonFolderId());
            ptm.setString(6, lesson.getLessonContentId());
            ptm.setString(7, lesson.getLessonQuizId());
            ptm.setTimestamp(8, lesson.getCreatedAt());
            ptm.setTimestamp(9, lesson.getUpdatedAt());
            // Version is to check if the lesson has been updated or not.
            ptm.setInt(10, lesson.getVersion());
            ptm.setString(11, lesson.getStatus());
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
            createLessonFromResult(createdLessons, rs);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            return null;
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return createdLessons;
    }

    @Override
    public ArrayList<Lesson> getAllLessonsWithFolder(int folderId) {
        ArrayList<Lesson> createdLessons = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(SORT_LESSONS_WITH_FOLDER_NAME);
            ptm.setInt(1, folderId);
            rs = ptm.executeQuery();
            createLessonFromResult(createdLessons, rs);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            return null;
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return createdLessons;
    }


    @Override
    public ArrayList<Lesson> getDemoLessonsWithFolder(ArrayList<Integer> lessonFolderIds) {
        ArrayList<Lesson> createdLessons = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_FIRST_LESSONS_FOR_SKILL);
            for (Integer lessonFolderId : lessonFolderIds) {
                ptm.setInt(1, lessonFolderId);
                rs = ptm.executeQuery();
                createLessonFromResult(createdLessons, rs);
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return createdLessons;
    }

    @Override
    public ArrayList<String> getLessonDataForFetch(String lessonName, int lessonFolderId) {
        ArrayList<String> lessonData = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_LESSON_DATA_FOR_FETCH);
            ptm.setString(1, lessonName);
            ptm.setInt(2, lessonFolderId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                lessonData.add(rs.getString(1));
                // Quiz is optional here, it can be null.
                if(rs.getString(2) != null) {
                    lessonData.add(rs.getString(2));
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return lessonData;
    }

    @Override
    public int getLessonIdWithFolderAndName(int lessonFolderId, String lessonTitle) {
        int lessonId = -1;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_LESSON_DATA_FOR_FETCH);
            ptm.setInt(1, lessonFolderId);
            ptm.setString(2, lessonTitle);
            rs = ptm.executeQuery();
            if (rs.next()) {
                lessonId = rs.getInt("LESSONID");
                return lessonId;
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(conn, ptm, rs);
        }
        return lessonId;
    }

    public void createLessonFromResult(ArrayList<Lesson> createdLessons, ResultSet rs) throws SQLException {
        while (rs.next()) {
            Lesson lesson = new Lesson(
                    rs.getString("CREATOR_USERNAME"),
                    rs.getString("LESSON_TITLE"),
                    rs.getString("LESSON_CONTENTID"),
                    rs.getString("LESSON_AVATAR"),
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
    }
}
