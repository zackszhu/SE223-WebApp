package com.myBookStore.model;

/**
 * Created by zacks on 15-5-9.
 */
public class Order {
    private String bookName;
    private String username;
    private String createTime;

    public Order(String _bookName, String _username, String _createTime) {
        bookName = _bookName;
        username = _username;
        createTime = _createTime;
    }

    public String getUsername() {
        return username;
    }

    public String getCreateTime() {
        return createTime;
    }

    public String getBookName() {
        return bookName;
    }
}
