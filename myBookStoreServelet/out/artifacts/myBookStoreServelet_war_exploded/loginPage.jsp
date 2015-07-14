<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-1
  Time: 下午2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--Import materialize.css-->
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Login Page</title>
</head>
<%--style="background-image: url('src/image/background.jpg')"--%>
<body class="blue accent-4">
<%--<img src="src/image/background.jpg" style="width: 100%; height: auto; position: absolute;z-index: -100;">--%>
<div class="container" style="margin-top: 5%;">
    <div class="row">
        <div class=" col s2 offset-s5" style="margin: 0; padding: 0;">
            <img src="src/image/bookstore.jpg" class="z-depth-2" style="border: solid 5px #2196f3; border-radius: 50%; float: left">
        </div>
        <div class="col s6 white z-depth-1 offset-s3" style="margin-top: -20px;">
            <form id="form" method=POST action="/login">
                <div class="row" style="margin-left: 0; margin-right:0;">
                    <div class="col s12" style="margin: 1.75rem 0 0.5rem 0;">
                        <span class="blue-text text-accent-4">Login</span>
                        <hr>
                    </div>

                    <% Object logined = request.getAttribute("loginSuc");
                        if (logined == null) {
                            logined = true;
                        }
                        if (logined.equals(false)) { %>
                    <div class="col s12 red lighten-5" style="margin-top: 1rem; padding: 0.5rem">
                        <span class="red-text text-accent-3">Invalid username or password.</span>
                    </div>
                    <% }%>

                    <div class="input-field col s12">
                        <input id="Username" type="text" class="validate" name="username">
                        <label for="Username">Username</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="Password" type="password" class="validate" name="password">
                        <label for="Password">Password</label>
                    </div>
                </div>
                <div class="row" style="margin-left: 0; margin-right:0;">
                    <button class="btn waves-effect col" type="submit" name="action" style="margin:0 0.75rem;">Submit
                        <i class="mdi-content-send right"></i>
                    </button>
                    <a class="col s6" style="line-height: 36px;" id="signup" href="registerPage.jsp">Sign Up</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
