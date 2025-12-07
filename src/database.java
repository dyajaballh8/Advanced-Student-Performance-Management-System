package employeemanagementsystem;

import java.sql.Connection;
import java.sql.DriverManager;


public class database {
    
    public static Connection connectDb(){
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection connect = DriverManager.getConnection("jdbc:sql://DYAAGABULLAH\DYAA;Database=StudentPerformanceDB;IntegratedSecurity=true");
            return connect;Inte
        }catch(Exception e){e.printStackTrace();}
        return null;
    }
    
}
