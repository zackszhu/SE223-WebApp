<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-3-25
  Time: 下午4:05
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="src/easy-ui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="src/easy-ui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="src/login.css">
</head>
<body>
    <h1>Welcome to my ebook store</h1>
    <h2>Please login</h2>
    <div class="easyui-panel">
        <form id="form" data-options="novalidate:true" method = POST action = setUser.jsp>

            <table>
                <tr>
                    <td>
                        <%  Object logined = session.getAttribute("loginSuc");
                            if (logined == null) {
                                logined = true;
                            }
                            if (logined.equals(false)) { %>
                        Login failed.
                        <%  }%>
                    </td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="text" name="username" size="20"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input class="easyui-textbox" data-options="required:true" type="password" name="password" size="20"/></td>
                </tr>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="document.getElementById('form').submit();">Submit</a></td>
                    <td><a id="signup" href="signup.jsp">Sign Up</a></td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript" src="src/easy-ui/jquery.min.js"></script>
    <script type="text/javascript" src="src/easy-ui/jquery.easyui.min.js"></script>
</body>
</html>
