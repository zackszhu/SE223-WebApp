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
    String email_t = request.getParameter("email");
    String password_t = request.getParameter("password");
    System.out.println("aaa"+username_t);
%>
<c:catch var="exception">
    <sql:update var="user" dataSource="jdbc/bookStore">
        insert into `user` (`username`, `email`, `password`) values ("<%=username_t%>", "<%=email_t%>", "<%=password_t%>");
    </sql:update>
</c:catch>
<c:if test="${exception != null}">
    <c:url value="signup.jsp" var="url">
        <c:param name="dup" value="true"></c:param>
    </c:url>
    <c:redirect url="${url}"></c:redirect>
</c:if>
<% session.setAttribute("currentUser", username_t); %>
<c:redirect url="index.jsp"></c:redirect>



