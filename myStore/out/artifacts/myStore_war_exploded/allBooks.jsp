<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-31
  Time: 上午8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
    <% if (session.getAttribute("currentUser").equals("admin")) { %>
        <sql:query var="books" dataSource="jdbc/bookStore">
            select * from books;
        </sql:query>
    <%}
    else {%>
        <sql:query var="books" dataSource="jdbc/bookStore">
            select * from books where status=0;
        </sql:query>
    <%}%>
    <table id="bookData"class="easyui-datagrid" data-options="singleSelect:true,autoRowHeight:true">
        <thead>
        <tr>
            <th data-options="field: 'bookID',align: 'center',resizable: false" width="5%"> Book ID </th>
            <th data-options="field: 'Bookname',align: 'center',resizable: false" width="15%"> Book Name </th>
            <th data-options="field: 'Author',align: 'center',resizable: false" width="10%"> Auther </th>
            <th data-options="field: 'Publisher',align: 'center',resizable: false" width="20%"> Publisher </th>
            <th data-options="field: 'ISBN',align: 'center',resizable: false" width="30%"> ISBN </th>
            <th data-options="field: 'Price',align: 'center',resizable: false" width="5%"> Price </th>
            <th data-options="field: 'Status',align: 'center',resizable: false" width="5%"> Status </th>
            <th data-options="field: 'Op',align: 'center',resizable: false" width="10%"> Operation </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="bookItem" items="${books.rows}">
            <tr>
                <td>${bookItem.id}</td>
                <td>${bookItem.Name}</td>
                <td>${bookItem.Author}</td>
                <td>${bookItem.Publisher}</td>
                <td>${bookItem.ISBN}</td>
                <td>${bookItem.Price}</td>
                <td>${bookItem.Status}</td>
                <% if (session.getAttribute("currentUser").equals("admin")) { %>
                    <%--<a href="">Delete</a>--%>
                    <c:url value="deleteBook.jsp" var="url">
                        <c:param name="bookId" value="${bookItem.id}"></c:param>
                    </c:url>
                    <td><a href="${url}">Delete</a> <a href="javascript:return false;" onclick="showMod(${bookItem.id})">Modify</a></td>

                    <%
                    }
                    else { %>
                    <c:url value="buyBook.jsp" var="url">
                        <c:param name="bookId" value="${bookItem.id}"></c:param>
                    </c:url>
                    <td><a href="${url}">Buy</a></td>
                    <%}%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a class="easyui-linkbutton" href="javascript:return false;" onclick="showAdd()">Add Book</a>
    <div id="bookInfo" style="margin:auto">
        <form id="form" method = POST action = newBook.jsp>
            <input id="addNot" name="add" type="hidden"/>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="text" name="name" size="20"/></td>
                </tr>
                <tr>
                    <td>Author:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="text" name="author" size="20"/></td>
                </tr>
                <tr>
                    <td>Publisher:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="text" name="publisher" size="20"/></td>
                </tr>
                <tr>
                    <td>ISBN:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="text" name="isbn" size="20"/></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="text" name="price" size="20"/></td>
                </tr>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="document.getElementById('form').submit();">Submit</a></td>
                    <td><a href="index.jsp" class="easyui-linkbutton">Back</a></td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#bookInfo").hide();
        })
        function showAdd(){
            $("#bookInfo").show();
            $("#addNot").val("true");
        }
        function showMod(num){
            $("#bookInfo").show();
            $("#addNot").val(num);
        }
    </script>
</body>
</html>
