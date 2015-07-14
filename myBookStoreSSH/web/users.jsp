<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-3
  Time: 下午3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - User Page</title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNav.jsp"></jsp:include>
<s:action name="AllUsers" id="userPage" executeResult="true" namespace="/" />
<div class="container" style="margin-left: 300px">
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
            <s:iterator value="#userPage.userList" id="entry">
                <tr>
                    <td><s:property value="#entry.id" /></td>
                    <td><s:property value="#entry.username" /></td>
                    <td><s:property value="#entry.email" /></td>
                    <td><s:property value="#entry.createTime" /></td>
                    <td><s:property value="#entry.status" /></td>
                    <td>
                        <s:form action="UserDelete">
                            <input type="hidden" name="userID" value="<s:property value='#entry.id' />" />
                            <button class="btn waves-effect waves-light" type="submit" name="action">Delete</button>
                        </s:form>
                    </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
