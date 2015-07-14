package com.bookstore.dao.impl;

import com.bookstore.dao.BookDAO;
import com.bookstore.models.BooksEntity;
import com.bookstore.models.OrderEntity;
import com.bookstore.models.User;
import org.hibernate.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zacks on 15-6-20.
 */
public class BookDAOImpl implements BookDAO {
    private SessionFactory sessionFactory;

    // get all books
    @Override
    public List<BooksEntity> getAll() {
        Session session = sessionFactory.openSession();
        List<BooksEntity> result;
        try {
            Query q = session.createQuery("from BooksEntity ");
            result = q.list();
            session.close();
        } catch (HibernateException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return result;
    }

    // get book by id
    @Override
    public BooksEntity getById(int id) {
        Session session = sessionFactory.openSession();
        List<BooksEntity> result;
        try {
            Query q = session.createQuery("from BooksEntity where id=:id");
            q.setInteger("id", id);
            result = q.list();
            session.close();
        } catch (HibernateException ex) {
            ex.printStackTrace();
            throw ex;
        }
        if (result == null)
            return null;
        return result.get(0);
    }

    // get book by user
    @Override
    public List<BooksEntity> getByUser(User user) {
        Session session = sessionFactory.openSession();
        List<BooksEntity> result = new ArrayList<BooksEntity>();
        try {
            Query q = session.createQuery("from OrderEntity where userId=:user");
            q.setParameter("user", user.getId());
            List<OrderEntity> tempResult = q.list();
            for (OrderEntity entity : tempResult) {
                Query q2 = session.createQuery("from BooksEntity where id=:book");
                q2.setParameter("book", entity.getBookId().getId());
                List<BooksEntity> tempResult2 = q2.list();
                result.add(tempResult2.get(0));
            }
            session.close();
        } catch (HibernateException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return result;
    }

    // get book by book name
    @Override
    public List<BooksEntity> getByName(String bookName) {
        Session session = sessionFactory.openSession();
        List<BooksEntity> result;
        try {
            Query q = session.createQuery("from BooksEntity where name=:name");
            q.setString("name", bookName);
            result = q.list();
            session.close();
        } catch (HibernateException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return result;
    }

    // add book
    @Override
    public void add(BooksEntity book) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(book);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
    }

    // delete book by change status into 1
    @Override
    public void delete(BooksEntity book) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            book.setStatus(1);
            session.update(book);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
        } finally {
            session.close();
        }
    }

    // getter and setter
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
