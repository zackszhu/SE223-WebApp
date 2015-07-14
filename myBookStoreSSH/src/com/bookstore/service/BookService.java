package com.bookstore.service;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.models.BooksEntity;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by zacks on 15-6-24.
 */
public class BookService {
    private BookDAO bookDB;
    private UserDAO userDB;
    private OrderDAO orderDB;

    // add new book
    public void addBook(BooksEntity book) {
        bookDB.add(book);
    }

    // get book list by book name
    public List<BooksEntity> getBookByName(String bookname) {
        if (bookname == null)
            return bookDB.getAll();
        else
            return bookDB.getByName(bookname);
    }

    // get book list by user
    public List<BooksEntity> getBookByUser(String username) {
        return bookDB.getByUser(userDB.getUserByName(username));
    }

    // delete a book
    public boolean deleteBook(int bookID) {
        try {
            bookDB.delete(bookDB.getById(bookID));
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    // buy book from shopping cart and remove the entity
    public List<BooksEntity> buyBook(List<BooksEntity> oldCart, String bookIDs, String username) {
        String[] books = bookIDs.split(", ");
        int userID = userDB.getUserByName(username).getId();
        for (String entry : books) {
            int bookID = Integer.parseInt(entry);
            for (Iterator<BooksEntity> iter = oldCart.listIterator(); iter.hasNext(); ) {
                BooksEntity book = iter.next();
                if (book.getId() == bookID) {
                    iter.remove();
                }
            }
            orderDB.add(userID, bookDB.getById(bookID));
        }
        return oldCart;
    }

    // add new book into shopping cart
    public List<BooksEntity> addCart(List<BooksEntity> oldCart, int bookID) {
        if (oldCart == null) {
            oldCart = new ArrayList<BooksEntity>();
        }
        oldCart.add(bookDB.getById(bookID));
        return oldCart;
    }

    // getter and setter
    public OrderDAO getOrderDB() {
        return orderDB;
    }
    public void setOrderDB(OrderDAO orderDB) {
        this.orderDB = orderDB;
    }
    public UserDAO getUserDB() {
        return userDB;
    }
    public void setUserDB(UserDAO userDB) {
        this.userDB = userDB;
    }
    public BookDAO getBookDB() {
        return bookDB;
    }
    public void setBookDB(BookDAO bookDB) {
        this.bookDB = bookDB;
    }

}
