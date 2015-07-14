package com.myBookStore.servlet;

import com.myBookStore.db.OrderDB;
import com.myBookStore.db.UserDB;
import com.myBookStore.model.Order;
import com.myBookStore.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by zacks on 15-5-9.
 */
@WebServlet(name = "QueryUserServlet", urlPatterns = "/queryUser")
public class QueryUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get parameters
        String username = request.getParameter("username");
        // action
        List<Order> orders = OrderDB.getInstance().getOrder(username);
        User user = UserDB.getInstance().getUser(username);
        request.setAttribute("user", user);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("queryUser.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
