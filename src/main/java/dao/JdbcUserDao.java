package dao;

import DBConnect.Connect;
import de.vandermeer.asciitable.AsciiTable;
import de.vandermeer.asciitable.CWC_LongestLine;
import model.User;
import utils.SqlUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcUserDao implements UserDao {
    private static final String LOGIN = "SELECT USER.* FROM USER WHERE USERNAME=? AND PASSWORD_HASH=?";
    private static final String CHECK_EMAIL_AVAILABLE = "SELECT COUNT(*) FROM USER WHERE EMAIL=?";
    private static final String CHECK_USERNAME_AVAILABLE = "SELECT COUNT(*) FROM USER WHERE USERNAME=?";
    private static final String ADD_NEW_ACCOUNT = "INSERT INTO USER (USERNAME, PASSWORD_HASH, PASSWORD_SALT, EMAIL, USERTYPE, AVATAR) VALUES (?,?,?,?,?,?)";
    private static final String GET_USER = "SELECT USER.* FROM USER WHERE USERID=?";
    private static final String GET_USER_SALT = "SELECT USER.PASSWORD_SALT FROM USER WHERE USERNAME=?";
    private static final String GET_USER_WITH_EMAIL = "SELECT USER.* FROM USER WHERE EMAIL=?";
    private static final String UPDATEPASSWORD = "UPDATE USER SET PASSWORD_HASH=?, PASSWORD_SALT=? WHERE EMAIL=?";
    private static final String UPDATEAVATAR = "UPDATE USER SET AVATAR=? WHERE USERNAME=?";
    private static final String UPDATEUSERPROFILE = "UPDATE USER SET FULLNAME=?, DATE_OF_BIRTH=?, GENDER=?, ADDRESS=?, PHONENUMBER=? WHERE USERID=?";

    private static final Logger logger = Logger.getLogger(JdbcUserDao.class.getName());

    public User userLogin(String username, String password_hash) {
        User user = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Connection conn;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(LOGIN);
            ptm.setString(1, username);
            ptm.setString(2, password_hash);
            rs = ptm.executeQuery();
            if (rs.next()) {
                user = new User(
                    rs.getInt("USERID"),
                    rs.getString("USERNAME"),
                    rs.getString("PASSWORD_HASH"),
                    rs.getString("PASSWORD_SALT"),
                    rs.getString("EMAIL"),
                    rs.getString("USERTYPE"),
                    rs.getDate("DATE_OF_BIRTH"),
                    rs.getString("ADDRESS"),
                    rs.getString("PHONENUMBER"),
                    rs.getString("GENDER"),
                    rs.getString("FULLNAME"),
                    rs.getString("AVATAR")
                );
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return user;
    }

    public boolean checkEmailAvailable(String email) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(CHECK_EMAIL_AVAILABLE);
            ptm.setString(1, email);
            rs = ptm.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if(count > 0) {
                    return false;
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs, conn);
        }
        return true;
    }

    public boolean updateAvatar(String avatarURL, String username) {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(UPDATEAVATAR);
            ptm.setString(1, avatarURL);
            ptm.setString(2, username);
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(ptm, conn);
        }
        return false;
    }

    public String getAvatar(String username) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement("SELECT USER.AVATAR FROM USER WHERE USERNAME=?");
            ptm.setString(1, username);
            rs = ptm.executeQuery();
            if(rs.next()) {
                return rs.getString("AVATAR");
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(ptm, conn);
        }
        return "not found";
    }

    public boolean updatePassword( String Password_Hash, String Password_Salt, String Email) {
        PreparedStatement ptm = null;
        Connection connection = null;
        try {
            connection = Connect.getConnection();
            ptm = connection.prepareStatement(UPDATEPASSWORD);
            ptm.setString(1, Password_Hash);
            ptm.setString(2, Password_Salt);
            ptm.setString(3, Email);
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        } finally {
            SqlUtils.close(ptm, connection);
        }
        return false;
    }


    // Phương thức kiểm tra username đã tồn tại chưa
    public boolean checkUsernameAvailable(String username) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(CHECK_USERNAME_AVAILABLE);
            ptm.setString(1, username);
            rs = ptm.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();

            // Output the result
            if (rs.next()) {
                int count = rs.getInt(1);
                String col1 = rsmd.getColumnName(1);
                AsciiTable at = new AsciiTable();
                at.getRenderer().setCWC(new CWC_LongestLine());
                at.addRule();
                at.addRow(col1);
                at.addRule();
                at.addRow(count);
                at.addRule();
                writeToFile(at);

                if(count > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs, conn);
        }
        return false;
    }

    // Phương thức chèn tài khoản mới
    public boolean insertAccount(String username, String password_hash, String password_salt, String email, String usertype, String avatar) {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(ADD_NEW_ACCOUNT);
            ptm.setString(1, username);
            ptm.setString(2, password_hash);
            ptm.setString(3, password_salt);
            ptm.setString(4, email);
            ptm.setString(5, usertype);
            ptm.setString(6, avatar);
            ptm.executeUpdate();
            return true;
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, conn);
        }
        return false;
    }

    public User getUser(int UserID) {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_USER);
            ptm.setInt(1, UserID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("USERID"),
                        rs.getString("USERNAME"),
                        rs.getString("PASSWORD_HASH"),
                        rs.getString("PASSWORD_SALT"),
                        rs.getString("EMAIL"),
                        rs.getString("USERTYPE"),
                        rs.getDate("DATE_OF_BIRTH"),
                        rs.getString("ADDRESS"),
                        rs.getString("PHONENUMBER"),
                        rs.getString("GENDER"),
                        rs.getString("FULLNAME"),
                        rs.getString("AVATAR")
                );
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs, conn);
        }
        return user;
    }

    public User getUserWithEmail(String email) {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_USER_WITH_EMAIL);
            ptm.setString(1, email);
            rs = ptm.executeQuery();
            if(rs.next()) {
                user = new User(
                    rs.getInt("USERID"),
                    rs.getString("USERNAME"),
                    rs.getString("PASSWORD_HASH"),
                    rs.getString("PASSWORD_SALT"),
                    rs.getString("EMAIL"),
                    rs.getString("USERTYPE"),
                    rs.getString("AVATAR")
                );
            }
        } catch(SQLException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, conn, rs);
        }
        return user;
    }

    public String getUserSalt(String userName) {
        String salt = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Connect.getConnection();
            ptm = conn.prepareStatement(GET_USER_SALT);
            ptm.setString(1, userName);
            rs = ptm.executeQuery();
            if(rs.next()) {
                salt = rs.getString("PASSWORD_SALT");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs, conn);
        }
        return salt;
    }

    public static void writeToFile(AsciiTable table) {
        Path file = Paths.get("\\resultlog.txt");
        String result = table.render();
        List<String> list = new ArrayList<>();
        list.add(result);
        try {
            Files.write(file, list, StandardCharsets.UTF_8);
        } catch (IOException e) {
            logger.log(Level.SEVERE, e.getMessage());
        }
    }
    public boolean updateUserProfile(String fullName, Date dateOfBirth, String gender, String address, String phoneNumber, int userID) {
        PreparedStatement ptm = null;
        Connection conn = null;
        try {
            conn = Connect.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEUSERPROFILE);
                ptm.setString(1, fullName);
                ptm.setDate(2, dateOfBirth);
                ptm.setString(3, gender);
                ptm.setString(4, address);
                ptm.setString(5, phoneNumber);
                ptm.setInt(6, userID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm);
        }
        return false;
    }

    public static void main(String[] args) {
        JdbcUserDao dao = new JdbcUserDao();
        User userTest = dao.userLogin("phanthanhchung8c8", "23595b65cb7e7e216beab9983ebc8f2c65f35738c4a818c095dc7dcedb4b2368");
        System.out.println(userTest.toString());
    }
}