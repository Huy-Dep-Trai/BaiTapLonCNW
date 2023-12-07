package Model.BO;

import java.util.ArrayList;

import Model.BEAN.Group;
import Model.BEAN.Group_User;
import Model.BEAN.User;
import Model.DAO.GroupDAO;

public class GroupBO{
    GroupDAO groupdao = new GroupDAO();

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

}