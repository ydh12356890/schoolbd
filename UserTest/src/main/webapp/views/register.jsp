<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../assets/icon/bd.jpg">
    <title>User Register</title>
    <script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
    <script  src="../assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="../assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/signin.css" rel="stylesheet">
</head>

<body>

<div class="container">

    <form class="form-signin" action="user/register" method="post">
        <h2 class="form-signin-heading">Please sign up</h2>
        <label for="inputUserName" class="sr-only">Username</label>
        <input type="text" id="inputUserName" name="userName" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="userPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
    </form>

</div> <!-- /container -->
</body>
</html>
