<%--
  Created by IntelliJ IDEA.
  User: Huy Vo
  Date: 12/5/2023
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession httpSession = request.getSession();

    if(httpSession == null || httpSession.getAttribute("Authenticated") == null || (Boolean)httpSession.getAttribute("Authenticated") == false){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<body>
<header>
    <h1>Trang Chủ</h1>
    <a href="Logout" class="logout-btn">Đăng xuất</a></header>

<nav>
    <ul>
        <li><a href="#">Trang Chủ</a></li>
        <li><a href="ListUser">Danh sách người dùng</a></li>
        <li><a href="Profile">Profile</a></li>
        <li><a href="UserManagement">Chỉnh sửa thông tin cá nhân</a></li>
        <li><a href="GroupController">Group</a></li>
    </ul>
</nav>

<section>
    <h2>Nội dung chính</h2>
    <p>Đây là nội dung chính của trang.</p>
</section>
</body>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>
    <style>
        .logout-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #0056b3;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        nav {
            background-color: #f2f2f2;
            padding: 10px;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 10px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
        }

        section {
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
</html>
