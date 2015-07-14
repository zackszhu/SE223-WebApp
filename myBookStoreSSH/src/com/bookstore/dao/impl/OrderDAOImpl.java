package com.bookstore.dao.impl;

import com.bookstore.dao.OrderDAO;
import com.bookstore.models.BooksEntity;
import com.bookstore.models.OrderEntity;
import com.bookstore.models.User;
import org.hibernate.*;
import org.springframework.data.mongodb.core.MongoTemplate;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by zacks on 15-6-20.
 */
public class OrderDAOImpl implements OrderDAO {
    private MongoTemplate mongoTemplate;
    private SessionFactory sessionFactory;


    // add order with userID and book
    @Override
    public void add(int userID, BooksEntity book) {
        OrderEntity order = new OrderEntity();
        order.setBookId(book);
        order.setStatus(0);
        order.setUserId(userID);
        order.setCreateTime(new Timestamp(System.currentTimeMillis()));
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(order);
        tx.commit();
        session.close();
    }

    // get order list by user
    @Override
    public List<OrderEntity> getByUser(String username) {
        Session session = sessionFactory.openSession();
        List<OrderEntity> result = null;
        try {
            org.springframework.data.mongodb.core.query.Query query = new org.springframework.data.mongodb.core.query.Query(org.springframework.data.mongodb.core.query.Criteria.where("username").is(username));
            List<User> tempList = mongoTemplate.find(query, User.class, "user");
            if (tempList.size() == 0)
                return null;
            User tempResult = tempList.get(0);
            Query q2 = session.createQuery("from OrderEntity where userId=:id");
            q2.setInteger("id", tempResult.getId());
            result = q2.list();
            session.close();
        } catch (HibernateException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return result;
    }

    // get order list by book
    @Override
    public List<OrderEntity> getByBook(List<BooksEntity> books) {
        Session session = sessionFactory.openSession();
        List<OrderEntity> result = null;
        for (BooksEntity book : books) {
            try {
                Query q = session.createQuery("from OrderEntity where bookId=:book");
                q.setParameter("book", book);
                if (result == null)
                    result = q.list();
                else
                    result.addAll(q.list());
                session.close();
            } catch (HibernateException ex) {
                ex.printStackTrace();
                throw ex;
            }
        }
        return result;
    }

    // get order list by time
    @Override
    public List<OrderEntity> getByTime(Timestamp start, Timestamp end) {
        Session session = sessionFactory.openSession();
        List<OrderEntity> result;
        try {
            Query q = session.createQuery("from OrderEntity where createTime>:start and  createTime<:endTime");
            q.setParameter("start", start);
            q.setParameter("endTime", end);
            result = q.list();
            session.close();
        } catch (HibernateException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return result;
    }

    // getter and setter
    public MongoTemplate getMongoTemplate() {
        return mongoTemplate;
    }
    public void setMongoTemplate(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
