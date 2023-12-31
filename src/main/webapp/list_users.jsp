
<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: Huy Vo
  Date: 12/7/2023
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession ses = request.getSession();

    boolean isAdmin = false;
    if(ses != null && ses.getAttribute("User") != null){
        User u = (User)ses.getAttribute("User");
        if (u.getRole() == 1){
            isAdmin = true;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>


    <link rel="stylesheet" href="path_to/sweetalert2.min.css">
    <script src="path_to/sweetalert2.all.min.js"></script>
    <!--


    TemplateMo 579 Cyborg Gaming

    https://templatemo.com/tm-579-cyborg-gaming

    -->
</head>
<body>
        <h1><span class="blue">Danh sách </span> <span class="yellow">Users</span>
        </h1>
        <br>
        <br>
        <div class="main-border-button" style="text-align: center" >
            <a href="Home">Về trang chủ</a>
        </div>
        <div class="main-button" style="text-align: left; margin-left: 10%" >
            <a href="Profile">Tìm kiếm user</a>
        </div>
        <h2>${delete_success == true ? "Xoa thanh cong" : ""}</h2>
                <%
                    if(request.getAttribute("list") != null) {
                        ArrayList<User> list = (ArrayList<User>) request.getAttribute("list");

                %>

                <table class="container">
                    <thead>
                    <tr>
                        <th>
                            <h1>#</h1>
                        </th>
                        <th>
                            <h1>Username</h1>
                        </th>
                        <th>
                            <h1>Tên</h1>
                        </th>
                        <th>
                            <h1>Tuổi</h1>
                        </th>
                        <th>
                            <h1>Giới tính</h1>
                        </th>
                        <th>
                            <h1>Đại học</h1>
                        </th>
                        <th>
                            <h1>Chức vụ</h1>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 1;
                        for(User user : list){
                    %>
                    <tr>
                        <td><%=i++%></td>
                        <td>
                            <a href="#"><%=user.getUsername()%></a>

                        </td>
                        <td><%=user.getName()%></td>
                        <td><%=user.getAge()%></td>
                        <td><%=user.isGender() ? "Nam" : "Nữ"%></td>
                        <td><%=user.getUniveristy()%></td>
                        <td><%=user.getRole() == 1 ? "Admin" : "User"%></td>
                        <td><a href="#" class="more">Details</a></td>
                        <%
                            if(isAdmin){
                        %>
                        <td><a href="#" onclick="confirmDelete('<%=user.getUsername()%>')">Delete</a></td>

                        <%
                            }
                        %>
                        <div id="confirmation-modal" class="modal">
                            <div class="modal-content">
                                <p>Chắc chắn xóa người dùng <%=user.getUsername()%>?</p>
                                <button onclick="deleteUser('<%=user.getUsername()%>')">Delete</button>
                                <button onclick="closeModal()">Cancel</button>
                            </div>
                        </div>
                        <style>
                            .modal {
                                display: none;
                                position: fixed;
                                top: 0;
                                left: 0;
                                width: 100%;
                                height: 100%;
                                background-color: rgba(0, 0, 0, 0.5);
                                justify-content: center;
                                align-items: center;
                            }

                            .modal-content {
                                background-color: white;
                                padding: 20px;
                                border-radius: 5px;
                                text-align: center;
                            }

                            button {
                                margin: 5px;
                            }

                            button:hover {
                                cursor: pointer;
                            }
                        </style>
                        <script>
                            function confirmDelete(username) {
                                var modal = document.getElementById("confirmation-modal");
                                modal.style.display = "block";
                            }

                            function deleteUser(username) {
                                // Đặt logic xóa người dùng ở đây nếu cần
                                window.location.href = "DeleteUser?username=" + username;
                            }

                            function closeModal() {
                                var modal = document.getElementById("confirmation-modal");
                                modal.style.display = "none";
                            }
                        </script>
                    </tr>
                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>

            <br>




<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>




    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>




</body>
</html>

<style>
    /*
	Table Responsive
	===================
	Author: https://github.com/pablorgarcia
 */

    @charset "UTF-8";
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

    body {
        font-family: 'Open Sans', sans-serif;
        font-weight: 300;
        line-height: 1.42em;
        color:#A7A1AE;
        background-color:#1F2739;
    }

    h1 {
        font-size:3em;
        font-weight: 300;
        line-height:1em;
        text-align: center;
        color: #4DC3FA;
    }

    h2 {
        font-size:1em;
        font-weight: 300;
        text-align: center;
        display: block;
        line-height:1em;
        padding-bottom: 2em;
        color: #FB667A;
    }

    h2 a {
        font-weight: 700;
        text-transform: uppercase;
        color: #FB667A;
        text-decoration: none;
    }

    .blue { color: #185875; }
    .yellow { color: #FFF842; }

    .container th h1 {
        font-weight: bold;
        font-size: 1em;
        text-align: left;
        color: #185875;
    }

    .container td {
        font-weight: normal;
        font-size: 1em;
        -webkit-box-shadow: 0 2px 2px -2px #0E1119;
        -moz-box-shadow: 0 2px 2px -2px #0E1119;
        box-shadow: 0 2px 2px -2px #0E1119;
    }

    .container {
        text-align: left;
        overflow: hidden;
        width: 80%;
        margin: 0 auto;
        display: table;
        padding: 0 0 8em 0;
    }

    .container td, .container th {
        padding-bottom: 2%;
        padding-top: 2%;
        padding-left:2%;
    }

    /* Background-color of the odd rows */
    .container tr:nth-child(odd) {
        background-color: #323C50;
    }

    /* Background-color of the even rows */
    .container tr:nth-child(even) {
        background-color: #2C3446;
    }

    .container th {
        background-color: #1F2739;
    }

    .container td:first-child { color: #FB667A; }

    .container tr:hover {
        background-color: #464A52;
        -webkit-box-shadow: 0 6px 6px -6px #0E1119;
        -moz-box-shadow: 0 6px 6px -6px #0E1119;
        box-shadow: 0 6px 6px -6px #0E1119;
    }

    .container td:hover {
        background-color: #FFF842;
        color: #403E10;
        font-weight: bold;

        box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
        transform: translate3d(6px, -6px, 0);

        transition-delay: 0s;
        transition-duration: 0.4s;
        transition-property: all;
        transition-timing-function: line;
    }

    @media (max-width: 800px) {
        .container td:nth-child(4),
        .container th:nth-child(4) { display: none; }
    }
</style>


