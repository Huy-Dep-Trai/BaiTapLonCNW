package Controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model.BEAN.Group;
import Model.BEAN.Group_User;
import Model.BEAN.User;
import Model.BO.GroupBO;

@WebServlet("/GroupController")
public class GroupController extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        if(request.getParameter("username") != null) {
            String username = request.getParameter("username");
            ArrayList<Group> groupListJoined = new ArrayList<>();
            GroupBO bo = new GroupBO();
            groupListJoined = bo.getGroupsJoined(username);

            request.setAttribute("groupListJoined", groupListJoined);

            ArrayList<Group> groupListNotJoin = new ArrayList<>();
            groupListNotJoin = bo.getGroupsNotJoin(username);

            request.setAttribute("groupListNotJoin", groupListNotJoin);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/groupLogged.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		 ArrayList<Group> groupList = new ArrayList<>();
//		 GroupBO bo = new GroupBO();
//		 groupList = bo.getAllGroups();
//
//
//
//		 request.setAttribute("groupList", groupList);
//
//		 RequestDispatcher dispatcher = request.getRequestDispatcher("/group.jsp");
//         dispatcher.forward(request, response);

        if(request.getParameter("idgr") != null){
            String id_group = request.getParameter("idgr");
            ArrayList<User> listUser = new ArrayList<>();
            GroupBO bo = new GroupBO();
            listUser = bo.getUserById_group(id_group);

            request.setAttribute("listUser", listUser);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/groupDetail.jsp");
            dispatcher.forward(request, response);
        }
//         else if(request.getParameter("username") != null) {
//        	 String username = request.getParameter("username");
//        	 ArrayList<Group> groupListJoined = new ArrayList<>();
//    		 GroupBO bo = new GroupBO();
//    		 groupListJoined = bo.getGroupsJoined(username);
//
//    		 request.setAttribute("groupListJoined", groupListJoined);
//
//    		 RequestDispatcher dispatcher = request.getRequestDispatcher("/group.jsp");
//             dispatcher.forward(request, response);
//         }

        else{
            ArrayList<Group> groupList = new ArrayList<>();
            GroupBO bo = new GroupBO();
            groupList = bo.getAllGroups();



            request.setAttribute("groupList", groupList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/group.jsp");
            dispatcher.forward(request, response);
        }
    }
}