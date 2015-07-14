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
<s:action name="UserGet" id="bookPage" executeResult="true" namespace="/" />
<div class="container" style="margin-left: 300px">
    <div class="row">
        <div class="col s12 m6">
            <div class="card grey lighten-4 z-depth-1">
                <form action="UserModify.action" method="post" id="addForm">
                    <input type="hidden" name="username" value="<s:property value='#bookPage.user.username' />">
                    <div class="card-content black-text row" style="margin-bottom: 0">
                        <div class="card-title blue lighten-1 white-text"
                             style="margin:-20px -20px 50px -20px; padding:10px 20px 5px 20px">User Info</div>
                        <div class="input-field">
                            <input id="Username" type="text" class="validate" name="user" style="padding-left: 15px; width: 90%" disabled value="<s:property value='#bookPage.user.username' /> ">
                            <label for="Username">Username</label>
                        </div>
                        <div class="input-field">
                            <input id="Email" type="text" class="validate" name="email" style="padding-left: 15px; width: 90%" value="<s:property value='#bookPage.user.email' />">
                            <label for="Email">E-mail</label>
                        </div>
                        <div class="input-field">
                            <input id="Password" type="password" class="validate" name="password" style="padding-left: 15px; width: 90%">
                            <label for="Password">Password</label>
                        </div>
                    </div>
                    <div class="card-action right-align" style="padding:10px">
                        <a href="javascript: return false;" onclick="$('#addForm').submit()">Save</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
