package com.bookstore.actions;

import com.bookstore.models.OrderEntity;
import com.bookstore.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

/**
 * Created by zacks on 15-6-21.
 */
public class OrderAction extends ActionSupport {
    private OrderService orderService;
    private String endTime;
    private String startTime;
    private String bookName;
    private String username;
    private List<OrderEntity> orderEntityList;

    // admin query orders by username
    public String queryByUser() {
        orderEntityList = orderService.getByUser(username);
        return SUCCESS;
    }

    // admin query orders by book name
    public String queryByBook() {
        orderEntityList = orderService.getByBook(bookName);
        return SUCCESS;
    }

    // admin query orders by time
    public String queryByTime() {
        orderEntityList = orderService.getByTime(startTime, endTime);
        return SUCCESS;
    }

    // getter and setter
    public OrderService getOrderService() {
        return orderService;
    }
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
    public String getEndTime() {
        return endTime;
    }
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
    public String getStartTIme() {
        return startTime;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public List<OrderEntity> getOrderEntityList() {
        return orderEntityList;
    }
    public void setOrderEntityList(List<OrderEntity> orderEntityList) {
        this.orderEntityList = orderEntityList;
    }
    public String getBookName() {
        return bookName;
    }
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

}
