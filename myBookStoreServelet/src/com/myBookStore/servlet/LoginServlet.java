package com.myBookStore.servlet;

import com.myBookStore.db.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zacks on 15-5-1.
 */
@WebServlet(name = "com.myBookStore.servlet.LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get parameter and forward
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (UserDB.getInstance().loginUser(username, password)) {
            request.getSession().setAttribute("currentUser", username);
            response.sendRedirect("/index");
        } else {
            request.setAttribute("loginSuc", false);
            request.getRequestDispatcher("/loginPage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
