package DBConnect;

import java.sql.Connection;
import java.sql.SQLException;
import com.zaxxer.hikari.HikariDataSource;
import dao.JdbcUserDao;
import model.User;

public class Connect {
    private static final HikariDataSource dataSource;

    private Connect() {

    }

    static {
        HikariDataSource ds = new HikariDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setJdbcUrl(DBInfo.dbURL);
        ds.setUsername(DBInfo.dbUSER);
        ds.setPassword(DBInfo.dbPASSWORD);
        ds.setMaximumPoolSize(50);
        ds.setMinimumIdle(5);
        ds.setMaxLifetime(1900000);
        dataSource = ds;
    }

    public static Connection getConnection() throws SQLException{
        return dataSource.getConnection();
    }

    public static void closeDataSource() {
        if(dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
        }
    }

    public static void main(String[] args) {
        JdbcUserDao dao = new JdbcUserDao();
        User test = dao.getUserWithEmail("phanthanhchung8c8@gmail.com");
        System.out.println(test.getUserName());
        System.out.println(test.getUserID());
    }
}
