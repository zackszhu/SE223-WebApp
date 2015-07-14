package com.myBookStore.model;

/**
 * Created by zacks on 15-5-2.
 */
public class Book {
    private int id;
    private String name;
    private String author;
    private String publisher;
    private String isbn;
    private double price;
    private int rating;
    private int status;

    public Book(int _id, String _name, String _author, String _publisher, String _isbn, double _price, int _rating, int _status) {
        id = _id;
        name = _name;
        author = _author;
        publisher = _publisher;
        isbn = _isbn;
        price = _price;
        rating = _rating;
        status = _status;
    }

    public Book(String _name, String _author, String _publisher, String _isbn, double _price) {
        name = _name;
        author = _author;
        publisher = _publisher;
        isbn = _isbn;
        price = _price;
        rating = 0;
        status = 0;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getIsbn() {
        return isbn;
    }

    public double getPrice() {
        return price;
    }

    public int getRating() {
        return rating;
    }

    public int getStatus() {
        return status;
    }
}
