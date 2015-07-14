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
<%  String username_t = request.getParameter("username");
    String password_t = request.getParameter("password");
%>
<sql:query var="user" dataSource="jdbc/bookStore" >
    select * from user where username="<%=username_t%>";
</sql:query>

<html>
<body>
    <% session.setAttribute("currentUser", null); %>
    <c:set value="${user.rows[0]}" var="userItem" ></c:set>
    <c:set value="<%=password_t%>" var="inputPassword"></c:set>
    <c:choose>
        <c:when test= "${ userItem.password == inputPassword }">
            <%  session.setAttribute("loginSuc", true); %>
            <% session.setAttribute("currentUser", username_t); %>
        </c:when>
        <c:otherwise>
            <%  session.setAttribute("loginSuc", false); %>

        </c:otherwise>
    </c:choose>
    <c:redirect url="index.jsp"></c:redirect>
</body>

</html>
