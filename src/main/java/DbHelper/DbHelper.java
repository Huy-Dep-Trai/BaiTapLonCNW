package DbHelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbHelper {
    private static Connection cnn;
    static String url = "jdbc:mysql://localhost:3306/btth_laptrinhmang"; //link database
    static String user = "root";
    static String password = "";
    public static Connection getConnection(){
        try{
            if(cnn == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                cnn = DriverManager.getConnection(url, user, password);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return cnn;
    }
    public static ResultSet getResultSet(String query){
        Statement statement = null;
        ResultSet resultSet = null;

        try{
            if(cnn == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                cnn = DriverManager.getConnection(url, user, password);
            }

            statement =cnn.createStatement();
            resultSet = statement.executeQuery(query);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return resultSet;
    }
}
