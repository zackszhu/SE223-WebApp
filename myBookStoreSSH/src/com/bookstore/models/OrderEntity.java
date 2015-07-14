package com.bookstore.models;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by zacks on 15-6-21.
 */
@Entity
@Table(name = "order", schema = "", catalog = "myBookStore")
public class OrderEntity {
    private int id;
    private int status;
    private Timestamp createTime;
    private com.bookstore.models.BooksEntity bookId;
    private int userId;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "status", nullable = false, insertable = true, updatable = true)
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "create_time", nullable = true, insertable = true, updatable = true)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        com.bookstore.models.OrderEntity that = (com.bookstore.models.OrderEntity) o;

        if (id != that.id) return false;
        if (status != that.status) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + status;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "bookID", nullable = false, insertable = true, updatable = true)
    public com.bookstore.models.BooksEntity getBookId() {
        return bookId;
    }

    public void setBookId(BooksEntity bookId) {
        this.bookId = bookId;
    }

    @Basic
    @Column(name = "userID", nullable = false, insertable = true, updatable = true)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
