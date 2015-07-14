package com.bookstore.dao;

import com.bookstore.models.BooksEntity;
import com.bookstore.models.OrderEntity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by zacks on 15-6-20.
 */
public interface OrderDAO {
    public void add(int userID, BooksEntity book);

    public List<OrderEntity> getByUser(String username);

    public List<OrderEntity> getByBook(List<BooksEntity> books);

    public List<OrderEntity> getByTime(Timestamp start, Timestamp end);
}
