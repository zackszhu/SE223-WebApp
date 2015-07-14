<%--
  Created by IntelliJ IDEA.
  User: zacks
  Date: 15-5-7
  Time: 下午10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="src/materialize/css/materialize.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Welcome to My Bookstore - Statistics </title>
</head>
<body class="blue accent-4">
<jsp:include page="sideNav.jsp"></jsp:include>
<div class="container" style="margin-left: 300px">
    <div class="row">
        <div class="col s5 z-depth-2 grey lighten-4" style="padding-right: 0">
            <form action="OrderQueryByUser" method="post">
                <input placeholder="By User" id="searchOrderByUser" type="text" name="username" class="col s9  grey lighten-4" style="margin:7.5px 0">
                <button class="waves-effect waves-teal btn-flat blue col s3 grey lighten-4" style="padding:0;margin-top:12px"><i class="mdi-action-search small"></i></button>
            </form>
        </div>
        <div class="col s5 z-depth-2 right grey lighten-4" style="padding-right: 0">
            <form action="OrderQueryByBook" method="post">
                <input placeholder="By Book" id="searchOrderByBook" type="text" name="bookName" class="col s9  grey lighten-4" style="margin:7.5px 0">
                <button class="waves-effect waves-teal btn-flat blue col s3 grey lighten-4" style="padding:0;margin-top:12px"><i class="mdi-action-search small"></i></button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col s12 z-depth-2 right grey lighten-4" style="padding-right: 0">
            <form action="OrderQueryByTime" method="post">
                <input placeholder="startTime" id="searchOrderByTime1" class="datepicker col s5 grey lighten-4" type="date" name="startTime">
                <input placeholder="endTime" id="searchOrderByTime2" class="datepicker col s5 offset-s1 grey lighten-4" type="date" name="endTime">
                <button class="waves-effect waves-teal btn-flat blue col s1 grey lighten-4" style="padding:0;margin-top:12px"><i class="mdi-action-search small"></i></button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="grey lighten-5 z-depth-2 col m12" style="padding:0">
            <p class="blue white-text" style="font-size: 2em;margin:0; padding: 10px;">Orders</p>
            <table class="centered hoverable" style="border-collapse: separate;">
                <thead>
                <tr>
                    <th data-field="username">User ID</th>
                    <th data-field="bookname">Book ID</th>
                    <th data-field="time">Order Time</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="orderEntityList">
                    <tr>
                        <td>
                            <s:property value="userId" />
                        </td>
                        <td>
                            <s:property value="bookId.name" />
                        </td>
                        <td>
                            <s:property value="createTime" />
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="src/materialize/js/materialize.min.js"></script>
<script type="text/javascript">
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15 // Creates a dropdown of 15 years to control year
    });
</script>
</body>
</html>
