<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Login - Asset Inventory Management System</title>

<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="page-wrapper">

```
<form class="form-container"
      id="loginForm"
      method="post">

    <h2 class="form-title">
        Asset Inventory Management System
    </h2>

    <h3>Login Form</h3>

    <div class="form-group">
        <label>User Name / Email</label>

        <input type="text"
               id="userName"
               name="userName"
               placeholder="User Name or Email"
               maxlength="50">

        <span class="error-msg"
              id="err-userName"></span>
    </div>

    <div class="form-group">
        <label>Password</label>

        <input type="password"
               id="password"
               name="password"
               placeholder="Password"
               maxlength="50">

        <span class="error-msg"
              id="err-password"></span>
    </div>

    <div class="form-actions">

        <button type="button"
                id="btnLogin"
                class="btn-primary">
            Login
        </button>

        <a href="Register.jsp"
           class="link-register">
            New User? Register Here
        </a>

    </div>

    <div id="loginMessage"
         class="msg-box"></div>

</form>
```

</div>

<script src="js/Login.js"></script>

</body>
</html>
