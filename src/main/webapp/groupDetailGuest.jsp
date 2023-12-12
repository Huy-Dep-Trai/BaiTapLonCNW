<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java"  import="java.util.ArrayList" %>
    <%@ page language="java"  import="Model.BEAN.User" %>
    <%@ page language="java"  import="Model.BEAN.Group_User" %>
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

.post{
    display: block;
 }

.post-editor {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 50px;
}

.user-avatar img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 10px;
}

.post-input .text {
    width: 450px;
    height: 35px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
}


.new-post{
    display: none;
    margin-bottom: 30px;
}

.new-post-editor {
    display: flex;
    align-items: center;
    padding: 15px;
    border-radius: 8px;
    justify-content: center;
}

.user-avatar img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 15px;
}

form {
    width: 450px;
    height: 100px;
}

.post-input textarea {
    width: 450px;
    height: 100px;
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    resize: none;
}

.button-post {
    margin-top: 10px;
    justify-content: center;
}

.button-post input {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 14px;
    cursor: pointer;
    font-size: 16px;
    width: 450px;

}


.post-list {
    display: flex;
    flex-direction: column;
    gap: 20px; /* Khoảng cách giữa các bài đăng */
    margin-top: 50px;
}

/* Style cho từng bài đăng */
.post-item {
    display: flex;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.user-avatar {
    width: 50px;
    height: 50px;
    overflow: hidden;
    border-radius: 50%;
}

.user-avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.post-content {
    margin-left: 10px;
}



.section-post{
    margin-top: 30px;
    margin-bottom: 30px;
}

.section-post .inner-user{
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.inner-avatar img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 15px;
}

.section-post .inner-post{
    background-color: #F2F2FE;
    border-radius: 10px;
    padding: 20px;
}
</style>
</head>
<body>
 
 	
 	<div class="container">
 	<h2>Thành viên của nhóm</h2>
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
 	
 	 </div>
 	 </div>
 	 
    
  
	<div class="container">
    <h2>Group User Posts</h2>
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <% ArrayList<Group_User> listPost = (ArrayList<Group_User>) request.getAttribute("listPost");
            for (int i = 0; i < listPost.size(); i++) {
                Group_User post = listPost.get(i);
                
                
                if (post.getPost() != null && !post.getPost().isEmpty()) {
            %>
                <div class="section-post">
                    <div class="inner-user">
                        <div class="inner-avatar">
                            <img src="<%= request.getContextPath() %>/image/avatar.jpg" alt="">
                        </div>
                        <div class="inner-name">
                            <%= post.getUsername() %>
                        </div>
                    </div>
                    <div class="inner-post">
                        <%= post.getPost() %>
                    </div>
                </div>
            <% }  %>
            <% } %>
        </div>
    </div>
</div>
	
    
 	
 	<script type="text/javascript">
 		const post = document.querySelector(".post");  
    	const input = post.querySelector(".post-input input"); 
    	const newPost = document.querySelector(".new-post"); 

    	input.addEventListener("focus", () => {
        	post.style.display = "none"; 
        	newPost.style.display = "block";
    });
 	</script>
 	
 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>