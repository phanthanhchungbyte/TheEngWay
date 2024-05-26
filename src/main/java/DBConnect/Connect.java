package DBConnect;

import DBConnect.DBInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    private static Connection connection = null;

    private Connect() {

    }

    public static Connection getConnection() {
        if(connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            try {
                connection = DriverManager.getConnection(
                    DBInfo.dbURL,
                    DBInfo.dbUSER,
                    DBInfo.dbPASSWORD
                );
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return connection;
    }

    public static void main(String[] args) {
        Connection conn = getConnection();
        if(conn != null) {
            System.out.println("Connection Established");
        } else {
            System.out.println("Connection Not Established");
        }
    }
}
