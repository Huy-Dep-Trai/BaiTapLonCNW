<%--
  Created by IntelliJ IDEA.
  User: Huy Vo
  Date: 12/8/2023
  Time: 2:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng ký tài khoản</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .container {
      width: 300px;
      margin: 0 auto;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      display: block;
      font-weight: bold;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    input[type="submit"] {
      background-color: #007BFF;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>
  <body>
  <div class="container">
    <h2>Đăng ký tài khoản</h2>
    <form action="Register" method="post" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <%if(request.getAttribute("register_success") != null && (boolean)request.getAttribute("register_success") == false){
      %>
      <div style="color: red">Username đã tồn tại</div>
      <%}%>
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form-group">
        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required>
      </div>
      <div class="form-group">
        <input type="submit" value="Đăng ký">
      </div>
    </form>
    <div id="error_message" style="color: red;"></div>

  </div>
  </body>
  </html>

<script>
  function validateForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm_password").value;

    if (password !== confirmPassword) {
      document.getElementById("error_message").innerHTML = "Password và Confirm Password không trùng khớp.";
      return false; // Ngăn form submit nếu không trùng khớp
    } else {
      document.getElementById("error_message").innerHTML = "";
      return true; // Cho phép form submit nếu trùng khớp
    }
  }
</script>

