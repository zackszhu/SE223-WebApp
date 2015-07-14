<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-2
  Time: 下午5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - My Books </title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNavPage.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <ul class="collection with-header grey lighten-4 z-depth-1">
            <li class="collection-header blue lighten-1">
                <h4 class="white-text">My Books</h4>
            </li>
            <c:forEach var="bookItem" items="${requestScope.books}">
                <li class="collection-item">
                    <div>${bookItem.name} (${bookItem.author})
                        <a href="#" class="secondary-content"> Read! </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>