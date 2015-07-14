<%@ taglib prefix="s" uri="/struts-tags" %>
<!--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-6-20
  Time: 下午8:44
  To change this template use File | Settings | File Templates.
-->
<html>
<head>
    <!--Import materialize.css-->
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Login Page</title>
</head>
<body class="blue accent-4">
<div class="container" style="margin-top: 5%;">
    <div class="row">
        <div class=" col s2 offset-s5" style="margin: 0; padding: 0;">
            <img src="src/image/bookstore.jpg" class="z-depth-2" style="border: solid 5px #2196f3; border-radius: 50%; float: left">
        </div>
        <div class="col s6 white z-depth-1 offset-s3" style="margin-top: -20px;">
            <form id="form" method=POST action="UserLogin">
                <div class="row" style="margin-left: 0; margin-right:0;">
                    <div class="col s12 red-text text-accent-3" style="margin: 1.75rem 0 0.5rem 0;">
                        <span class="blue-text text-accent-4">Login</span>
                        <hr>
                        <s:fielderror />
                    </div>
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
                    <a class="col s6" style="line-height: 36px;" id="signup" href="register.jsp">Sign Up</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
