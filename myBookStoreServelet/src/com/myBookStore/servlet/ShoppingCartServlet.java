package com.myBookStore.servlet;

import com.myBookStore.model.Book;
import com.myBookStore.db.BookDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zacks on 15-5-3.
 */
@WebServlet(name = "ShoppingCartServlet", urlPatterns = "/addShoppingCart")
public class ShoppingCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get parameter
        int bookID = Integer.parseInt((String) request.getParameter("bookID"));
        List<Book> shoppingCart = new ArrayList<Book>();
        if (request.getSession().getAttribute("buyBook") != null)
            shoppingCart = (List<Book>) request.getSession().getAttribute("buyBook");
        // action
        shoppingCart.add(BookDB.getInstance().getBook(bookID));
        request.getSession().setAttribute("buyBook", shoppingCart);
        response.sendRedirect("/welcome?position=store");
    }
}
