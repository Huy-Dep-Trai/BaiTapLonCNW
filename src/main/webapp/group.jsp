<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java"  import="java.util.ArrayList" %>
    <%@ page language="java"  import="Model.BEAN.Group" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<title>Trang danh sach nhom</title>
<style type="text/css">
	.section-group h2{
		margin-bottom: 25px;
	}

	.container{
		padding: 60px;
		background: #27292A;
		border-radius: 15px;
	}
	
	.section-group{
		margin-top: 175px;
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
    color: white;
 }
  .inner-content .inner-title a {
    text-decoration: none;
    color: white;
    font-weight: 600;
 }
 
  .inner-content .inner-title a:hover {
    color: black;
 }
 
  .inner-content .inner-desc {
    font-size: 13px;
    margin-bottom: 20px;
 }
 
 .inner-content .inner-desc p {
 	color: white;
 	font-size: 13px;
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
    background-color: #EC6090;
    color: white;
}

.button-one:hover {
    background-color: white;
    color: #EC6090;
}

.button a{
	color: white;
	text-decoration: none;
}

.button:hover a {
    color: #EC6090;
}

.header-area .container{
	background: #1F2122;
	padding: 10px;
}

</style>
</head>
<body>
	
	<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        
                        <li><a href="UserManagement">Profile <img src="assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  
  	<div class="section-group">
	

	
	<div class="container">
        <div class="main-border-button" style="text-align: center" >
            <a href="Home">Về trang chủ</a>
        </div>
		<h2>Groups</h2>
		<div class="row">
        <%
        	ArrayList<Group> groupList = (ArrayList<Group>)request.getAttribute("groupList");
            for (int i = 0; i < groupList.size(); i++) {
        %>
        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
            <div class="inner-box">
                <div class="inner-image">
                    <img src="<%= request.getContextPath() %>/image/group.jpg" alt="">
                </div>
                <div class="inner-content">
                    <div class="inner-title">
                        <a href="#">
                            <%= groupList.get(i).getName_group() %>
                        </a>
                    </div>
                    <div class="inner-desc">
                        <p>
                        	<%= groupList.get(i).getDescription() %>
                        </p>
                    </div>
                    <div class="button button-one">
                    	<a href="<%= request.getContextPath() %>/GroupController?idgr_guest=<%= groupList.get(i).getId_group() %>">TRUY CẬP</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
     </div>
   </div>
   </div>
   
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>