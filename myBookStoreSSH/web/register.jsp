<%@ taglib prefix="s" uri="/struts-tags" %>
<!--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-1
  Time: 下午4:14
  To change this template use File | Settings | File Templates.
-->

<html>
<head>
    <link rel="stylesheet" href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="src/css/register.css">
    <title>Welcome to My Bookstore - Register</title>
</head>
<body class="blue accent-4">
<div class="container" style="margin-top: 5%;">
    <form id="form" method=POST action="UserRegister">
        <input type="hidden" name="status" value="0"/>
        <div class="row" style="margin-left: 0; margin-right:0;">
            <div class="col s6 offset-s3 white z-depth-1" style="padding: 0.75rem 1.5rem">
                <div style="margin: 1rem 0 2rem 0;">
                    <span class="blue-text text-accent-4">Register</span>
                    <hr>
                </div>
                <div class="input-field">
                    <input id="Username" type="text" class="validate" name="username" style="padding-left: 15px">
                    <label for="Username">Username</label>
                    <s:fielderror fieldName="username"/>
                </div>
                <p class="right-align red-text text-accent-3" style="margin-top: -60px;margin-bottom: 30px;line-height: 45px;padding-right: 15px"><span>&nbsp</span></p>
                <div class="input-field">
                    <input id="Email" type="text" class="validate" name="email" style="padding-left: 15px">
                    <label for="Email">E-mail</label>
                    <s:fielderror fieldName="email"/>
                </div>
                <p class="right-align red-text text-accent-3" style="margin-top: -60px;margin-bottom: 30px;line-height: 45px;padding-right: 15px" >&nbsp</p>
                <div class="input-field">
                    <input id="Password" type="password" class="validate" name="password" style="padding-left: 15px">
                    <label for="Password">Password</label>
                    <s:fielderror fieldName="password"/>
                </div>
                <p class="right-align red-text text-accent-3" style="margin-top: -60px;margin-bottom: 30px;line-height: 45px;padding-right: 15px">&nbsp</p>
                <button class="btn waves-effect" type="submit" name="action" style="margin:1.5rem 0.75rem;">Submit
                    <i class="mdi-content-send right"></i>
                </button>
                <a style="line-height: 36px;" id="signup" href="login.jsp" style="margin:1.5rem 0.75rem;">Go Back</a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
</body>
</html>
