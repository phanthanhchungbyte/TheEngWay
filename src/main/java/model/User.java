package model;

public class User {

    private int userID;
    private String userName;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String userType;
    private String imgsrc;

    public User(int userID, String userName, String password, String email, String firstName, String lastName, String userType, String imgsrc) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.imgsrc = imgsrc;
    }

    public User(int userID, String userName, String password, String email) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
    }

    public User() {
    }

    public String getImgsrc() {
        return imgsrc;
    }

    public void setImgsrc(String imgsrc) {
        this.imgsrc = imgsrc;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", email=" + email + ", firstName=" + firstName + ", lastName=" + lastName + ", userType=" + userType + ", imgsrc=" + imgsrc + '}';
    }
}
