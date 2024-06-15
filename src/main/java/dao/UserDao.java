package dao;


import model.User;

import java.sql.Date;

public interface UserDao {
    User userLogin(String username, String password_hash);

    boolean checkEmailAvailable(String email);

    boolean checkUsernameAvailable(String username);

    boolean insertAccount(String username, String password_hash, String password_salt, String email, String usertype);

    User getUserWithEmail(String email);

    boolean updatePassword(String username, String password_hash, String email);

    boolean updateAvatar(String username, String avatar);

    boolean updateUserProfile(String fullName, Date dateOfBirth, String gender, String address, String phoneNumber, int userID);

    User getUser(int userID);
}