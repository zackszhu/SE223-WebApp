package com.bookstore.dao;

import com.bookstore.models.User;

import java.util.List;

/**
 * Created by zacks on 15-6-20.
 */
public interface UserDAO {
    public User getUserByName(String username);

    public User getUserByID(int id);

    public List<User> getAll();

    public boolean addUser(User user);

    public void banUser(User user);

    public void modifyUser(User user);
}
