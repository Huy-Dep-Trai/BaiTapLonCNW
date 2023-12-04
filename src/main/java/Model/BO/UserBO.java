package Model.BO;

import Model.BEAN.User;
import Model.DAO.UserDAO;

import java.util.ArrayList;

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
}
