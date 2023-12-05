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

@WebServlet("/Login")
public class Login extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AuthenBO bo = new AuthenBO();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean loginStatus = false;
        loginStatus = bo.verifyLogin(username, password);

        if(loginStatus){
            User user = new UserBO().getUserByUsername(username);
            request.getSession().setAttribute("Authenticated", true);
            request.getSession().setAttribute("User", user);

            response.sendRedirect("home.jsp");
        }
        else{
            request.getSession().setAttribute("Authenticated", false);

            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
