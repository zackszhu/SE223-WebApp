package com.myBookStore.servlet;

import com.myBookStore.model.Book;
import com.myBookStore.db.BookDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by zacks on 15-5-2.
 */
@WebServlet(name = "BookActionServlet", urlPatterns = "/bookAction")
public class BookActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = (String) request.getParameter("action");
        if (action.equals("delete")) {
            int bookID = Integer.parseInt((String) request.getParameter("bookID"));
            BookDB.getInstance().deleteBook(bookID);
            response.sendRedirect("/welcome?position=store");
        }
        if (action.equals("add")) {
            // get parameters
            String bookName = request.getParameter("bookName");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String isbn = request.getParameter("isbn");
            double price = Double.parseDouble((String) request.getParameter("price"));
            // action
            BookDB.getInstance().addBook(new Book(bookName, author, publisher, isbn, price));
            response.sendRedirect("/welcome?position=store");
        }
        if (action.equals("buy")) {
            // get parameters
            List<Book> shoppingCart = (List<Book>) request.getSession().getAttribute("buyBook");
            String user = (String) request.getSession().getAttribute("currentUser");
            String[] books = request.getParameterValues("bookID");
            // action
            for (String s : books) {
                int bookID = Integer.parseInt(s);
                // delete from shopping cart
                for (Iterator<Book> iter = shoppingCart.listIterator(); iter.hasNext(); ) {
                    Book book = iter.next();
                    if (book.getId() == bookID) {
                        iter.remove();
                    }
                }
                BookDB.getInstance().buyBook(bookID, user);
            }
            request.getSession().setAttribute("buyBook", shoppingCart);
            response.sendRedirect("/welcome?position=myBooks");
        }
    }
}
