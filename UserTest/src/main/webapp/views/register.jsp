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
        <label for="inputUserName1" class="sr-only">Username</label>
        <input type="text" id="inputUserName1" name="userName" class="form-control" placeholder="请输入用户名..." required autofocus>
        <label for="inputPassword1" class="sr-only">Password</label>
        <input type="password" id="inputPassword1" name="userPassword" class="form-control" placeholder="请输入密码..." required>
        <label for="inputPassword2" class="sr-only">Password2</label>
        <input type="password" id="inputPassword2" name="userpassword2" class="form-control" placeholder="确认密码..." required>
        <button class="btn btn-lg btn-primary btn-block" type="button" id="reg">Sign up</button>
    </form>
    <script type="text/javascript" src="/assets/js/jquery-3.3.1.min.js"></script>
    <script  src="/assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        $("#reg").click(function () {
            var username = $("#inputUserName1").val();
            var password = $("#inputPassword1").val();
            var password2 = $("#inputPassword2").val();
            if(password!=password2){
                alert("两次密码输入不一致")
            }
            else{

                $.ajax({
                url:"/user/register",
                type:"post",
                data:{"username":username,"password":password},
                dataType:"text",
                success:function (data) {
                    console.log(data);

                    if(data =="register successful"){
                        alert("注册成功！");
                        window.location.href = "../index.jsp";
                    }
                    else
                        alert("用户已存在");

                }


            })
            }
        });

    </script>
</div> <!-- /container -->
</body>
</html>
