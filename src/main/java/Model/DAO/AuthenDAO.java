package Model.DAO;

import DbHelper.DbHelper;
import Model.BEAN.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AuthenDAO {
    public boolean verifyLogin(String username, String password) throws Exception{
        UserDAO dao = new UserDAO();

        User user = dao.getUserByUsername(username);

        if(user.getPassword() != null)
        {
            return user.getPassword().equals(password);
        }
        else return false;
    }
    public boolean registerAccount(User user){
        UserDAO dao = new UserDAO();

        int userAffected = 0, userInfoAffected = 0;

        try{
            if(dao.checkIfUserIsExist(user.getUsername())){
                return false;
            }
            else{
                Statement statement = null;

                String addUserQuery = String.format("insert into user values ('%s', '%s')", user.getUsername(), user.getPassword());
                String addUserInfo = String.format("insert into userinfo values('%s', '%s', '%d', '%d', '%s', '%d')", user.getUsername(), user.getName(), user.getAge(), user.isGender() ? 1 : 0, user.getUniveristy(), user.getRole());

                statement = DbHelper.getConnection().createStatement();

                userAffected = statement.executeUpdate(addUserQuery);
                userInfoAffected = statement.executeUpdate(addUserInfo);

            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

        if(userAffected > 0 && userInfoAffected > 0){
            return true;
        }
        else return false;

    }
}
