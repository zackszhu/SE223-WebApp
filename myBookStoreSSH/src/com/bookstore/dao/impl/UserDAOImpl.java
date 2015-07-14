package com.bookstore.dao.impl;

import com.bookstore.dao.UserDAO;
import com.bookstore.models.User;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

/**
 * Created by zacks on 15-6-20.
 */
public class UserDAOImpl implements UserDAO {
    private MongoTemplate mongoTemplate;

    // get user by id
    @Override
    public User getUserByID(int id) {
        Query query = new Query(Criteria.where("id").is(id));
        List<User> result = mongoTemplate.find(query, User.class, "user");
        if (result.size() == 0)
            return null;
        return result.get(0);
    }

    // get user by username
    @Override
    public User getUserByName(String username) {
        Query query = new Query(Criteria.where("username").is(username));
        List<User> result = mongoTemplate.find(query, User.class, "user");
        if (result.size() == 0)
            return null;
        return result.get(0);
    }

    // get all users
    @Override
    public List<User> getAll() {
        return mongoTemplate.findAll(User.class, "user");
    }

    // add new user
    @Override
    public boolean addUser(User user) {
        // get increment id
        List<User> users = getAll();
        User maxUser = users.get(0);
        for (User entry : users) {
            if (entry.getId() > maxUser.getId()) {
                maxUser = entry;
            }
        }
        user.setId(maxUser.getId() + 1);
        user.setCreateTime(new Timestamp(Calendar.getInstance().getTime().getTime()).toString());
        mongoTemplate.insert(user, "user");
        return true;
    }

    // ban user by setting status into 1
    @Override
    public void banUser(User user) {
        mongoTemplate.updateFirst(Query.query(Criteria.where("username").is(user.getUsername())), Update.update("status", 1), User.class, "user");
    }

    // modify user
    @Override
    public void modifyUser(User user) {
        mongoTemplate.save(user, "user");
    }

    // getter and setter
    public MongoTemplate getMongoTemplate() {
        return mongoTemplate;
    }
    public void setMongoTemplate(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

}
