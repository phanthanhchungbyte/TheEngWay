### New update
- Từ giờ sẽ update thêm file sql vào trong folder sql để cho mọi người thống nhất database,
khỏi phải sửa đi sửa lại nhiều lần.
- Nên đặt mật khẩu database và tên đăng nhập database cho giống nhau. Chúng ta sẽ đặt theo format như sau.
  ```Java
  package DBConnect;
  
  public class DBInfo {
    public static final String dbURL = "jdbc:mysql://localhost:3306/theengway";
    public static final String dbUSER = "root";
    public static final String dbPASSWORD = "hansniemann@GOAT";
  }
  ```