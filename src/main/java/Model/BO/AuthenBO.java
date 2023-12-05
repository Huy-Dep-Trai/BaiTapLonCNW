package Model.BO;

import Model.BEAN.User;
import Model.DAO.AuthenDAO;

public class AuthenBO {
    public boolean verifyLogin(String username, String password){
        boolean success = false;

        try{
            success = new AuthenDAO().verifyLogin(username, password);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return success;
    }
    public boolean registerAccount(User user){
        boolean success = false;

        try{
            success = new AuthenDAO().registerAccount(user);
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return success;
    }
}
