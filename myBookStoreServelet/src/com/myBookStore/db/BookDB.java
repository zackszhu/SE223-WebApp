package com.myBookStore.db;

import com.myBookStore.model.Book;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zacks on 15-5-2.
 */
public class BookDB {
    private static BookDB ourInstance = new BookDB();
    private DataSource dataSource;
    private Connection conn;
    private BookDB() {
        try {
            Context initContent = new InitialContext();
            dataSource = (DataSource) initContent.lookup("java:comp/env/jdbc/bookStore");
            conn = dataSource.getConnection();
        } catch (NamingException ex) {
            System.out.println("Context Error!");
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
    }

    public static BookDB getInstance() {
        return ourInstance;
    }

    public List<Book> getAvailableBook(String _username) {
        List<Book> ret = new ArrayList<Book>();
        try {
//            Connection conn = dataSource.getConnection();
            PreparedStatement statement = conn.prepareStatement("select id, Name, Author, Publisher, ISBN, Price, Rating, Status\n" +
                    "from `books`\n" +
                    "where books.id not in\n" +
                    "      (SELECT distinct books.id\n" +
                    "       FROM `books`, `order`\n" +
                    "       WHERE `userID` = (SELECT id FROM `user` WHERE `Username` = (?)) and books.`Status` = 0 and bookID = books.id)\n" +
                    "      and Status = 0;");
            statement.setString(1, _username);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.add(new Book(
                                result.getInt(1),
                                result.getString(2),
                                result.getString(3),
                                result.getString(4),
                                result.getString(5),
                                result.getDouble(6),
                                result.getInt(7),
                                result.getInt(8)
                        )
                );
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

    public List<Book> getAllBook() {
        List<Book> ret = new ArrayList<Book>();
        try {
//            Connection conn = dataSource.getConnection();
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM `books`;");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.add(new Book(
                                result.getInt(1),
                                result.getString(2),
                                result.getString(3),
                                result.getString(4),
                                result.getString(5),
                                result.getDouble(6),
                                result.getInt(7),
                                result.getInt(8)
                        )
                );
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

    public List<Book> getMyBook(String username) {
        List<Book> ret = new ArrayList<Book>();
        try {
//            Connection conn = dataSource.getConnection();
            PreparedStatement statement = conn.prepareStatement("SELECT distinct books.id, Name, Author, Publisher, ISBN, Price, Rating, books.Status\n" +
                    "FROM `books`, `order`\n" +
                    "WHERE `userID` = (SELECT id FROM `user` WHERE `Username` = (?)) and books.`Status` = 0 and bookID = books.id;");
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                ret.add(new Book(
                                result.getInt(1),
                                result.getString(2),
                                result.getString(3),
                                result.getString(4),
                                result.getString(5),
                                result.getDouble(6),
                                result.getInt(7),
                                result.getInt(8)
                        )
                );
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return ret;
    }

    public Book getBook(int _id) {
        Book book = null;
        try {
//            Connection conn = dataSource.getConnection();
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM `books` WHERE `id`=(?);");
            statement.setInt(1, _id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                book = new Book(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getDouble(6),
                        result.getInt(7),
                        result.getInt(8)
                );
            }
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return book;
    }

    public boolean deleteBook(int _id) {
        try {
            PreparedStatement statement = conn.prepareStatement("UPDATE `books` SET `status`=1 WHERE `id`=(?);");
            statement.setInt(1, _id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return false;
    }

    public boolean addBook(Book _book) {
        try {
            PreparedStatement statement = conn.prepareStatement("insert into books (Name, Author, Publisher, ISBN, Price) values ((?), (?), (?), (?), (?));");
            statement.setString(1, _book.getName());
            statement.setString(2, _book.getAuthor());
            statement.setString(3, _book.getPublisher());
            statement.setString(4, _book.getIsbn());
            statement.setDouble(5, _book.getPrice());
            statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return false;
    }

    public boolean buyBook(int _id, String _username) {
        try {
            PreparedStatement statement = conn.prepareStatement("insert into `order` (`bookID`, `userID`) values ((?), (select `id` from `user` where `username` = (?)));");
            statement.setInt(1, _id);
            statement.setString(2, _username);
            statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Connect Error!");
        }
        return false;
    }


}
