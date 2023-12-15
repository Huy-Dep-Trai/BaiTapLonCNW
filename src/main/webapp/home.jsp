<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BEAN.Group" %>
<%@ page import="Model.BEAN.User" %><%--
  Created by IntelliJ IDEA.
  User: Huy Vo
  Date: 12/5/2023
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Group Management</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
</head>
<body>
<!-- ***** Preloader Start ***** -->
<div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- ***** Preloader End ***** -->

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
                        <li><a href="index.jsp" class="active">Trang chủ</a></li>
                        <li><a href="ListUser">Users</a></li>
                        <%
                            User usertmp = (User) request.getSession().getAttribute("User");
                            if (request.getSession() != null && usertmp != null) {
                        %>
                        <li>
                            <a href="GroupController?username=<%= usertmp.getUsername() %>">Groups</a>
                        </li>
                        <%
                        }
                        else {
                        %>
                        <li><a href="GroupController">Groups</a></li>
                        <%
                            }
                        %>
                        <li><a href="#">Tạo Groups</a></li>
                        <%
                            if(session != null && session.getAttribute("Authenticated") != null && (boolean)session.getAttribute("Authenticated")){
                        %>
<%--                        Đăng nhập rồi--%>
                            <li><a href="UserManagement">Profile <img src="assets/images/profile-header.jpg" alt=""></a></li>
                        <%
                            }
                            else{
                        %>
<%--                        Chưa đăng nhập--%>
                            <li><a href="Login">Đăng nhập <img src="assets/images/profile-header.jpg" alt=""></a></li>
                        <%
                            }
                        %>>
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
                <div class="main-banner">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text">

                                    <%
                                        if(request.getSession() != null && request.getSession().getAttribute("User") != null){
                                            User user = (User)request.getSession().getAttribute("User");
                                    %>
                                        <h6>Chào mừng <em><%=user.getName()%></em> !</h6>
                                    <%
                                        }
                                    %>

                                <h4>Trang Web Quản Lí <em>Group</em></h4>
                                <div class="main-button">
                                    <a href="browse.html">Khám Phá Ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->

                <!-- ***** Most Popular Start ***** -->
                <div class="most-popular">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="heading-section">
                                <h4>Groups <em>Nổi Bật</em></h4>
                            </div>

                            <div class="row">
                                <%
                                    ArrayList<Group> list = new ArrayList<>();

                                    HttpSession ses = request.getSession();
                                    if(ses != null && ses.getAttribute("popular_groups") != null) {
                                        list = (ArrayList<Group>) ses.getAttribute("popular_groups");
                                        for(Group group : list){
                                %>
                                    <div class="col-lg-3 col-sm-6">
                                        <div class="item">
                                            <img src="assets/images/popular-01.jpg" alt="">
                                            <h4><%=group.getName_group()%><br><span><%=group.getPrivacy() == 1 ? "Nhóm riêng tư" : "Nhóm công khai"%></span></h4>
                                            <ul>
                                                <li><i class="fa fa-star"></i> 4.8</li>
                                                <li><i class="fa fa-user"></i> <%=group.getCurrent_member_amount()%></li>
                                            </ul>
                                        </div>
                                    </div>
                                <%

                                        }
                                    }
                                %>

<%--                                <div class="col-lg-3 col-sm-6">--%>
<%--                                    <div class="item">--%>
<%--                                        <img src="assets/images/popular-02.jpg" alt="">--%>
<%--                                        <h4>PubG<br><span>Battle S</span></h4>--%>
<%--                                        <ul>--%>
<%--                                            <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                            <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-sm-6">--%>
<%--                                    <div class="item">--%>
<%--                                        <img src="assets/images/popular-03.jpg" alt="">--%>
<%--                                        <h4>Dota2<br><span>Steam-X</span></h4>--%>
<%--                                        <ul>--%>
<%--                                            <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                            <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-sm-6">--%>
<%--                                    <div class="item">--%>
<%--                                        <img src="assets/images/popular-04.jpg" alt="">--%>
<%--                                        <h4>CS-GO<br><span>Legendary</span></h4>--%>
<%--                                        <ul>--%>
<%--                                            <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                            <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-6">--%>
<%--                                    <div class="item">--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-lg-6 col-sm-6">--%>
<%--                                                <div class="item inner-item">--%>
<%--                                                    <img src="assets/images/popular-05.jpg" alt="">--%>
<%--                                                    <h4>Mini Craft<br><span>Legendary</span></h4>--%>
<%--                                                    <ul>--%>
<%--                                                        <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                                        <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                                    </ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-6 col-sm-6">--%>
<%--                                                <div class="item">--%>
<%--                                                    <img src="assets/images/popular-06.jpg" alt="">--%>
<%--                                                    <h4>Eagles Fly<br><span>Matrix Games</span></h4>--%>
<%--                                                    <ul>--%>
<%--                                                        <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                                        <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                                    </ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-sm-6">--%>
<%--                                    <div class="item">--%>
<%--                                        <img src="assets/images/popular-07.jpg" alt="">--%>
<%--                                        <h4>Warface<br><span>Max 3D</span></h4>--%>
<%--                                        <ul>--%>
<%--                                            <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                            <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-sm-6">--%>
<%--                                    <div class="item">--%>
<%--                                        <img src="assets/images/popular-08.jpg" alt="">--%>
<%--                                        <h4>Warcraft<br><span>Legend</span></h4>--%>
<%--                                        <ul>--%>
<%--                                            <li><i class="fa fa-star"></i> 4.8</li>--%>
<%--                                            <li><i class="fa fa-download"></i> 2.3M</li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-12">--%>
                                    <div class="main-button">
                                        <a href="browse.html">Discover Popular</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Most Popular End ***** -->


            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Bài tập lớn <a href="#">Công Nghệ Web</a>.

                    <br>Trang Web quản lí nhóm cho người dùng</p>
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
