<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-4-2
  Time: 上午12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:update var="user" dataSource="jdbc/bookStore">
    update `user` set `Email`="<%=request.getParameter("newEmail")%>" where `Username`="<%=session.getAttribute("currentUser")%>";
</sql:update>
<c:redirect url="bookStore.jsp"/>
