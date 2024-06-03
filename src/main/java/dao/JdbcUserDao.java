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
    private static final String ADD_NEW_ACCOUNT = "INSERT INTO USER (USERNAME, PASSWORD_HASH, PASSWORD_SALT, EMAIL, USERTYPE) VALUES (?,?,?,?,?)";
    private static final String GET_USER = "SELECT USER.* FROM USER WHERE USERID=?";
    private static final String GET_USER_SALT = "SELECT USER.PASSWORD_SALT FROM USER WHERE USERNAME=?";
    private static final String UPDATE_USERINFO = "UPDATE USER Set Email=?,FirstName=?,LastName=?,imgsrc=? where USERID=?";
    private static final String LOGINWITHEMAIL = "SELECT * FROM.[USER] where EMAIL=?";
    private static final String UPDATEPASSWORD = "UPDATE USER Set PASSWORD_HASH=? where EMAIL=?";


    private final Connection connection;
    private PreparedStatement ptm = null;
    private ResultSet rs = null;
    private static final Logger logger = Logger.getLogger(JdbcUserDao.class.getName());

    public JdbcUserDao() {
        // Use logger to log errors and exceptions instead of system.
        logger.setLevel(Level.FINE);
        logger.info("Logger Initialized");
        connection = Connect.getConnection();
    }

    public User userLogin(String username, String password_hash) {
        User user = null;
        try {
            ptm = connection.prepareStatement(LOGIN);
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
                        rs.getString("FIRSTNAME"),
                        rs.getString("LASTNAME"),
                        rs.getString("USERTYPE"),
                        rs.getString("IMGSRC")
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
        try {
            ptm = connection.prepareStatement(CHECK_EMAIL_AVAILABLE);
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
            SqlUtils.close(ptm, rs);
        }
        return true;
    }

    // Phương thức kiểm tra username đã tồn tại chưa
    public boolean checkUsernameAvailable(String username) {
        try {
            ptm = connection.prepareStatement(CHECK_USERNAME_AVAILABLE);
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
                    return false;
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return true;
    }

    // Phương thức chèn tài khoản mới
    public boolean insertAccount(String username, String password_hash, String password_salt, String email, String usertype) {
        try {
            ptm = connection.prepareStatement(ADD_NEW_ACCOUNT);
            ptm.setString(1, username);
            ptm.setString(2, password_hash);
            ptm.setString(3, password_salt);
            ptm.setString(4, email);
            ptm.setString(5, usertype);
            ptm.executeUpdate();
            return true;
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return false;
    }

    public User getUser(int UserID) {
        User user = null;
        try {
            ptm = connection.prepareStatement(GET_USER);
            ptm.setInt(1, UserID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("IDUSER"),
                        rs.getString("USERNAME"),
                        rs.getString("PASSWORD_HASH"),
                        rs.getString("PASSWORD_SALT"),
                        rs.getString("EMAIL"),
                        rs.getString("FIRSTNAME"),
                        rs.getString("LASTNAME"),
                        rs.getString("USERTYPE"),
                        rs.getString("IMGSRC")
                );
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return user;
    }

    public String getUserSalt(String userName) {
        String salt = null;
        try {
            ptm = connection.prepareStatement(GET_USER_SALT);
            ptm.setString(1, userName);
            rs = ptm.executeQuery();
            if(rs.next()) {
                salt = rs.getString("PASSWORD_SALT");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            SqlUtils.close(ptm, rs);
        }
        return salt;
    }

//    public void typeCreate(ArrayList<Object> colValues, int type, ResultSet rs, int col) {
//        try {
//            switch (type) {
//                case 12:
//                    colValues.add(rs.getString(col));
//                    break;
//                case 4:
//                    colValues.add(rs.getInt(col));
//                    break;
//            }
//        } catch (Exception e){
//            logger.log(Level.SEVERE, e.getMessage());
//        }
//    }
//
//    public void createTable(ResultSet rs, int numcol) {
//        AsciiTable table = new AsciiTable();
//
//        table.addRule();
//        try{
//            ResultSetMetaData rsmd = rs.getMetaData();
//            ArrayList<String> colNames = new ArrayList<>();
//            ArrayList<Object> colValues = new ArrayList<>();
//
//            for(int i = 1; i <= numcol; i++) {
//                colNames.add(rsmd.getColumnName(i));
//                table.addRow(colNames);
//                table.addRule();
//            }
//
//            while(rs.next()) {
//                for(int i = 1; i <= numcol; i++) {
//                    typeCreate(colValues, rsmd.getColumnType(i), rs, i);
//                }
//                table.addRow(colValues);
//                table.addRule();
//                colValues.clear();
//            }
//        } catch (SQLException e) {
//            logger.log(Level.SEVERE, e.getMessage());
//        } finally {
//            SqlUtils.close(ptm, rs);
//            writeToFile(table);
//        }
//    }
//

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
    public static boolean Update(int userID, String email, String firstName, String lastName, String imgsrc) {
        PreparedStatement ptm = null;
        try ( Connection con = Connect.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATE_USERINFO);
                ptm.setString(1, email);
                ptm.setString(2, firstName);
                ptm.setString(3, lastName);
                ptm.setString(4, imgsrc);
                ptm.setInt(5, userID);
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
    public static User userLoginWithEmail(String email) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = null;
        try ( Connection con = Connect.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(LOGINWITHEMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    user = new User(
                            rs.getInt("USERID"),
                            rs.getString("USERNAME"),
                            rs.getString("PASSWORD_HASH"),
                            rs.getString("PASSWORD_SALT"),
                            rs.getString("EMAIL"),
                            rs.getString("FIRSTNAME"),
                            rs.getString("LASTNAME"),
                            rs.getString("USERTYPE"),
                            rs.getString("IMGSRC")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static boolean UpdatePassword(String Password, String Email) {
        PreparedStatement ptm = null;
        try ( Connection con = Connect.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATEPASSWORD);
                ptm.setString(1, Password);
                ptm.setString(2, Email);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}