<%--
  Created by IntelliJ IDEA.
  User: Huy Vo
  Date: 12/5/2023
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<body>
<div class="login-container">
    <form class="login-form" method="post" action="Login">
        <h2 style="color: #ff6b6b;">Login</h2>
        <div class="input-group">
            <label for="username" style="color: #ff6b6b;">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="password" style="color: #ff6b6b;">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Login</button>
    </form>
</div>
</body>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f8f8;
        }

        .login-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 320px;
            max-width: 90%;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            width: 100%;
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .input-group input {
            width: calc(100% - 20px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            color: #333;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #ff6b6b;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }

        button:hover {
            background-color: #ff5252;
        }
    </style>
</head>
</html>

