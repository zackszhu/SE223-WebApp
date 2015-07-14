package com.myBookStore.servlet;

import com.myBookStore.db.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zacks on 15-5-3.
 */
@WebServlet(name = "BanUserServlet", urlPatterns = "/banUser")
public class BanUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt((String) request.getParameter("userID"));
        UserDB.getInstance().banUser(userID);
        response.sendRedirect("/welcome?position=users");
    }
}
