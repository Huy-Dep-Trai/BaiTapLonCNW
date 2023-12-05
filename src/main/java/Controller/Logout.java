package Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        request.getSession().setAttribute("Authenticated", false);
        request.getSession().setAttribute("User", null);
        response.sendRedirect("login.jsp");
    }
}
