package Controller;

import Model.BEAN.User;
import Model.BO.AuthenBO;
import Model.BO.UserBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UserManagement")
public class UserManagement extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("User");
	    if(user == null) {
	    	request.getRequestDispatcher("login.jsp").forward(request, response);
	    	return;
	    }

        request.setAttribute("name", user.getName());
        request.setAttribute("age", user.getAge());
        request.setAttribute("gender", user.isGender());
        request.setAttribute("university", user.getUniveristy());
        request.setAttribute("department", user.getId_group());

        request.getRequestDispatcher("usermanagement.jsp").forward(request, response);
    }
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("User");
	    if(user == null) {
	    	request.getRequestDispatcher("login.jsp").forward(request, response);
	    	return;
	    }
	    
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String university = request.getParameter("university");
        String department = request.getParameter("department");


        User updatedUser = new User();
        updatedUser.setUsername(user.getUsername());
        updatedUser.setName(name);
        updatedUser.setAge(age);
        updatedUser.setGender(Boolean.parseBoolean(gender));
        updatedUser.setUniveristy(university);
        updatedUser.setId_group(department);

        try {
            UserBO userBO = new UserBO();
            if(userBO.updateUserInfo(updatedUser)) {
            	//cap nhat lai bien user mới sau khi đã update data
            	user = new UserBO().getUserByUsername(user.getUsername());
            	request.getSession().setAttribute("User", user);
            	request.setAttribute("responseMessage", "Update thanh cong.");
            	this.doGet(request, response);
            }else {
            	request.setAttribute("responseMessage", "Lỗi database, update thất bại.");
            	this.doGet(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("responseMessage", "Có lỗi code backend.");
            this.doGet(request, response);
        }
    }
}
