package com.bookstore.models;

import org.springframework.data.annotation.Id;

/**
 * Created by zacks on 15-6-25.
 */
public class User {

    @Id
    private String hashID;

    private int id;

    private String username;

    private String password;

    private String email;

    private int status;

    private String createTime;

    public User() {
    }

    public User(int id, String username, String password, String email, int status, String createTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.status = status;
        this.createTime = createTime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "";
    }
}

