package com.myBookStore.servlet;

import com.myBookStore.db.OrderDB;
import com.myBookStore.model.Book;
import com.myBookStore.db.BookDB;
import com.myBookStore.model.Order;
import com.myBookStore.model.User;
import com.myBookStore.db.UserDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by zacks on 15-5-1.
 */
@WebServlet(name = "com.myBookStore.servlet.WelcomeServlet", urlPatterns = "/welcome")
public class WelcomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get parameter
        String pos = (String) request.getParameter("position");
        // do actions according to position
        if (pos.equals("store")) {
            List<Book> books = null;
            if (request.getSession().getAttribute("currentUser").equals("admin")) {
                books = BookDB.getInstance().getAllBook();
            } else {
                books = BookDB.getInstance().getAvailableBook((String)request.getSession().getAttribute("currentUser"));
            }
            request.setAttribute("books", books);
            request.getRequestDispatcher("storePage.jsp").forward(request, response);
        }
        if (pos.equals("myBooks")) {
            List<Book> books = null;
            books = BookDB.getInstance().getMyBook((String) request.getSession().getAttribute("currentUser"));
            request.setAttribute("books", books);
            request.getRequestDispatcher("myBooksPage.jsp").forward(request, response);
        }
        if (pos.equals("users")) {
            List<User> users = null;
            users = UserDB.getInstance().getUser();
            request.setAttribute("users", users);
            request.getRequestDispatcher("usersPage.jsp").forward(request, response);
        }
        if (pos.equals("stat")) {
            Map<String, Integer> userStat = OrderDB.getInstance().getStat();
            request.setAttribute("userStat", userStat);
            int[] monthStat = OrderDB.getInstance().getMonthStat();
            request.setAttribute("monthStat", monthStat);
            List<Order> recentOrder = OrderDB.getInstance().getRecentOrder();
            System.out.println(recentOrder);
            request.setAttribute("recentOrder", recentOrder);
            request.getRequestDispatcher("statPage.jsp").forward(request, response);
        }
    }
}
