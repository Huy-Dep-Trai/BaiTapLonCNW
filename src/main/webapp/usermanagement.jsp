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
</head>
<body>
    <h2>Thông tin</h2>
    <h2>Xin chào: ${User.name}</h2>
    <p>${responseMessage}</p> <!-- controller gửi thông báo sau khi submit thành công hoặc thất bại -->
    <form action="UserManagement" method="POST">
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required value="${name}">
        </div>
        <div>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required value="${age}">
        </div>
        <div>
            <label>Gender:</label>
            <input type="radio" id="male" name="gender" value="true" ${gender == 'true' ? 'checked' : ''}>
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="false" ${gender == 'false' ? 'checked' : ''}>
            <label for="female">Female</label>
        </div>
        <div>
            <label for="university">University:</label>
            <input type="text" id="university" name="university" required value="${university}">
        </div>
        <div>
            <label for="department">Khoa:</label>
            <select id="department" name="department">
                <option value="khoacntt" ${department == 'khoacntt' ? 'selected' : ''}>CNTT</option>
                <option value="khoadtvt" ${department == 'khoadtvt' ? 'selected' : ''}>ĐTVT</option>
            </select>
        </div>
        <div>
            <button type="submit">Submit</button>
        </div>
    </form>
</body>
</html>
