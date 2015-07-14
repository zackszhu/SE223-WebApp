package com.bookstore.actions;

import com.bookstore.models.BooksEntity;
import com.bookstore.service.BookService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;
import java.util.Map;

/**
 * Created by zacks on 15-6-20.
 */
public class BookPageAction implements Action {
    private BookService bookService;
    private String bookName;
    private String bookIDs;
    private int bookID;
    private List<BooksEntity> bookList;

    // get all book list to show the store page
    public String getAllBooks() {
        try {
            ActionContext actionContext = ActionContext.getContext();
            Map session = actionContext.getSession();
            bookList = bookService.getBookByName((String) session.get("queryBook"));
            session.put("queryBook", null);
        } catch (Exception e) {
            return ERROR;
        }
        return SUCCESS;
    }

    // get the book list of a specific user
    public String getBookByUser() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        String username = (String) session.get("currentUser");
        bookList = bookService.getBookByUser(username);
        return SUCCESS;
    }

    // delete a book
    public String deleteBook() {
        if (bookService.deleteBook(bookID))
            return SUCCESS;
        else
            return ERROR;
    }

    // a user buy a book from shopping cart
    public String buyBook() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        String username = (String) session.get("currentUser");
        List<BooksEntity> shoppingCart = (List<BooksEntity>) session.get("buyBook");
        session.put("buyBook", bookService.buyBook(shoppingCart, bookIDs, username));
        return SUCCESS;
    }

    // user or admin query a book by name
    public String queryBook() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("queryBook", bookName);
        return SUCCESS;
    }

    // user add a book into shopping cart
    public String addShoppingCart() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        List<BooksEntity> shoppingCart = (List<BooksEntity>) session.get("buyBook");
        session.put("buyBook", bookService.addCart(shoppingCart, bookID));
        return SUCCESS;
    }

    public String execute() {
        return SUCCESS;
    }

    // setter and getter
    public List<BooksEntity> getBookList() {
        return bookList;
    }
    public void setBookList(List<BooksEntity> bookList) {
        this.bookList = bookList;
    }
    public int getBookID() {
        return bookID;
    }
    public void setBookID(int bookID) {
        this.bookID = bookID;
    }
    public String getBookIDs() {
        return bookIDs;
    }
    public void setBookIDs(String bookIDs) {
        this.bookIDs = bookIDs;
    }
    public String getBookName() {
        return bookName;
    }
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    public BookService getBookService() {
        return bookService;
    }
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }
}
