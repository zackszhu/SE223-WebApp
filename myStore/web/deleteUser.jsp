<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-30
  Time: 下午4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String id_t = request.getParameter("userId"); %>
<sql:update var="user" dataSource="jdbc/bookStore">
    update `user` set status=1 where id=<%=id_t%>;
</sql:update>

<c:redirect url="bookStore.jsp"></c:redirect>

