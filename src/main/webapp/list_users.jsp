
<%@ page import="Model.BEAN.User" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: Huy Vo
  Date: 12/7/2023
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession ses = request.getSession();

    boolean isAdmin = false;
    if(ses != null && ses.getAttribute("User") != null){
        User u = (User)ses.getAttribute("User");
        if (u.getRole() == 1){
            isAdmin = true;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Sản Phẩm</title>
</head>
<body>
<h1>Danh Sách User</h1>

    <%-- Duyệt qua danh sách sản phẩm và hiển thị --%>
    <div>${delete_success == true ? "Xoa thanh cong" : ""}</div>
    <%

        if(request.getAttribute("list") != null){
            ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
    %>
        <table border="1">
            <tr>
                <th>Username</th>
                <th>Tên</th>
                <th>Tuổi</th>
                <th>Giới tính</th>
                <th>Đại học</th>
                <th>Chức vụ</th>
                <%
                    if(isAdmin){
                %>
                <th>Action</th>
                <%
                    }
                %>
            </tr>
            <%
                for(User user : list){
            %>
                    <tr>
                        <td><%=user.getUsername()%></td>
                        <td><%=user.getAge()%></td>
                        <td><%=user.isGender() == true ? "Nam" : "Nữ"%></td>
                        <td><%=user.getUniveristy()%></td>
                        <td><%=user.getRole() == 1 ? "Admin" : "User"%></td>
                        <td><%=user.getUsername()%></td>
                        <%
                            if(isAdmin){
                        %>
                        <td><a href="DeleteUser?username=<%=user.getUsername()%>">Xóa</a></td>
                        <%
                            }
                        %>
                    </tr>
            <%
                }
            %>

            <!-- Thêm các dòng khác tương tự cho các mục khác -->
        </table>
    <%}%>

</body>
</html>
