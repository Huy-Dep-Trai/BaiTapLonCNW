package Model.DAO;

import DbHelper.DbHelper;
import Model.BEAN.User;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
    public boolean checkIfUserIsExist(String username) throws  Exception{

        String query = "SELECT * FROM user WHERE username = '" + username + "'";

        try{
            ResultSet rs = DbHelper.getResultSet(query);

            return rs.next();
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public ArrayList<User> getAllUsers() throws Exception {
        ArrayList<User> users = new ArrayList<>();

        String query = "SELECT user.password, userinfo.* " +
                "FROM user INNER JOIN userinfo " +
                "ON user.username = userinfo.username " +
                "WHERE userinfo.role = 0";
        ResultSet rs = DbHelper.getResultSet(query);



        while(rs.next()){
            User user = new User();
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setName(rs.getString("name"));
            user.setAge(rs.getInt("age"));
            user.setGender(rs.getBoolean("gender"));
            user.setUniveristy(rs.getString("university"));
            user.setRole(rs.getInt("role"));

            users.add(user);
        }
        return users;
    }

    public User getUserByUsername(String username) throws  Exception{
        User user = new User();

        String query = "SELECT user.password, userinfo.* " +
                "FROM user INNER JOIN userinfo " +
                "ON user.username = userinfo.username " +
                "WHERE user.username = '"+ username+ "';";

        ResultSet rs = DbHelper.getResultSet(query);

        while(rs.next()){
            user.setUsername(username);
            user.setPassword(rs.getString("password"));
            user.setName(rs.getString("name"));
            user.setAge(rs.getInt("age"));
            user.setGender(rs.getBoolean("gender"));
            user.setUniveristy(rs.getString("university"));
            user.setRole(rs.getInt("role"));
        }
        return user;
    }

    public void AddOrUpdateUser(User userToDo) throws Exception{

    }

    public boolean deleteUser(String username){

        int userAffected = 0, userInfoAffected = 0, userGroupAffected = 0;
        try{
            Statement statement = null;

            String deleteUserInfoQuery = "DELETE FROM userinfo WHERE username = '" + username + "'";
            String deleteUserQuery = "DELETE FROM user WHERE username = '" + username + "'";
            String deleteUserGroup = "DELETE FROM user_group WHERE username = '" + username + "'";


            statement = DbHelper.getConnection().createStatement();

            userGroupAffected = statement.executeUpdate(deleteUserGroup);
            userInfoAffected = statement.executeUpdate(deleteUserInfoQuery);
            userAffected = statement.executeUpdate(deleteUserQuery);

        }
        catch(Exception e){
            e.printStackTrace();
        }
        if(userAffected > 0 && userInfoAffected > 0){
            return true;
        }
        else{
            return false;
        }

    }
    
    public boolean updateUserInfo(User user) throws Exception {
        // Assuming 'username' is a primary key or unique identifier for a user

        String updateQuery = "UPDATE userinfo " +
                "SET name = ?, age = ?, gender = ?, university = ?, role = ? " +
                "WHERE username = ?;";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DbHelper.getConnection();
            preparedStatement = connection.prepareStatement(updateQuery);

            preparedStatement.setString(1, user.getName());
            preparedStatement.setInt(2, user.getAge());
            preparedStatement.setBoolean(3, user.isGender());
            preparedStatement.setString(4, user.getUniveristy());
            preparedStatement.setInt(5, user.getRole());
            preparedStatement.setString(6, user.getUsername());
            System.out.println("call-------------------------DAO");
            System.out.println(user.getUsername());
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected == 0) {
            	return false;
                //throw new SQLException("Update failed, no rows affected.");
            }
            return true;
        } finally {
            
        }
    }
}
