package Model.BO;

import Model.BEAN.User;
import Model.DAO.UserDAO;

import java.util.ArrayList;
import java.util.Optional;

public class UserBO {
    public ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<>();
        try{
            users = new UserDAO().getAllUsers();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return  users;
    }

    public User getUserByUsername(String username){
        User user = new User();

        try{
            user = new UserDAO().getUserByUsername(username);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return  user;
    }
    
    public boolean updateUserInfo(User user){
    	UserDAO userDAO = new UserDAO();
    	try {
			return userDAO.updateUserInfo(user);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    }
}
