package com.myBookStore.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zacks on 15-5-6.
 */
@WebFilter(filterName = "AuthorityFilter", urlPatterns = {
        "/banUser", "/bookAction", "/logout",
        "/addShoppingCart", "/welcome", "/queryUser"
})
public class AuthorityFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        System.out.println(request.getSession().getAttribute("currentUser") == null);
        if (request.getSession().getAttribute("currentUser") == null) {
            System.out.println("filter2");
            request.getRequestDispatcher("/index").forward(request, response);
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
