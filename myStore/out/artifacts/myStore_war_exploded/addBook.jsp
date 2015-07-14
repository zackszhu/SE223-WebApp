<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-25
  Time: 下午9:43
  To change this template use File | Settings | File Templates.
--%>
<html>
<body>
    <form id="form" method = POST action = newBook.jsp>
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
</body>
</html>
