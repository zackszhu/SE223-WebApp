<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-3
  Time: 下午3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - User Page</title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNavPage.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <div class="col s4 z-depth-2 right grey lighten-4" style="padding-right: 0">
            <form action="/queryUser" method="post">
                <input placeholder="Search User" id="searchUser" type="text" name="username" class="col s9  grey lighten-4" style="margin:7.5px 0">
                <button class="waves-effect waves-teal btn-flat blue col s3 grey lighten-4" style="padding:0;margin-top:12px"><i class="mdi-action-search small"></i></button>
            </form>
        </div>
    </div>
    <div class="row">
        <table class="grey lighten-4 z-depth-2" style="border-spacing:2rem; border-collapse: separate;">
            <thead>
            <tr>
                <th data-field="id">ID</th>
                <th data-field="username">Name</th>
                <th data-field="email">E-mail</th>
                <th data-field="time">Create Time</th>
                <th data-field="status">Status</th>
                <th data-field="action">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="userItem" items="${requestScope.users}">
                <tr>
                    <td>${userItem.id}</td>
                    <td>${userItem.username}</td>
                    <td>${userItem.email}</td>
                    <td>${userItem.createTime}</td>
                    <td>${userItem.status}</td>
                    <td>
                        <c:url value="/banUser" var="url">
                            <c:param name="userID" value="${userItem.id}"></c:param>
                        </c:url>
                        <a href="${url}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
