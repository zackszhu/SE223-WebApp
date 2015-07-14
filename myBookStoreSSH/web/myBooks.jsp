<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-2
  Time: 下午5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - My Books </title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNav.jsp"></jsp:include>
<s:action name="MyBooks" id="myBooks" executeResult="true" namespace="/" />
<div class="container" style="margin-left: 300px">
    <div class="row">
        <ul class="collection with-header grey lighten-4 z-depth-1">
            <li class="collection-header blue lighten-1">
                <h4 class="white-text">My Books</h4>
            </li>
            <s:iterator value="#myBooks.bookList" id="entry">
                <li class="collection-item">
                    <div><s:property value="#entry.name" /> (<s:property value="#entry.author" />)
                        <a href="#" class="secondary-content"> Read! </a>
                </li>
            </s:iterator>
        </ul>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>