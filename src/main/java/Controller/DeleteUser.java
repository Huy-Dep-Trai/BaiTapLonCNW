package Controller;

import Model.BO.UserBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");

        UserBO bo = new UserBO();

        boolean deleteSuccess = bo.deleteUser(username);

        if(deleteSuccess){
            req.setAttribute("delete_success", true);
            req.getRequestDispatcher("ListUser").forward(req,res);
        }
        else{
            req.setAttribute("delete_success", false);
            req.getRequestDispatcher("ListUser").forward(req,res);
        }
    }
}
