package com.bookstore.service;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.models.OrderEntity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by zacks on 15-6-24.
 */
public class OrderService {
    private OrderDAO orderDB;
    private BookDAO bookDB;

    // get order list by username
    public List<OrderEntity> getByUser(String username) {
        return orderDB.getByUser(username);
    }

    // get order list by book name
    public List<OrderEntity> getByBook(String bookName) {
        return orderDB.getByBook(bookDB.getByName(bookName));
    }

    // get order list by time
    public List<OrderEntity> getByTime(String startTime, String endTime) {
        String[] monthString = {"January,", "February,", "March,", "April,", "May,", "June,", "July,", "August,", "September,", "October,", "November,", "December,"};

        // convert the start time string into timestamp
        String[] temp = startTime.split(" ");
        int day = Integer.parseInt(temp[0]);
        int year = Integer.parseInt(temp[2]);
        int month = 0;
        for (int i = 0; i < 12; i++) {
            if (monthString[i].equals(temp[1])) {
                month = i + 1;
                break;
            }
        }
        String startString = String.format("%04d-%02d-%02d 00:00:00", year, month, day);
        Timestamp start = Timestamp.valueOf(startString);

        // convert the end time string into timestamp
        temp = endTime.split(" ");
        day = Integer.parseInt(temp[0]);
        year = Integer.parseInt(temp[2]);
        month = 0;
        for (int i = 0; i < 12; i++) {
            if (monthString[i].equals(temp[1])) {
                month = i + 1;
                break;
            }
        }
        String endString = String.format("%04d-%02d-%02d 00:00:00", year, month, day);
        Timestamp end = Timestamp.valueOf(endString);

        return orderDB.getByTime(start, end);
    }

    // getter and setter
    public OrderDAO getOrderDB() {
        return orderDB;
    }
    public void setOrderDB(OrderDAO orderDB) {
        this.orderDB = orderDB;
    }
    public BookDAO getBookDB() {
        return bookDB;
    }
    public void setBookDB(BookDAO bookDB) {
        this.bookDB = bookDB;
    }

}
