<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java"  import="java.util.ArrayList" %>
    <%@ page language="java"  import="Model.BEAN.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<title>Trang chi tiet nhom</title>
<style type="text/css">
	.container{
		
	}
	
	.inner-box{
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin-bottom: 20px;
    background: #E8E8E8;
    border-radius: 15px;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 90px;
    margin-right: 90px;
 }

  .inner-head{
    display: flex;
    align-items: center;
    margin-right: 200px;
 }

  .inner-head .inner-avatar{
    margin-right: 25px;
 }

  .inner-head .inner-avatar img{
    border-radius: 50%;
    width: 75px;
    height: 75px;
    object-fit: cover;
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
</head>
<body>
 <h2>Trang chi tiet nhom</h2>
 	
 	<div class="container">
		<div class="row">
        <%
        ArrayList<User> listUser = (ArrayList<User>)request.getAttribute("listUser");
            for (int i = 0; i < listUser.size(); i++) {
        %>
        	<div class="col-xl-12">
                    <div class="inner-box">
                        <div class="inner-head">
                            <div class="inner-avatar">
                                <img src="<%= request.getContextPath() %>/image/avatar.jpg" alt="">
                            </div>
                            <p class="inner-name">
                                <%= listUser.get(i).getName() %>
                            </p>
                        </div>
                        <div class="inner-button">
                            <div><a href="#" class="button button-one">Xem Profile</a></div>
                        </div>
                    </div>
                </div>
        
        <%} %>
 	
 	
 	
 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>