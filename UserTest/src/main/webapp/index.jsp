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
    <input type="text" id="inputUserName" name="userName" class="form-control" placeholder="Username" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" name="userPassword" class="form-control" placeholder="Password" required>
    <div class="checkbox">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="login()">Sign in</button>
    <a href="./assets/html/mainpage.html">Sign Up for System</a>
  </form>

</div> <!-- /container -->

<script type="text/javascript">
  $.fn.serializeObject = function(){
    var o={};
    var a = this.serializeArray();
    $.each(a,function(){
        if(o[this.name]){
            if(!o[this.name].push){
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        }else{
            o[this.name] = this.value || '';
        }
    });
    return o;

  };
    function login() {
        $.ajax({
            type: "post",
            url: "/user/login",
            contentType: "application/json;charset=utf-8",
            dataType:"json",
            data: JSON.stringify($("#form1").serializeObject()),
            success: function (data) {
                if(data.result=="success"){
                    window.location.href="./views/MainPage.jsp";
                }
                else{
                    alert("密码错误");
                }
            },
            error: function () {
                alert("网络错误");
            }
        });


    }

</script>
<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
<script  src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
