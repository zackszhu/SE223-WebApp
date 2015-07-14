<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-31
  Time: 上午8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:query var="users" dataSource="jdbc/bookStore">
    select * from user;
</sql:query>
<html>
<body>
    <table id="userData"class="easyui-datagrid" data-options="singleSelect:true,autoRowHeight:true">
        <thead>
            <tr>
                <th data-options="field: 'UserID',align: 'center',resizable: false" width="5%"> User ID </th>
                <th data-options="field: 'Username',align: 'center',resizable: false" width="10%"> Username </th>
                <th data-options="field: 'Password',align: 'center',resizable: false" width="10%"> Password </th>
                <th data-options="field: 'Email',align: 'center',resizable: false" width="30%"> E-mail </th>
                <th data-options="field: 'CreateTime',align: 'center',resizable: false" width="30%"> Create Time </th>
                <th data-options="field: 'Status',align: 'center',resizable: false" width="5%"> Status </th>
                <th data-options="field: 'Op',align: 'center',resizable: false" width="10%"> Operation </th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="userItem" items="${users.rows}">
                <tr>
                    <td>${userItem.id}</td>
                    <td>${userItem.Username}</td>
                    <td>${userItem.Password}</td>
                    <td>${userItem.Email}</td>
                    <td>${userItem.create_time}</td>
                    <td>${userItem.Status}</td>
                    <c:url value="deleteUser.jsp" var="url">
                        <c:param name="userId" value="${userItem.id}"></c:param>
                    </c:url>
                    <td><a href="${url}">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>

