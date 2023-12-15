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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        if(session != null && session.getAttribute("Authenticated") != null && (boolean)session.getAttribute("Authenticated")){
            response.sendRedirect("Home");
        }
        else{
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

    }
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

            response.sendRedirect("Home");
        }
        else{
            request.getSession().setAttribute("Authenticated", false);
            request.getSession().setAttribute("User", null);

            response.sendRedirect("Login");
        }
    }
}
