package com.myBookStore.servlet;

import com.myBookStore.db.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by zacks on 15-5-9.
 */
@WebServlet(name = "CheckRegisterServlet", urlPatterns = "/checkRegister")
public class CheckRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // for ajax
        response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = response.getWriter();
        String name = request.getParameter("name");
        String value = request.getParameter("val");
        if (name.equals("username")) {
            if (UserDB.getInstance().checkUser(value)) {
                 pw.print("{ name: 'username', value: 'This name is already registered.' }");
            }
            else if (value.equals("")) {
                pw.print("{ name: 'username', value: 'Username not null.' }");
            }
            else {
                pw.print("{ name: 'username', value: '&nbsp' }");
            }
        }
        if (name.equals("password")) {
            if (value.equals("")) {
                pw.print("{ name: 'password', value: 'Password not null.' }");
            }
            else {
                pw.print("{ name: 'password', value: '&nbsp' }");
            }
        }
        if (name.equals("email")) {
            if (value.equals("")) {
                pw.print("{ name: 'email', value: 'E-mail not null.' }");
            }
            else {
                pw.print("{ name: 'email', value: '&nbsp' }");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
