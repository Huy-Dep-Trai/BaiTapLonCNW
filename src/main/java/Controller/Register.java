package Controller;

import Model.BEAN.User;
import Model.BO.AuthenBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/Register")
public class Register extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        req.getRequestDispatcher("register.jsp").forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");

        User user = new User(username, password, name);

        AuthenBO bo = new AuthenBO();

        boolean registerStatus = bo.registerAccount(user);

        if(registerStatus){
            req.setAttribute("register_success", true);
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
        else{
            req.setAttribute("register_success", false);
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
