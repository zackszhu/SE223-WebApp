<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-31
  Time: 下午11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String id_t = request.getParameter("bookId"); %>
<sql:query var="user" dataSource="jdbc/bookStore">
    select * from user where Username="<%=session.getAttribute("currentUser")%>";
</sql:query>
<c:set value="${user.rows[0]}" var="userItem" ></c:set>
<sql:update var="buy" dataSource="jdbc/bookStore">
    insert into `order` (`bookID`, `userID`) values (<%=id_t%>, ${userItem.id});
</sql:update>

<c:redirect url="bookStore.jsp"></c:redirect>

