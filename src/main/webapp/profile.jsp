<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.BEAN.User" %>
<html>
<head>
    <title>Hồ sơ tài khoản</title>
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
			  padding: 6px 15px;
			  display: inline-block;
			  border-radius: 17px;
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
                        <li><a href="#" >Trang chủ</a></li>
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
        <div class="page-content">
          <div class="start-stream">
            <div style="margin-top: -60px;" class="col-lg-12">
              <div class="heading-section">
                <h4><em>Cách xem hồ sơ</em> người khác</h4>
              </div>
              <div class="row">
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="assets/images/service-01.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>Chọn từ thanh dropbox</h4>
                    <p>Tìm người cần xem trong danh sách có sẵn.</p>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="assets/images/service-02.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>Nhập username</h4>
                    <p>Điền đầy đủ tên hồ sơ cần xem để hiển thị thông tin.</p>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="assets/images/service-03.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>Xem thông tin</h4>
                    <p>Hồ sơ cá nhân của người đó sẽ được hiển thị đầy đủ.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <br><br>

          <div class="row">
          <div class="col-lg-4">
              <div class="top-streamers">
                <div class="heading-section">
                  <h4><em>Thanh tìm kiếm</em></h4>
                </div>
                
               <p style="color: orange;">${responseMessage}</p>
                <ul>
                	<li>
                    <span>
	                    <form action="Profile" method="POST">
	                    <label style="padding-bottom: 10px" for="username" style="flex: 1;">Nhập/Chọn Tên Tài Khoản:</label>
					    <div class="form-group" style="display: flex; align-items: center;">
						    <input class="input-field" list="usernames" id="username" name="username" required style="flex: 2;">
						    <div class="main-button">
					        	<button type="submit" style="flex: 1; margin-left: 20px;">Xem</button>
					        </div>

					        <datalist id="usernames">
							    <% 
					                ArrayList<String> usernames = (ArrayList<String>) request.getAttribute("usernames");
					                if (usernames != null) {
					                    for (String username : usernames) {
					            %>
					            <option value="<%= username %>">
					            <% 
					                    }
					                }
					            %>
							</datalist>
					    </div>
						</form>
                    </span>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-lg-8">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4>Kết quả</h4>
                  <% 
	
    	if (request.getAttribute("userToView") != null) { 
    %>
    <div class="form-group">
		    <p><label for="name">Họ tên:</label></p>
		    <input type="text" class="form-control input-field" id="name" name="name" required value="${userToView.getName()}" readonly style="color: gray;">
		</div>
		<div class="form-group">
		    <p><label for="age">Tuổi:</label></p>
		    <input type="number" class="form-control input-field" id="age" name="age" required value="${userToView.getAge()}" readonly style="color: gray;">
		</div>
		<div class="form-group">
		    <p><label>Giới tính:</label></p>
		    <span class="input-field">
		        <input type="radio" id="male" name="gender" value="true" ${userToView.isGender() ? 'checked' : ''} >
		        <label style="color: whitesmoke;" for="male"><p>Đực&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></label>
		        <input type="radio" id="female" name="gender" value="false" ${!userToView.isGender() ? 'checked' : ''} >
		        <label style="color: whitesmoke;" for="female"><p>Cái&nbsp;&nbsp;&nbsp;</p></label>
		    </span>
		</div>
		<div class="form-group">
		    <p><label for="university">University:</label></p>
		    <input type="text" class="form-control input-field" id="university" name="university" required value="${userToView.getUniveristy()}" readonly style="color: gray;">
		</div>
		<div class="form-groua">
		    <p><label for="department">Khoa:</label></p>
		    <select style="color: gray;" class="form-control input-field" id="department" name="department" >
		        <option value="khoacntt" ${userToView.getId_group() == "khoacntt" ? "selected" : ""}>CNTT</option>
		        <option value="khoadtvt" ${userToView.getId_group() == "khoadtvt" ? "selected" : ""}>ĐTVT</option>
		    </select>
	</div>


    <% } %>
                </div>
                
              </div>
            </div>
          </div>
        </div>
       </div>
          <!-- ***** Featured Games End ***** -->
  
 <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Bài tập lớn <a href="#">Công Nghệ Web</a>. 
          
          <br>Trang xem hồ sơ người khác</p>
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
