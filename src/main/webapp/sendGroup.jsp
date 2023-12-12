<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java"  import="Model.BEAN.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goi yeu cau den trang nhom</title>
	<style type="text/css">
		.req-button {
			background: #26AFF0;
			color: white;
			padding: 15px;
			border-radius: 20px;
		}
		
		.req-button:hover {
			background: pink;
			color: #26AFF0;
		}
	</style>
</head>
<body>
	<h2>Gởi yêu cầu đến trang danh sách nhóm</h2>
	<form action="GroupController" method="GET">
		<button class="req-button">Danh sách nhóm</button>
	</form>
	
	<!-- Goi yeu cau xem danh sach nhom cua User hien tai -->
	<% User user = (User)request.getSession().getAttribute("User"); %>
<%
    if (user != null) {
%>
        <form action="GroupController?username=<%= user.getUsername() %>" method="POST">
            <button class="req-button">Danh sách nhóm cua user</button>
        </form>
<%
    } else {
%>
        <p>User không tồn tại.</p>
<%
    }
%>
</body>
</html>