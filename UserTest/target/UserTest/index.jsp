<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/css/signin.css" rel="stylesheet">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="./assets/icon/buptlogo.png">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
  <title>校园信息化</title>

</head>
<body background="assets/icon/carousel5.jpg">
<div class="mainsignindiv">
  <%--<form class="form-signin" id="form1" >
    <h2 class="form-signin-heading">Please sign in</h2>
    <label for="inputUserName" class="sr-only">Username</label>
    <input type="text" id="inputUserName" name="userName" class="form-control">
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" name="userPassword" class="form-control">
    <div class="checkbox">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>

    </div>
    <button id="loginid" class="btn btn-lg btn-primary btn-block" type="button" >Sign in</button>
    <a href="./views/register.jsp">Sign Up for System</a>
  </form>--%>

    <form class="form-signin form-horizontal">
      <div class="loginindiv">
        <div class="form-group">
          <label for="inputUserName" class="col-md-3 control-label">用户名</label>
          <div class="input-group col-md-9">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
          </span>
            <input type="text" name="userName" id="inputUserName" class="form-control" placeholder="请输入用户名...">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-md-3 control-label">密码</label>
          <div class="input-group col-md-9">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
          </span>
            <input type="password" name="userPassword" id="inputPassword" class="form-control" placeholder="请输入密码...">
            <span class="input-group-addon">
            <span class="show_pass glyphicon glyphicon-eye-close"></span>
          </span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-offset-3 col-md-9 signinbtn">
            <button id="loginid" class="btn btn-lg btn-primary btn-block" type="button">Sign in</button>
            <a href="./views/register.jsp">Sign Up for System</a>
          </div>
        </div>
      </div>
    </form>

</div> <!-- /container -->

<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
<script  src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">


   $("#loginid").click(function(){
     var username = $("#inputUserName").val();
     var password = $("#inputPassword").val();
       if(username==""){
           alert("用户名不能为空");
       }else if (password ==""){
           alert("密码不能为空");
       }else{

     $.ajax({
         url:"/user/login",
         data:{"username":username,"password":password},
         type:"post",
         dataType:"text",
         success:function (data) {

             if(data=="success") {
                 window.location.href = "./assets/html/mainpage.jsp";
             }
             else {
                 alert("用户名或密码错误！");
             }
         }
     })
 }});


</script>
<script type="text/javascript">


    $(".show_pass").click(function () {
        var pass = document.getElementById("inputPassword");

        if (pass.type === "password"){
            pass.type = "text";
            $(".show_pass").removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
        }
        else {
            pass.type = "password";
            $(".show_pass").removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
        }
    })

</script>


</body>
</html>
