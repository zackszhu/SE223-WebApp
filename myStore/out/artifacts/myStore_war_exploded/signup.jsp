<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-25
  Time: 下午9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sign up</title>
    <link rel="stylesheet" type="text/css" href="src/easy-ui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="src/easy-ui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="src/login.css">

</head>
<body>
    <div id="container">
        <h1>Welcome to my ebook store</h1>
        <h2>Please signup</h2>
        <div class="easyui-panel">
            <form id="form" method = POST action = newUser.jsp>
                <%
                    if (request.getParameterNames().hasMoreElements() && request.getParameter("dup").equals("true")) {%>
                    <p style="text-align: center;padding-bottom: 0;">Username already exists.</p>
                <%}%>
                <table>
                    <tr>
                        <td>Username:</td>
                        <td><input class="easyui-textbox" data-options="required:true" type="text" name="username" size="20"/></td>
                    </tr>
                    <tr>
                        <td>E-mail:</td>
                        <td><input class="easyui-textbox" data-options="required:true,validType:'email'" type="text" name="email" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input class="easyui-textbox" data-options="required:true" type="password" name="password" size="20"/></td>
                    </tr>
                    <tr>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a></td>
                        <td><a href="index.jsp" class="easyui-linkbutton">Back</a></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="src/easy-ui/jquery.min.js"></script>
    <script type="text/javascript" src="src/easy-ui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function submitForm(){
            $('#form').form('submit',{
                onSubmit:function(){
                    return $(this).form('enableValidation').form('validate');
                }
            });
        }
    </script>
</body>
</html>
