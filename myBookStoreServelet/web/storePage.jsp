<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-2
  Time: 下午2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Store Page</title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNavPage.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <c:forEach var="bookItem" items="${requestScope.books}">
            <div class="col s12 m6">
                <div class="card grey lighten-4 z-depth-1">
                    <div class="card-content black-text">
                        <div class="card-title blue lighten-1 white-text"
                             style="margin:-20px -20px 10px -20px; padding:10px 20px 5px 20px">${bookItem.name}</div>
                        <p>
                            The book is written by <b>${bookItem.author}</b>.<br>
                            The publisher <b>${bookItem.publisher}</b> published it.<br>
                            The ISBN code of this book is <b>${bookItem.isbn}</b>.<br>
                            The price is <b>${bookItem.price}</b>.<br>
                        </p>
                    </div>
                    <div class="card-action right-align" style="padding:10px">
                        <% if (request.getSession().getAttribute("currentUser").equals("admin")) {%>
                        <c:url value="/bookAction" var="url">
                            <c:param name="bookID" value="${bookItem.id}"></c:param>
                            <c:param name="action" value="delete"></c:param>
                        </c:url>
                        <a href="${url}">Delete</a>
                        <%} else {%>
                        <c:url value="/addShoppingCart" var="url">
                            <c:param name="bookID" value="${bookItem.id}"></c:param>
                            <c:param name="action" value="buy"></c:param>
                        </c:url>
                        <a href="${url}"><i class="small mdi-action-add-shopping-cart"></i></a>
                        <%}%>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${sessionScope.currentUser == 'admin'}">
            <div class="col s12 m6">
                <div class="card grey lighten-4 z-depth-1">
                    <form action="/bookAction" method="post" id="addForm">
                        <input type="hidden" name="action" value="add">
                        <div class="card-content black-text row" style="margin-bottom: 0">
                            <div class="card-title blue lighten-1 white-text"
                                 style="margin:-20px -20px 10px -20px; padding:10px 20px 5px 20px">Add Book</div>
                            <div class="input-field col s12">
                                <input id="bookName" type="text" class="validate" name="bookName">
                                <label for="bookName">Book Name</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="author" type="text" class="validate" name="author">
                                <label for="author">Author</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="publisher" type="text" class="validate" name="publisher">
                                <label for="publisher">Publisher</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="isbn" type="text" class="validate" style="margin-bottom: 0" name="isbn">
                                <label for="isbn">ISBN Number</label>
                            </div>
                            <div class="input-field col s6" >
                                <input id="price" type="number" class="validate" style="margin-bottom: 0" name="price">
                                <label for="price">Price</label>
                            </div>
                        </div>
                        <div class="card-action right-align" style="padding:10px">
                            <a href="javascript: return false;" onclick="$('#addForm').submit()">Add</a>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
