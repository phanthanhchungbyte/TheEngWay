package dao;


import model.User;

public interface UserDao {
    User userLogin(String username, String password_hash);

    boolean checkEmailAvailable(String email);

    boolean checkUsernameAvailable(String username);

    boolean insertAccount(String username, String password_hash, String password_salt, String email, String usertype);

    User getUser(int userID);
}