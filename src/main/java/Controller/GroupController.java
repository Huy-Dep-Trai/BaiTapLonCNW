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


		if(request.getParameter("post") != null) {
			String post = request.getParameter("post");
			String id_group = request.getParameter("idgr");
			User user = (User)request.getSession().getAttribute("User");
			String username = user.getUsername();
			System.out.println("Post: " + post + username + id_group);

			Group_User group_user = new Group_User(username, id_group, post);
			GroupBO bo = new GroupBO();
			bo.userPost(group_user);


			detailGroup(id_group, request, response);
		}
//		 else if(request.getParameter("join_gr") != null && request.getParameter("user_join") != null) {
//        	 String id_group = request.getParameter("join_gr");
//        	 String username = request.getParameter("user_join");
//        	 System.out.println("Username: " + username + ", Id_group: " + id_group);
//
//        	 GroupBO bo = new GroupBO();
//        	 bo.userJoinGroup(username, id_group);
//
//        	 joinGroup(username, request, response);
//         }
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

			ArrayList<Group_User> listPost = new ArrayList<>();
			listPost = bo.getAllPosts(id_group);

			request.setAttribute("listUser", listUser);
			request.setAttribute("listPost", listPost);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/groupDetail.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter("username") != null) {
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

		else if(request.getParameter("idgr_guest") != null) {
			String id_group = request.getParameter("idgr_guest");
			ArrayList<User> listUser = new ArrayList<>();
			GroupBO bo = new GroupBO();
			listUser = bo.getUserById_group(id_group);

			ArrayList<Group_User> listPost = new ArrayList<>();
			listPost = bo.getAllPosts(id_group);

			request.setAttribute("listUser", listUser);
			request.setAttribute("listPost", listPost);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/groupDetailGuest.jsp");
			dispatcher.forward(request, response);
		}
//         	else if(request.getParameter("username") != null) {
//         		String username = request.getParameter("username");
//         		ArrayList<Group> groupListJoined = new ArrayList<>();
//         		GroupBO bo = new GroupBO();
//         		groupListJoined = bo.getGroupsJoined(username);
//    		 
//         		request.setAttribute("groupListJoined", groupListJoined);
//    		 
//         		RequestDispatcher dispatcher = request.getRequestDispatcher("/group.jsp");
//         		dispatcher.forward(request, response);
//         }	
		else if(request.getParameter("join_gr") != null && request.getParameter("user_join") != null) {
			String id_group = request.getParameter("join_gr");
			String username = request.getParameter("user_join");
			System.out.println("Username: " + username + ", Id_group: " + id_group);

			GroupBO bo = new GroupBO();
			bo.userJoinGroup(username, id_group);

			joinGroup(username, request, response);
		}

		else{
			ArrayList<Group> groupList = new ArrayList<>();
			GroupBO bo = new GroupBO();
			groupList = bo.getAllGroups();



			request.setAttribute("groupList", groupList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/group.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void joinGroup(String username, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Group> groupListJoined = new ArrayList<>();
		GroupBO bo = new GroupBO();
		groupListJoined = bo.getGroupsJoined(username);

		request.setAttribute("groupListJoined", groupListJoined);

		ArrayList<Group> groupListNotJoin = new ArrayList<>();
		groupListNotJoin = bo.getGroupsNotJoin(username);

		request.setAttribute("groupListNotJoin", groupListNotJoin);

		request.setAttribute("join", true);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/groupLogged.jsp");
		dispatcher.forward(request, response);
	}

	public void detailGroup(String id_group, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<User> listUser = new ArrayList<>();
		GroupBO bo = new GroupBO();
		listUser = bo.getUserById_group(id_group);

		ArrayList<Group_User> listPost = new ArrayList<>();
		listPost = bo.getAllPosts(id_group);

		request.setAttribute("listUser", listUser);
		request.setAttribute("listPost", listPost);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/groupDetail.jsp");
		dispatcher.forward(request, response);
	}
}