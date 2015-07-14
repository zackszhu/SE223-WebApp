package com.bookstore.actions;

import com.bookstore.models.User;
import com.bookstore.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Map;

/**
 * Created by zacks on 15-6-20.
 */
public class UserAction extends ActionSupport {
    private UserService userService;
    private List<User> userList;
    private int userID;
    private User user;
    private String username;
    private String password;

    // delete user by user id
    public String deleteUser() {
        if (userService.deleteUser(userID))
            return SUCCESS;
        else
            return ERROR;
    }

    // get all user list
    public String getAllUser() {
        userList = userService.getAllUser();
        return SUCCESS;
    }

    // get user info
    public String getUserInfo() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        user = userService.getUserInfo((String) session.get("currentUser"));
        return SUCCESS;
    }

    // the validate function of login
    public void validateLogin() {
        if (!userService.login(username, password)) {
            addFieldError("login", "Login error");
        }
    }

    // login
    public String login() throws Exception {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("currentUser", username);
        return SUCCESS;
    }

    // logout
    public String logout() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.clear();
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        return INPUT;
    }

    // getter and setter
    public UserService getUserService() {
        return userService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public List<User> getUserList() {
        return userList;
    }
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
    public int getUserID() {
        return userID;
    }
    public void setUserID(int userID) {
        this.userID = userID;
    }

}
