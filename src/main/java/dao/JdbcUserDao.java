package dao;

import DBConnect.Connect;
import de.vandermeer.asciitable.AsciiTable;
import de.vandermeer.asciitable.CWC_LongestLine;
import model.User;
import utils.SqlUtils;

import java.net.URI;
import java.sql.Types;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetFactory;
import javax.sql.rowset.RowSetProvider;
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
    private static final String LOGIN = "SELECT USER.* FROM USER WHERE USERNAME=? AND PASSWORD=?";
    private static final String CHECK_EMAIL_AVAILABLE = "SELECT COUNT(*) FROM USER WHERE EMAIL=?";
    private static final String CHECK_USERNAME_AVAILABLE = "SELECT COUNT(*) FROM USER WHERE USERNAME=?";
    private static final String ADD_NEW_ACCOUNT = "INSERT INTO USER (USERNAME, PASSWORD, EMAIL, USERTYPE) VALUES (?,?,?,?)";
    private static final String GET_USER = "SELECT USER.* FROM USER WHERE USERID=?";

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

    public User userLogin(String username, String password) {
        User user = null;
        try {
            ptm = connection.prepareStatement(LOGIN);
            ptm.setString(1, username);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            if (rs.next()) {
                user = new User(
                    rs.getInt("USERID"),
                    rs.getString("PASSWORD"),
                    rs.getString("USERNAME"),
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
    public boolean insertAccount(String username, String password, String email, String usertype) {
        try {
            ptm = connection.prepareStatement(ADD_NEW_ACCOUNT);
            ptm.setString(1, username);
            ptm.setString(2, password);
            ptm.setString(3, email);
            ptm.setString(4, usertype);
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
                    rs.getInt("USERID"),
                    rs.getString("USERNAME"),
                    rs.getString("PASSWORD"),
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
}