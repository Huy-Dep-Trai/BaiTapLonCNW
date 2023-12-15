<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession httpSession = request.getSession();

    if(httpSession == null || httpSession.getAttribute("Authenticated") == null || httpSession.getAttribute("User") == null || (Boolean)httpSession.getAttribute("Authenticated") == false){
        response.sendRedirect("login.jsp");
    }

%>
<html>
<head>
    <title>Quản lí tài khoản</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <style>
		  .main-button button {
			  font-size: 14px;
			  color: #e75e8d;
			  background-color: #fff;
			  padding: 12px 30px;
			  display: inline-block;
			  border-radius: 25px;
			  border: 1px solid #ec6090;
			  font-weight: 400;
			  text-transform: capitalize;
			  letter-spacing: 0.5px;
			  transition: all .3s;
			  position: relative;
			  overflow: hidden;
			  border-color: #fff;
			}
			
			.main-button button:hover {
			  border-color: #fff;
			  background-color: transparent;
			  color: #ec6090;
			}
			.input-field {
			  background-color: #27292a;
			  height: 46px;
			  border-radius: 23px;
			  border: 1px solid #ec6090;
			  color: whitesmoke;
			  font-size: 14px;
			}
			.input-field:focus {
			  background-color: #27292a;
			  height: 46px;
			  border-radius: 23px;
			  border: 1px solid #ec6090;
			  color: whitesmoke;
			  font-size: 14px;
			}
						
	  </style>
</head>


<body>
	<!-- ***** Header Area Start ***** -->
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
	                    <div class="search-input">
	                        <form id="search" action="#">
	                            <input type="text" placeholder="Search..." id='searchText' name="searchKeyword" onkeypress="handle" />
	                            <i class="fa fa-search"></i>
	                        </form>
	                    </div>
	                    <!-- ***** Search End ***** -->
	                    <!-- ***** Menu Start ***** -->
	                    <ul class="nav">
	                        <li><a href="Home" >Trang chủ</a></li>
	                        <li><a href="ListUser">Users</a></li>
	                        <li><a href="GroupController">Xem Groups</a></li>
	                        <li><a href="#">Tạo Groups</a></li>
	                        <li><a href="UserManagement" class="active">Cá nhân <img src="assets/images/profile-header.jpg" alt=""></a></li>
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

	<!-- ***** Header Area End ***** -->
	<div class="container">
	    <div class="row">
	      <div class="col-lg-12">
	        <div class="page-content">
	
	          <!-- ***** Banner Start ***** -->
	          <div class="row">
	            <div class="col-lg-12">
	              <div class="main-profile ">
	                <div class="row">
	                  <div class="col-lg-3">
	                    <img src="assets/images/profile.jpg" alt="" style="border-radius: 23px;">
	                  </div>
	                  <div style="padding-left: 50px;" class="col-lg-4 align-self-top">
	                    <div class="main-info header-text">
	                      <span>Tài Khoản Cá Nhân</span>
	                      <h4>Tên: ${User.name}</h4>
	                      <p>Trang chỉnh sửa thông tin cá nhân.</p>
	                    </div>
						  <br>
						  <div class="main-border-button"  >
							  <a href="Logout">Đăng xuất</a>
						  </div>
	                  </div>
	                </div>
	                <div class="row">
		                  <div class="col-lg-12">
		                    <div class="clips">
		                      <div class="row">
		                        <div class="col-lg-12">
		                          <div class="heading-section">
		                            <h4><em>Sửa thông tin</em> cá nhân</h4>
		                          </div>
		                        </div>
		                        <div class="col-lg-5 align-self-center">
				                    <ul>
				                    	<p style="color: orange;">${responseMessage}</p>
				                    	<form action="UserManagement" method="POST" >
							                <div class="form-group">
							                    <p><label for="name">Họ tên:</label></p>
							                    <input type="text" class="form-control input-field" id="name" name="name" required value="${name}">
							                </div>
							                <div class="form-group">
							                    <p><label for="age">Tuổi:</label></p>
							                    <input type="number" class="form-control input-field" id="age" name="age" required value="${age}">
							                </div>
							                <div class="form-group">
							                    <p><label>Giới tính:</label></p>
							                    <span class="input-field">
							                        <input type="radio" id="male" name="gender" value="true" ${gender == 'true' ? 'checked' : ''}>
							                        <label style="color: whitesmoke;" for="male"><p>Đực&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></label>
							                        <input type="radio" id="female" name="gender" value="false" ${gender == 'false' ? 'checked' : ''}>
							                        <label style="color: whitesmoke;" for="female"><p>Cái&nbsp;&nbsp;&nbsp;</p></label>
							                    </span>
							                </div>
							                <div class="form-group">
							                    <p><label for="university">University:</label></p>
							                    <input type="text" class="form-control input-field" id="university" name="university" required value="${university}">
							                </div>
							                <div class="form-groua">
							                    <p><label for="department">Khoa:</label></p>
							                    <select class="form-control input-field" id="department" name="department">
							                        <option value="khoacntt" ${department == 'khoacntt' ? 'selected' : ''}>CNTT</option>
							                        <option value="khoadtvt" ${department == 'khoadtvt' ? 'selected' : ''}>ĐTVT</option>
							                    </select>
							                </div>
							                <div class="main-button">
							                	<button type="submit">Xác nhận</button>
							                </div>
						            	</form>
				                    </ul>
			                 	 </div>
		                      </div>
		                    </div>
		                  </div>
		                </div>
		              </div>
	              </div>
	            </div>
	          </div>      
	        </div>
	      </div>
	    </div>
  
	  <footer>
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12">
	          <p>Bài tập lớn <a href="#">Công Nghệ Web</a>. 
	          
	          <br>Trang thông tin cá nhân</p>
	        </div>
	      </div>
	    </div>
	  </footer>


	  <!-- Scripts -->
	  <!-- Bootstrap core JavaScript -->
	  <script src="vendor/jquery/jquery.min.js"></script>
	  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	
	  <script src="assets/js/isotope.min.js"></script>
	  <script src="assets/js/owl-carousel.js"></script>
	  <script src="assets/js/tabs.js"></script>
	  <script src="assets/js/popup.js"></script>
	  <script src="assets/js/custom.js"></script>
	  
</body>
</html>
