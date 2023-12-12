<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page language="java"  import="java.util.ArrayList" %>
     <%@ page language="java"  import="Model.BEAN.Group" %>
     <%@ page language="java"  import="Model.BEAN.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<title>Trang danh sach nhom</title>
<style type="text/css">
	.container{
		padding: 80px;
	}

    .box-head {
    margin-bottom: 40px;
 }
  .box-head .inner-title {
    font-size: 25px;
    margin-bottom: 15px;
 }

  .box-head .inner-desc {
    font-size: 15px;
 }

  .inner-box {
    margin-bottom: 30px;
 }

  .inner-image {
    width: 100%;
    aspect-ratio: 5/3;
    border-radius: 15px;
    overflow: hidden;
 }

  .inner-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
 }
 .box-head {
    text-align: center;
 }

  .inner-content {
    margin-top: 15px;
    text-align: center;
 }
	 .inner-content .inner-title {
    margin-bottom: 10px;
    font-size: 20px;
    color: black;
 }
  .inner-content .inner-title a {
    text-decoration: none;
    color: black;
 }
 
  .inner-content .inner-title a:hover {
    color: black;
 }
 
  .inner-content .inner-desc {
    font-size: 13px;
    margin-bottom: 20px;
 }

  .button {
    display: inline-block;
    padding: 8px 20px;
    background-color: white;
    border-radius: 45px;
    color: black;
    font-size: 13px;
}

.button-one {
    background-color: #8261EE;
    color: white;
}

.button-one:hover {
    background-color: #FF589E;
    color: white;
}

.button a{
	color: white;
	text-decoration: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>Nhóm của bạn</h2>
		<div class="row">
        <%
        	ArrayList<Group> groupListJoined = (ArrayList<Group>)request.getAttribute("groupListJoined");
        	if (groupListJoined != null){
            	for (int i = 0; i < groupListJoined.size(); i++) {
        %>
        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
            <div class="inner-box">
                <div class="inner-image">
                    <img src="<%= request.getContextPath() %>/image/group.jpg" alt="">
                </div>
                <div class="inner-content">
                    <div class="inner-title">
                        <a href="#">
                            <%= groupListJoined.get(i).getName_group() %>
                        </a>
                    </div>
                    <div class="inner-desc">
                        <%= groupListJoined.get(i).getDescription() %>
                    </div>
                    <div class="button button-one">
                    	<a href="<%= request.getContextPath() %>/GroupController?idgr=<%= groupListJoined.get(i).getId_group() %>">XEM NHÓM</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }}
        %>
     </div>
   </div>
   
   <div class="container">
		<h2>Nhóm chưa chưa tham gia</h2>
		<div class="row">
        <%
        	ArrayList<Group> groupListNotJoin = (ArrayList<Group>)request.getAttribute("groupListNotJoin");
        	if (groupListNotJoin != null){
            	for (int i = 0; i < groupListNotJoin.size(); i++) {
        %>
        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
            <div class="inner-box">
                <div class="inner-image">
                    <img src="<%= request.getContextPath() %>/image/group.jpg" alt="">
                </div>
                <div class="inner-content">
                    <div class="inner-title">
                        <a href="#">
                            <%= groupListNotJoin.get(i).getName_group() %>
                        </a>
                    </div>
                    <div class="inner-desc">
                        <%= groupListNotJoin.get(i).getDescription() %>
                    </div>
                    <% User user = (User)request.getSession().getAttribute("User"); %>
                    <div class="button button-one">
                    	<a href="<%= request.getContextPath() %>/GroupController?join_gr=<%= groupListNotJoin.get(i).getId_group() %>&user_join=<%= user.getUsername() %>">THAM GIA</a>
                    	<!--  <form action="<%= request.getContextPath() %>/GroupController" method="POST">
                    		<input type="hidden" name="user_join" value="<%= user.getUsername() %>">
    						<input type="hidden" name="join_gr" value="<%= groupListNotJoin.get(i).getId_group() %>">
    						<button type="submit">THAM GIA</button>
						</form>-->
                    	
                    </div>
                </div>
            </div>
        </div>
        <%
            }}
        %>
     </div>
   </div>
   
   <script type="text/javascript">
   		<% Boolean join = (Boolean)request.getAttribute("join"); %>
   		if(<%= join %>){
   			setTimeout(() => {
   				alert("Bạn đã tham gia nhóm thành công");
   			}, 3000);
   		}
   </script>
   
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>