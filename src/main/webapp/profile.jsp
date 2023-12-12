<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.BEAN.User" %>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h2>Xem hồ sơ người khác</h2>
    <form action="Profile" method="POST">
        <div>
            <label for="username">Select Username:</label>
            <input list="usernames" id="username" name="username" required>
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
            <button type="submit">View Profile</button>
        </div>
    </form>
    <p>${responseMessage}</p> <!-- controller gửi thông báo sau khi submit thành công hoặc thất bại -->
    
    <% 
    
        if (request.getAttribute("userToView") != null) { 
    %>

    <h2>User Information</h2>
    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required value="${userToView.getName()}" readonly style="background-color: #f2f2f2;">
    </div>
    <div>
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required value="${userToView.getAge()}" readonly style="background-color: #f2f2f2;">
    </div>
    <div>
        <label>Gender:</label>
        <input type="radio" id="male" name="gender" value="true" ${userToView.isGender() ? 'checked' : ''} disabled>
        <label for="male">Male</label>
        <input type="radio" id="male" name="gender" value="false" ${!userToView.isGender() ? 'checked' : ''} disabled>
        <label for="female">Female</label>
    </div>
    <div>
        <label for="university">University:</label>
        <input type="text" id="university" name="university" required value="${userToView.getUniveristy()}" readonly style="background-color: #f2f2f2;">
    </div>
    <div>
        <label for="department">Khoa:</label>
        <select id="department" name="department" disabled>
            <option value="khoacntt" ${userToView.getId_group() == "khoacntt" ? "selected" : ""}>CNTT</option>
            <option value="khoadtvt" ${userToView.getId_group() == "khoadtvt" ? "selected" : ""}>ĐTVT</option>
        </select>
    </div>

    <% } %>
</body>
</html>
