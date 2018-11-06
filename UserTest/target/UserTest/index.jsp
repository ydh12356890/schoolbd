<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
  <script  src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/css/signin.css" rel="stylesheet">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="assets/icon/bd.jpg">
  <title>User Login</title>

</head>

<body>

<div class="container">

  <form class="form-signin" action="user/login" method="post">
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
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    <a href="views/register.jsp">Sign Up for System</a>
  </form>

</div> <!-- /container -->

</body>
</html>
