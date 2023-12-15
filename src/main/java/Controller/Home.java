package Controller;

import Model.BEAN.Group;
import Model.BO.GroupBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/Home")
public class Home extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GroupBO bo = new GroupBO();

        ArrayList<Group> popular_groups = new ArrayList<>();
        popular_groups = bo.getPopularGroups();

        request.getSession().setAttribute("popular_groups", popular_groups);

        request.getRequestDispatcher("/home.jsp").forward(request,response);

    }
}
