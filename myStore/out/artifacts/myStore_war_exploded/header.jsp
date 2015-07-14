<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-29
  Time: 下午10:16
  To change this template use File | Settings | File Templates.
--%>
<html>
<body>
    <div id="header">
        <h2 style="display: inline-flex">Welcome <%=session.getAttribute("currentUser")%></h2>
        <a style="display: inline-flex; float:right;" href="logout.jsp">Logout</a>
    </div>

</body>
</html>
