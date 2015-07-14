package com.bookstore.actions;

import com.bookstore.models.BooksEntity;
import com.bookstore.service.BookService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by zacks on 15-6-21.
 */
public class BookAddAction extends ActionSupport implements ModelDriven<BooksEntity> {
    // Model driven class that capture objects from jsp
    private BookService bookService;
    private BooksEntity book = new BooksEntity();

    // Add new books
    public String execute() {
        bookService.addBook(book);
        return SUCCESS;
    }

    // getter and setter
    public BookService getBookService() {
        return bookService;
    }
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }
    public BooksEntity getModel() {
        return book;
    }

}
