package com.bookstore.dao;

import com.bookstore.models.BooksEntity;
import com.bookstore.models.User;

import java.util.List;

/**
 * Created by zacks on 15-6-20.
 */
public interface BookDAO {
    public List<BooksEntity> getAll();

    public BooksEntity getById(int id);

    public List<BooksEntity> getByUser(User user);

    public List<BooksEntity> getByName(String bookName);

    public void add(BooksEntity book);

    public void delete(BooksEntity book) throws Exception;
}
