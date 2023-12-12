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
import java.util.ArrayList;

@WebServlet("/Profile")
public class Profile extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        if (username != null && !username.isEmpty()) {
            User user = new UserBO().getUserByUsername(username);
            if(user.getName() != null) {
                request.setAttribute("userToView", user);
            }else {
                request.setAttribute("responseMessage","Không tìm thấy người này");
            }
        }
        ArrayList<User> userList = new UserBO().getAllUsers();
        ArrayList<String> usernames = new ArrayList<>();
        for (User user : userList) {
            usernames.add(user.getUsername());
            System.out.print(user.getUsername());
        }
        request.setAttribute("usernames", usernames);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        response.sendRedirect("Profile?username=" + username);
    }
}
