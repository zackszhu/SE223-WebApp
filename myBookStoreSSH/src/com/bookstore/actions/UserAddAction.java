package com.bookstore.actions;

import com.bookstore.models.User;
import com.bookstore.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by zacks on 15-6-24.
 */
public class UserAddAction extends ActionSupport implements ModelDriven<User> {
    // model driven class captures object from jsp
    private UserService userService;
    private User user = new User();

    public UserService getUserService() {
        return userService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @Override
    public User getModel() {
        return user;
    }

    // modify user info
    public String modify() {
        User OldUser = userService.getUserInfo(user.getUsername());
        OldUser.setEmail(user.getEmail());
        if (!user.getPassword().equals(""))
            OldUser.setPassword(user.getPassword());
        userService.modifyUser(OldUser);
        return SUCCESS;
    }

    // validate register
    public void validateRegister() {
        if (userService.getUserInfo(user.getUsername()) != null) {
            addFieldError("username", "Username used.");
        }
        if (user.getUsername().equals("")) {
            addFieldError("username", "Username not null.");
        }
        if (user.getPassword().equals("")) {
            addFieldError("password", "Password not null.");
        }
        if (user.getEmail().equals("")) {
            addFieldError("email", "Email not null.");
        }
    }

    // register
    public String register() throws Exception {
        if (userService.register(user))
            return SUCCESS;
        else
            return INPUT;
    }
}
