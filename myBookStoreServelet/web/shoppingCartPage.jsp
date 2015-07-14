<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-3
  Time: 下午5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Welcome to My Bookstore - Shopping Cart</title>
    <link rel="stylesheet" type="text/css"
          href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

</head>
<body class="blue accent-4">
<jsp:include page="sideNavPage.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <form method="post" action="/bookAction">
            <input type="hidden" name="action" value="buy"/>
            <ul class="collection with-header grey lighten-4 z-depth-1 input-field">
                <li class="collection-header blue lighten-1">
                    <h4 class="white-text">Shopping Cart</h4>
                </li>
                <button class="btn-floating btn-large waves-effect waves-light red right"
                        style="margin-top: -27px; margin-right:100px;" type="submit" name="buy">Buy
                </button>
                <c:forEach var="bookItem" items="${sessionScope.buyBook}" varStatus="loop">
                    <li class="collection-item grey lighten-4" style="position: relative; padding-bottom: 1.5rem">
                        <input id="${loop.index}" type="checkbox" name="bookID" value="${bookItem.id}"/>
                        <label for="${loop.index}" style="font-size: 1.5em; line-height:24px"
                               class="grey-text text-darken-3">${bookItem.name}
                            <span style="line-height:24px; margin-left: 1rem;"
                                  class="grey-text"> ¥${bookItem.price}</span>
                        </label>

                    </li>
                </c:forEach>
            </ul>
        </form>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
