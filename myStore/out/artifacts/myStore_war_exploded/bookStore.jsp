<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-25
  Time: 下午3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>eBook Store</title>
    <link rel="stylesheet" type="text/css" href="src/easy-ui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="src/easy-ui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="src/bookStore.css">
    <script type="text/javascript" src="src/easy-ui/jquery.min.js"></script>
    <script type="text/javascript" src="src/easy-ui/jquery.easyui.min.js"></script>
</head>
<body>
    <div id="container">
        <%@include file="header.jsp"%>
        <div class="easyui-tabs" data-options="tabwidth:100">
            <div title="Books">
                <%@include file="allBooks.jsp"%>
            </div>
            <div title="Users">
                <%if (session.getAttribute("currentUser").equals("admin")) {%>
                <%@include file="allUser.jsp"%>
                <%} else {%>
                <sql:query var="user" dataSource="jdbc/bookStore">
                    select * from user where Username="<%=session.getAttribute("currentUser")%>";
                </sql:query>
                <p>Your current E-mail: ${user.rows[0].email}</p>
                <form id="userForm" action="modifyUser.jsp">
                    <p>New E-mail: <input class="easyui-textbox" name="newEmail" type="text" size="20"/></p>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="document.getElementById('userForm').submit();">Submit</a>
                </form>
                <%}%>
            </div>
            <div title="Orders">
                <%@include file="allOrders.jsp"%>
            </div>
        </div>
    </div>

</body>
</html>
