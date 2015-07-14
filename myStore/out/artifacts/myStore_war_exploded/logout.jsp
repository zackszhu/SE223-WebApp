<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-29
  Time: 下午10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% session.setAttribute("currentUser", null); %>
<c:redirect url="index.jsp"></c:redirect>