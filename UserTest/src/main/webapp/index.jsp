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
  <link rel="icon" href="./assets/icon/bd.jpg">
  <title>User Login</title>

</head>
<body>

<div class="container">
  <form class="form-signin" id="form1" >
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
    <a href="#">Sign Up for System</a>
  </form>

</div> <!-- /container -->

<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
<script  src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">


   $("#loginid").click(function(){
     var username = $("#inputUserName").val();
     var password = $("#inputPassword").val();
     $.ajax({
         url:"/user/login",
         data:{"username":username,"password":password},
         type:"post",
         dataType:"text",
         success:function (data) {
             if(data=="success") {
                 window.location.href = "./assets/html/mainpage.html";
             }
             else {
                 alert("error");
             }
         }
     })
 });

</script>


</body>
</html>
