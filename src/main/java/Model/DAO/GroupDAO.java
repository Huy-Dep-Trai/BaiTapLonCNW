package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import DbHelper.DbHelper;
import Model.BEAN.Group;
import Model.BEAN.Group_User;
import Model.BEAN.User;

public class GroupDAO{
	public ArrayList<Group> getPopularGroups(){
		ArrayList<Group> groups = new ArrayList<>();

		int MAX_AMOUNT_OF_GROUPS = 8;

		try{
			String query = "SELECT \n" +
					"  grouptable.id_group,\n" +
					"  grouptable.name_group,\n" +
					"  grouptable.maximum_member,\n" +
					"  grouptable.description,\n" +
					"  grouptable.privacy,\n" +
					"  COUNT(user_group.username) AS user_count\n" +
					"FROM \n" +
					"  grouptable\n" +
					"LEFT JOIN user_group ON grouptable.id_group = user_group.id_group\n" +
					"GROUP BY \n" +
					"  grouptable.id_group\n" +
					"ORDER BY \n" +
					"  user_count DESC;";

			ResultSet rs = DbHelper.getResultSet(query);

			int index = 1;
			while(rs.next()){
				Group group = new Group();

				group.setId_group(rs.getString("id_group"));
				group.setName_group(rs.getString("name_group"));
				group.setMaximum_member(rs.getInt("maximum_member"));
				group.setDescription(rs.getString("description"));
				group.setPrivacy(rs.getInt("privacy"));
				group.setCurrent_member_amount(rs.getInt("user_count"));
				groups.add(group);

				index++;
				if(index > 8) break;
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return  groups;

	}

	public int getMemberAmountOfGroup(String idGroup){
		int member_amount = -1;

		try{
			String query = "SELECT grouptable.id_group, COUNT(user_group.username) AS user_count\n" +
					"FROM user_group\n" +
					"JOIN grouptable ON user_group.id_group = grouptable.id_group\n" +
					"WHERE grouptable.id_group = '" + idGroup + "'\n" +
					"GROUP BY grouptable.id_group";

			ResultSet rs = DbHelper.getResultSet(query);
			while(rs.next()){
				member_amount = rs.getInt("user_count");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return member_amount;
	}

	public ArrayList<Group> getAllGroups() {
		ArrayList<Group> groupList = new ArrayList<>();
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");
//																						   
//			Statement sm= (Statement) conn.createStatement();
			
	        String query = " SELECT * FROM grouptable ";
	        ResultSet rs = DbHelper.getResultSet(query);
	        //ResultSet rs = sm.executeQuery(query);

	       
	        while(rs.next()){
	        	Group group = new Group();
	            group.setId_group(rs.getString("id_group"));
	            group.setName_group(rs.getString("name_group"));
	            group.setMaximum_member(rs.getInt("maximum_member"));
	            group.setDescription(rs.getString("description"));
	            group.setPrivacy(rs.getInt("privacy"));
	            
	            groupList.add(group);
	        }
	        
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return groupList;
	}

	public ArrayList<User> getUserById_group(String id_group) {
		ArrayList<User> listUser = new ArrayList<>();
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");
//																						   
//			Statement sm= (Statement) conn.createStatement();
			//String query = "SELECT username FROM `user_group` WHERE id_group = '" + id_group + "' ";
			String query = "SELECT userinfo.name " +
						   "FROM userinfo " +
						   "INNER JOIN user_group ON userinfo.username = user_group.username " +
						   "WHERE user_group.id_group = '" + id_group + "' ";
			
			ResultSet rs = DbHelper.getResultSet(query);
	        //ResultSet rs = sm.executeQuery(query);
	        while(rs.next()){
	        	User user = new User();
	            user.setName(rs.getString("name"));
	            
	            listUser.add(user);
	        }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return listUser;
	}
	
	public ArrayList<Group> getGroupsJoined(String username){
		ArrayList<Group> groupListJoined = new ArrayList<>();
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");
//																						   
//			Statement sm= (Statement) conn.createStatement();
			
	        String query = "SELECT * FROM grouptable " +
	        				"INNER JOIN user_group ON grouptable.id_group = user_group.id_group " +
	        				"WHERE user_group.username = '" + username +"' ";
	        ResultSet rs = DbHelper.getResultSet(query);
	        //ResultSet rs = sm.executeQuery(query);

	       
	        while(rs.next()){
	        	Group group = new Group();
	            group.setId_group(rs.getString("id_group"));
	            group.setName_group(rs.getString("name_group"));
	            group.setMaximum_member(rs.getInt("maximum_member"));
	            group.setDescription(rs.getString("description"));
	            group.setPrivacy(rs.getInt("privacy"));
	            
	            groupListJoined.add(group);
	        }
	        
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return groupListJoined;
	}

	public ArrayList<Group> getGroupsNotJoin(String username) {
		ArrayList<Group> groupListNotJoin = new ArrayList<>();
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");
//																						   
//			Statement sm= (Statement) conn.createStatement();
			
	        String query = "SELECT * FROM grouptable " +
	        				"LEFT JOIN user_group ON grouptable.id_group = user_group.id_group AND user_group.username = '" + username + "' " +
	        				"WHERE user_group.id_group IS NULL";
	        ResultSet rs = DbHelper.getResultSet(query);
	        //ResultSet rs = sm.executeQuery(query);

	       
	        while(rs.next()){
	        	Group group = new Group();
	            group.setId_group(rs.getString("id_group"));
	            group.setName_group(rs.getString("name_group"));
	            group.setMaximum_member(rs.getInt("maximum_member"));
	            group.setDescription(rs.getString("description"));
	            group.setPrivacy(rs.getInt("privacy"));
	            
	            groupListNotJoin.add(group);
	        }
	        
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return groupListNotJoin;
	}

	public void userJoinGroup(String username, String id_group) {
		try {
 
			Statement statement = null;
			
	
			String query = "INSERT INTO user_group(username, id_group, post) VALUES ('"+ username +"', '" + id_group +"', '')";
			
			statement = DbHelper.getConnection().createStatement();
			
			int rowsAffected = statement.executeUpdate(query);
			
			if (rowsAffected > 0) {
	            System.out.println("Truy vấn đã được thực hiện thành công.");
	        } else {
	            System.out.println("Truy vấn không ảnh hưởng đến bất kỳ hàng nào.");
	        }
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void userPost(Group_User group_user) {
		try {
			Statement statement = null;
			
			
			String query = "UPDATE user_group SET post = '"+ group_user.getPost() +"' WHERE username = '" + group_user.getUsername() + "' AND id_group = '" + group_user.getId_group() + "'  ";
			
			statement = DbHelper.getConnection().createStatement();
			
			int rowsAffected = statement.executeUpdate(query);
			
			if (rowsAffected > 0) {
	            System.out.println("Truy vấn đã được thực hiện thành công.");
	        } else {
	            System.out.println("Truy vấn không ảnh hưởng đến bất kỳ hàng nào.");
	        }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Group_User> getAllPosts(String id_group) {
		ArrayList<Group_User> listPost = new ArrayList<>();
		try {		
	        String query = " SELECT * FROM user_group WHERE id_group = '"+ id_group +"'";
	        ResultSet rs = DbHelper.getResultSet(query);

	       
	        while(rs.next()){
	        	Group_User post = new Group_User();
	        	post.setUsername(rs.getString("username"));
	            post.setId_group(rs.getString("id_group"));
	            post.setPost(rs.getString("post"));
	            
	            listPost.add(post);
	        }
	        
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return listPost;
	}
}