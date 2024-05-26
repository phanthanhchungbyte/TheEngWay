package dao;


import model.User;

public interface UserDao {
    User userLogin(String username, String password);

    boolean checkEmailAvailable(String email);

    boolean checkUsernameAvailable(String username);

    boolean insertAccount(String username, String password, String email, String usertype);

    User getUser(int userID);
}