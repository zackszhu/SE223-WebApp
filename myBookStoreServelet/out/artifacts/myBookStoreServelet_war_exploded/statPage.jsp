<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-7
  Time: 下午10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Statistics </title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNavPage.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <div class="grey lighten-5 z-depth-2 col s12 m6" style="padding:0">
            <p class="blue white-text" style="font-size: 2em;margin:0; padding: 10px;"> User Stats</p>
            <table class="centered hoverable" style="border-collapse: separate;">
                <thead>
                <tr>
                    <th data-field="name">Username</th>
                    <th data-field="count">Order Count</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="userItem" items="${requestScope.userStat}">
                    <tr>
                        <td>
                                ${userItem.key}
                        </td>
                        <td>
                                ${userItem.value}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="grey lighten-5 z-depth-2 col s12 m5 offset-m1" style="padding:0">
            <p class="blue white-text" style="font-size: 2em;margin:0; padding: 10px;">Order per Month</p>
            <table class="centered hoverable" style="border-collapse: separate;">
                <thead>
                <tr>
                    <th data-field="name">Month</th>
                    <th data-field="count">Order Count</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = 1; i <= 12; i++) {
                        int num = ((int[])request.getAttribute("monthStat"))[i];
                        String[] month = {"", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"};
                %>
                    <tr>
                        <td>
                            <%=month[i]%>
                        </td>
                        <td>
                            <%=num%>
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="grey lighten-5 z-depth-2 col m12" style="padding:0">
            <p class="blue white-text" style="font-size: 2em;margin:0; padding: 10px;">Recent Orders</p>
            <table class="centered hoverable" style="border-collapse: separate;">
                <thead>
                <tr>
                    <th data-field="username">Username</th>
                    <th data-field="bookname">Book Name</th>
                    <th data-field="time">Order Time</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="orderItem" items="${requestScope.recentOrder}">
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
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</html>
