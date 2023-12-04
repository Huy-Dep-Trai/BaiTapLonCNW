package Model.DAO;

import DbHelper.DbHelper;
import Model.BEAN.User;

import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
    public boolean checkIfUserIsExist(String username) throws  Exception{

        String query = "SELECT * FROM user WHERE username = '" + username + "'";

        ResultSet rs = DbHelper.getResultSet(query);

        return !rs.next();
    }
    public ArrayList<User> getAllUsers() throws Exception {
        ArrayList<User> users = new ArrayList<>();

        String query = "SELECT user.password, userinfo.* " +
                "FROM user INNER JOIN userinfo " +
                "ON user.username = userinfo.username;";
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
}
