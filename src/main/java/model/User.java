package model;

import java.io.Serializable;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User implements Serializable{

    private static final Logger logger = Logger.getLogger(User.class.getName());
    private int userID;
    private String userName;
    private String passwordHash;
    private String passwordSalt;
    private String email;
    private String userType;
    private Date dateOfBirth;
    private String address;
    private String phoneNumber;
    private String gender;
    private String fullName;
    private String avatar;
    private Calendar calendar;

    public User(int userID, String userName, String passwordHash, String passwordSalt, String email, String userType, Date dateOfBirth, String address, String phoneNumber, String gender, String fullName, String avatar) {
        this.userID = userID;
        this.userName = userName;
        this.passwordHash = passwordHash;
        this.passwordSalt = passwordSalt;
        this.email = email;
        this.userType = userType;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.fullName = fullName;
        this.avatar = avatar;
    }

    public User(int userID, String userName,String passwordHash, String passwordSalt, String email, String userType, String avatar) {
        this.userID = userID;
        this.userName = userName;
        this.passwordHash = passwordHash;
        this.passwordSalt = passwordSalt;
        this.email = email;
        this.userType = userType;
        this.avatar = avatar;
    }

    public User(int userID, String userName, String passwordHash, String passwordSalt, String email) {
        this.userID = userID;
        this.userName = userName;
        this.passwordHash = passwordHash;
        this.passwordSalt = passwordSalt;
        this.email = email;
    }

    public User() {
    }

    public String getAvatar() {
        return deCodeURL(avatar);
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public String getPasswordHash() { return passwordHash; }

    public void setPasswordHash(String passwordHash) {this.passwordHash = passwordHash;}

    public String getPasswordSalt() { return passwordSalt; }

    public void setPasswordSalt(String passwordSalt) {this.passwordSalt = passwordSalt;}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public String getDateOfBirthString() {
        // Turn date to LocalDate to extract the day, month, and year.
        return dateOfBirth.toString();
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", userName=" + userName + ", password_hash=" + passwordHash + ", password_salt" + passwordSalt +", email=" + email +  ", userType=" + userType + '}';
    }

    public static String deCodeURL(String encodedURL) {
        String decodedURL = null;
        try {
            decodedURL = URLDecoder.decode(encodedURL, StandardCharsets.UTF_8);
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
        }
        return decodedURL;
    }
}
