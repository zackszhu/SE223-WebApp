package com.bookstore.service;

import com.bookstore.dao.UserDAO;
import com.bookstore.models.User;

import java.util.List;

/**
 * Created by zacks on 15-6-24.
 */
public class UserService {
    private UserDAO userDB;

    // delete user by id
    public boolean deleteUser(int userID) {
        try {
            userDB.banUser(userDB.getUserByID(userID));
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    // modify user
    public boolean modifyUser(User user) {
        try {
            userDB.modifyUser(user);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    // get all user list
    public List<User> getAllUser() {
        try {
            return userDB.getAll();
        } catch (Exception e) {
            return null;
        }
    }

    // get user info by username
    public User getUserInfo(String username) {
        try {
            return userDB.getUserByName(username);
        } catch (Exception e) {
            return null;
        }
    }

    // login
    public boolean login(String username, String password) {
        try {
            if (userDB.getUserByName(username).getPassword().equals(password))
                return true;
            else
                return false;
        } catch (Exception e) {
            return false;
        }
    }

    // register
    public boolean register(User user) {
        return userDB.addUser(user);
    }

    // getter and setter
    public UserDAO getUserDB() {
        return userDB;
    }
    public void setUserDB(UserDAO userDB) {
        this.userDB = userDB;
    }

}
