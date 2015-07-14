<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-25
  Time: 下午4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String add_t = request.getParameter("add");

    String name_t = request.getParameter("name");

    String author_t = request.getParameter("author");
    String publisher_t = request.getParameter("publisher");
    String isbn_t = request.getParameter("isbn");
    String price_t = request.getParameter("price");
    if (add_t.equals("true")){ %>
        <sql:update var="user" dataSource="jdbc/bookStore">
            insert into `books` (`name`, `author`, `publisher`, `isbn`, `price`) values ("<%=name_t%>", "<%=author_t%>", "<%=publisher_t%>", "<%=isbn_t%>", <%=price_t%>);
        </sql:update>
    <%} else {%>
        <sql:update var="user" dataSource="jdbc/bookStore">
            update `books` set `name`="<%=name_t%>", `author`="<%=author_t%>", `publisher`="<%=publisher_t%>", `isbn`="<%=isbn_t%>", `price`=<%=price_t%> where `id`=<%=Integer.parseInt(request.getParameter("add"))%>;
        </sql:update>
    <%}%>


<html>
<body>
<c:redirect url="bookStore.jsp"></c:redirect>
</body>
</html>
