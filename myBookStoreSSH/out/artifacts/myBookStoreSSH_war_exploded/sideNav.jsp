<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-6
  Time: 下午3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<body>
<ul id="slide-out" class="side-nav fixed z-depth-2" style="width: 240px;">
    <li class="logo" style="text-align: center; margin-top: 32px; margin-bottom: 16px; border-bottom: 1px solid #ddd">
        <img src="src/image/bookstore.jpg"
             style="width:100%; height:auto">
        <p style="font-size: 1.5em;padding-left: 15px" class="left-align grey-text text-darken-3">${sessionScope.currentUser}</p>
    </li>
    <li><a href="bookPage.jsp">Store Page</a></li>
    <s:if test="#session.currentUser == 'admin'">
        <li><a href="users.jsp">Users</a></li>
        <li><a href="statistics.jsp">Statistics</a></li>
    </s:if>
    <s:else>
        <li><a href="userModify.jsp">My Info</a></li>
        <li><a href="myBooks.jsp">My Books</a></li>
        <li><a href="shoppingCart.jsp">Shopping Cart</a></li>
    </s:else>
    <li style="margin-top: 16px; margin-bottom: 32px; border-top: 1px solid #ddd">
        <a href="UserLogout.action"> Log Out</a>
    </li>
</ul>
<a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
<script type="text/javascript">
    $(document).ready(function () {
        $(".button-collapse").sideNav();
    });
</script>
</body>
</html>
