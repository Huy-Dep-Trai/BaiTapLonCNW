package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Model.BEAN.Group;

import Model.BEAN.User;

public class GroupDAO{

    public ArrayList<Group> getAllGroups() {
        ArrayList<Group> groupList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");

            Statement sm= (Statement) conn.createStatement();

            String query = " SELECT * FROM grouptable ";
            ResultSet rs = sm.executeQuery(query);


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
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");

            Statement sm= (Statement) conn.createStatement();
            //String query = "SELECT username FROM `user_group` WHERE id_group = '" + id_group + "' ";
            String query = "SELECT userinfo.name " +
                    "FROM userinfo " +
                    "INNER JOIN user_group ON userinfo.username = user_group.username " +
                    "WHERE user_group.id_group = '" + id_group + "' ";
            ResultSet rs = sm.executeQuery(query);
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");

            Statement sm= (Statement) conn.createStatement();

            String query = "SELECT * FROM grouptable " +
                    "INNER JOIN user_group ON grouptable.id_group = user_group.id_group " +
                    "WHERE user_group.username = '" + username +"' ";
            ResultSet rs = sm.executeQuery(query);


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
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bai_tap_lon_cnw","root", "");

            Statement sm= (Statement) conn.createStatement();

            String query = "SELECT * FROM grouptable " +
                    "LEFT JOIN user_group ON grouptable.id_group = user_group.id_group AND user_group.username = '" + username + "' " +
                    "WHERE user_group.id_group IS NULL";
            ResultSet rs = sm.executeQuery(query);


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
}