<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-6-20
  Time: 下午6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Store Page</title>
</head>
<body class="blue accent-4">
    <jsp:include page="sideNav.jsp"></jsp:include>
    <s:action name="AllBooks" id="bookPage" executeResult="true" namespace="/" />
    <div class="container" style="margin-left: 300px">
        <div class="row">
            <div class="col s4 z-depth-2 right grey lighten-4" style="padding-right: 0">
                <form action="BookQuery" method="post">
                    <input placeholder="Search Book" id="searchBook" type="text" name="bookName" class="col s9  grey lighten-4" style="margin:7.5px 0">
                    <button class="waves-effect waves-teal btn-flat blue col s3 grey lighten-4" style="padding:0;margin-top:12px"><i class="mdi-action-search small"></i></button>
                </form>
            </div>
        </div>
        <div class="row">
            <s:iterator value="#bookPage.bookList" id="entry">
                <div class="col s12 m6">
                    <div class="card grey lighten-4 z-depth-1">
                        <div class="card-content black-text">
                            <div class="card-title blue lighten-1 white-text"
                                 style="margin:-20px -20px 10px -20px; padding:10px 20px 5px 20px"><s:property value="#entry.name" /> </div>
                            <p>
                                The book is written by <b><s:property value="#entry.author" /> </b>.<br>
                                The publisher <b><s:property value="#entry.publisher" /> </b> published it.<br>
                                The ISBN code of this book is <b><s:property value="#entry.isbn" /> </b>.<br>
                                The price is <b><s:property value="#entry.price" /> </b>.<br>
                            </p>
                        </div>
                        <div class="card-action right-align" style="padding:10px">
                            <s:if test="#session.currentUser == 'admin'">
                                <s:form action="BookDelete">
                                    <input type="hidden" name="bookID" value="<s:property value='#entry.id' />" />
                                    <button class="btn waves-effect waves-light" type="submit" name="action">Delete</button>
                                </s:form>
                            </s:if>
                            <s:else>
                                <s:form action="BookShoppingCart" id="buyForm">
                                    <input type="hidden" name="bookID" value="<s:property value='#entry.id' />" />
                                    <button class="btn waves-effect waves-light" type="submit" name="action"><i class="small mdi-action-add-shopping-cart"></i></button>
                                </s:form>
                            </s:else>
                        </div>
                    </div>
                </div>
            </s:iterator>
            <s:if test="#session.currentUser == 'admin'">
                <div class="col s12 m6">
                    <div class="card grey lighten-4 z-depth-1">
                        <form action="BookAdd" method="post" id="addForm">
                            <input type="hidden" name="action" value="add">
                            <div class="card-content black-text row" style="margin-bottom: 0">
                                <div class="card-title blue lighten-1 white-text"
                                     style="margin:-20px -20px 10px -20px; padding:10px 20px 5px 20px">Add Book</div>
                                <div class="input-field col s12">
                                    <input id="name" type="text" class="validate" name="name">
                                    <label for="name">Book Name</label>
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
                                <input type="hidden" name="rating" value="0" />
                                <input type="hidden" name="status" value="0" />
                            </div>
                            <div class="card-action right-align" style="padding:10px">
                                <a href="javascript: return false;" onclick="$('#addForm').submit()">Add</a>
                            </div>
                        </form>
                    </div>
                </div>
            </s:if>
        </div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
