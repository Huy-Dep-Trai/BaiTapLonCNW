package Controller;

import Model.BEAN.User;
import Model.BO.UserBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ListUser")
public class ListUser extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        UserBO bo = new UserBO();
        ArrayList<User> list_users = bo.getAllUsers();

        req.setAttribute("list", list_users);

        req.getRequestDispatcher("list_users.jsp").forward(req,res);
    }
}
