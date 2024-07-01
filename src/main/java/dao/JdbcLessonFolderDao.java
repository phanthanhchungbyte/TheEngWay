package dao;

import DBConnect.Connect;
import model.LessonFolder;
import utils.SqlUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcLessonFolderDao implements LessonFolderDao {
    private static final Logger logger = Logger.getLogger(JdbcUserDao.class.getName());
    private static final String GET_FOLDERS_FROM_SKILL = "SELECT LESSON_FOLDER_NAME FROM LESSON_FOLDER WHERE LESSON_FOLDER_SKILL = ?";
    private static final String GET_FOLDER_ID_FROM_SKILL_AND_NAME = "SELECT LESSON_FOLDER_ID FROM LESSON_FOLDER WHERE LESSON_FOLDER_SKILL = ? AND LESSON_FOLDER_NAME = ?";

    public ArrayList<String> getLessonFoldersWSkill(String skill) {

        ArrayList<String> lessonFolders = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Connection conn;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_FOLDERS_FROM_SKILL);
            ptm.setString(1, skill);
            rs = ptm.executeQuery();
            while (rs.next()) {
                lessonFolders.add(rs.getString("LESSON_FOLDER_NAME"));
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return lessonFolders;
    }

    public int getLessonFolderId(String skill, String lessonFolderName) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Connection conn;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_FOLDER_ID_FROM_SKILL_AND_NAME);
            ptm.setString(1, skill);
            ptm.setString(2, lessonFolderName);
            rs = ptm.executeQuery();
            if (rs.next()) {
                return rs.getInt("LESSON_FOLDER_ID");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return -1;
    }

    public static void main(String[] args) {
        JdbcLessonFolderDao lessonFolderDao = new JdbcLessonFolderDao();
        for(String lesson : lessonFolderDao.getLessonFoldersWSkill("1st")) {
            System.out.println(lesson);
        }
    }
}