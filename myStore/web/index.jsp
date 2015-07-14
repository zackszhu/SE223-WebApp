<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML>

<html>
<head>
    <title>My eBook Store</title>

</head>
<body">
    <% if (session.getAttribute("currentUser") == null) { %>
        <%@include file="login.jsp"%>
    <%  }
        else {%>
            <c:redirect url="bookStore.jsp"></c:redirect>
    <%  } %>

</body>
</html>