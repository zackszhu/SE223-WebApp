package com.myBookStore.model;

/**
 * Created by zacks on 15-5-3.
 */
public class User {
    private int id;
    private String username;
    private String email;
    private String createTime;
    private int status;

    public User(int _id, String _username, String _email, String _createTime, int _status) {
        id = _id;
        username = _username;
        email = _email;
        createTime = _createTime;
        status = _status;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getCreateTime() {
        return createTime;
    }

    public int getStatus() {
        return status;
    }
}
