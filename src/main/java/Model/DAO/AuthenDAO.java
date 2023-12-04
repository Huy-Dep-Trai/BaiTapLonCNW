package Model.DAO;

import Model.BEAN.User;

public class AuthenDAO {
    public boolean checkLogin(String username, String password) throws Exception{
        UserDAO dao = new UserDAO();

        User user = dao.getUserByUsername(username);

        if(user != null)
        {
            return user.getPassword().equals(password);
        }
        else return  false;
    }
}
