package Model.BO;

import java.sql.ResultSet;
import java.util.ArrayList;

import DbHelper.DbHelper;
import Model.BEAN.Group;
import Model.BEAN.Group_User;
import Model.BEAN.User;
import Model.DAO.GroupDAO;

public class GroupBO{
	GroupDAO groupdao = new GroupDAO();

	public ArrayList<Group> getPopularGroups(){
		ArrayList<Group> groupList = new ArrayList<>();
		try {
			groupList = groupdao.getPopularGroups();

		}
		catch(Exception e){
			e.printStackTrace();
		}
		return groupList;
	}
	public int getMemberAmountOfGroup(String idGroup){
		int member_amount = -1;

		try{
			member_amount = new GroupDAO().getMemberAmountOfGroup(idGroup);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return member_amount;
	}
	public ArrayList<Group> getAllGroups() {
		ArrayList<Group> groupList = new ArrayList<>();
		try {
			groupList = groupdao.getAllGroups();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return groupList;
	}
	public ArrayList<User> getUserById_group(String id_group) {
		ArrayList<User> listUser = new ArrayList<>();
		try {
			listUser = groupdao.getUserById_group(id_group);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return listUser;
		
	}
	public ArrayList<Group> getGroupsJoined(String username) {
		ArrayList<Group> groupListJoined = new ArrayList<>();
		try {
			groupListJoined = groupdao.getGroupsJoined(username);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return groupListJoined;
	}
	public ArrayList<Group> getGroupsNotJoin(String username) {
		ArrayList<Group> groupListNotJoin = new ArrayList<>();
		try {
			groupListNotJoin = groupdao.getGroupsNotJoin(username);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return groupListNotJoin;
	}
	public void userJoinGroup(String username, String id_group) {
		try {
			groupdao.userJoinGroup(username, id_group);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void userPost(Group_User group_user) {
		try {
			groupdao.userPost(group_user);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public ArrayList<Group_User> getAllPosts(String id_group) {
		ArrayList<Group_User> listPost = new ArrayList<>();
		try {
			listPost = groupdao.getAllPosts(id_group);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return listPost;
	}
	
}