<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-10
  Time: 下午1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Query User</title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNavPage.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <div class="grey lighten-5 z-depth-2 col s12" style="padding:0">
            <p class="blue white-text" style="font-size: 2em;margin:0; padding: 10px;"> User Info</p>
            <table class="centered hoverable" style="border-collapse: separate;">
                <thead>
                <tr>
                    <th data-field="id">User ID</th>
                    <th data-field="name">Username</th>
                    <th data-field="email">E-mail</th>
                    <th data-field="time">Create Time</th>
                    <th data-field="status">Status</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            ${requestScope.user.id}
                        </td>
                        <td>
                            ${requestScope.user.username}
                        </td>
                        <td>
                            ${requestScope.user.email}
                        </td>
                        <td>
                            ${requestScope.user.createTime}
                        </td>
                        <td>
                            ${requestScope.user.status}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="grey lighten-5 z-depth-2 col s12" style="padding:0">
            <p class="blue white-text" style="font-size: 2em;margin:0; padding: 10px;">His/Her Orders</p>
            <table class="centered hoverable" style="border-collapse: separate;">
                <thead>
                <tr>
                    <th data-field="name">Username</th>
                    <th data-field="bookName">Book Name</th>
                    <th data-field="time">Create Time</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="orderItem" items="${requestScope.orders}">
                        <tr>
                            <td>
                                    ${orderItem.username}
                            </td>
                            <td>
                                    ${orderItem.bookName}
                            </td>
                            <td>
                                    ${orderItem.createTime}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>



</body>
</html>
