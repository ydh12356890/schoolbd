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
    <link href="../assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/signin.css" rel="stylesheet">
</head>

<body>

<div class="container">
    <form class="form-signin form-horizontal">
        <div class="form-group">
            <label for="inputUserName1" class="col-md-4 control-label">用户名</label>
            <div class="col-md-8">
                <input type="text" name="userName1" id="inputUserName1" class="col-md-8 form-control" placeholder="请输入用户名...">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword1" class="col-md-4 control-label">密码</label>
            <div class="col-md-8">
                <input type="password" name="userPassword1" id="inputPassword1" class="form-control" placeholder="请输入密码...">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword2" class="col-md-4 control-label">确认密码</label>
            <div class="col-md-8">
                <input type="password" name="userPassword2" id="inputPassword2" class="form-control" placeholder="请再次输入密码...">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">
                <button class="btn btn-lg btn-primary btn-block" type="button" id="reg">Sign up</button>
            </div>
        </div>
    </form>
</div> <!-- /container -->

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script  src="../assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
</body>
</html>
