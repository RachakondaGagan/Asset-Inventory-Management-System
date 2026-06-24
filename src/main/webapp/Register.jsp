<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Register - Asset Inventory Management System</title>

<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="page-wrapper">

```
<form class="form-container"
      id="registerForm">

    <h2 class="form-title">
        Asset Inventory Management System
    </h2>

    <h3>Registration Form</h3>

    <div class="form-group">
        <label>Full Name</label>
        <input type="text"
               id="fullName"
               name="fullName"
               placeholder="Full Name"
               maxlength="100">
        <span class="error-msg"
              id="err-fullName"></span>
    </div>

    <div class="form-group">
        <label>User Name</label>
        <input type="text"
               id="userName"
               name="userName"
               placeholder="User Name"
               maxlength="50">
        <span class="error-msg"
              id="err-userName"></span>
    </div>

    <div class="form-group">
        <label>Email</label>
        <input type="email"
               id="email"
               name="email"
               placeholder="Email"
               maxlength="100">
        <span class="error-msg"
              id="err-email"></span>
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

    <div class="form-group">
        <label>Confirm Password</label>
        <input type="password"
               id="confirmPassword"
               name="confirmPassword"
               placeholder="Confirm Password"
               maxlength="50">
        <span class="error-msg"
              id="err-confirmPassword"></span>
    </div>

    <div class="form-group">
        <label>Gender</label>

        <div class="radio-group">
            <label>
                <input type="radio"
                       name="gender"
                       value="Male"
                       checked>
                Male
            </label>

            <label>
                <input type="radio"
                       name="gender"
                       value="Female">
                Female
            </label>
        </div>
    </div>

    <div class="form-actions">

        <button type="button"
                id="btnRegister"
                class="btn-primary">
            Register
        </button>

        <a href="Login.jsp"
           class="link-register">
            Already Registered? Login
        </a>

    </div>

    <div id="registerMessage"
         class="msg-box"></div>

</form>
```

</div>

<script src="js/Register.js"></script>

</body>
</html>
