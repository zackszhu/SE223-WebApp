<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-31
  Time: 下午11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
    <% if (session.getAttribute("currentUser").equals("admin")) { %>
    <sql:query var="orders" dataSource="jdbc/bookStore">
        select * from `order`;
    </sql:query>
    <%}
    else {%>
    <sql:query var="user" dataSource="jdbc/bookStore">
        select * from user where Username="<%=session.getAttribute("currentUser")%>";
    </sql:query>
    <sql:query var="orders" dataSource="jdbc/bookStore">
        select * from `order` where userID=${user.rows[0].id};
    </sql:query>
    <%}%>
    <table id="orderData"class="easyui-datagrid" data-options="singleSelect:true,autoRowHeight:true">
        <thead>
        <tr>
            <th data-options="field: 'OrderID',align: 'center',resizable: false" width="10%"> Order ID </th>
            <th data-options="field: 'BookID',align: 'center',resizable: false" width="10%"> Book ID </th>
            <th data-options="field: 'UserID',align: 'center',resizable: false" width="10%"> User ID </th>
            <th data-options="field: 'Status',align: 'center',resizable: false" width="10%"> Status </th>
            <th data-options="field: 'Op',align: 'center',resizable: false" width="10%"> Operation </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="orderItem" items="${orders.rows}">
            <tr>
                <td>${orderItem.id}</td>
                <td>${orderItem.bookID}</td>
                <td>${orderItem.userID}</td>
                <td>${orderItem.status}</td>
                <c:url value="deleteOrder.jsp" var="url">
                    <c:param name="orderId" value="${orderItem.id}"></c:param>
                </c:url>
                <td><a href="${url}">Cancel</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>