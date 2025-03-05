/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MVC;
import java.sql.*;
/**
 *
 * @author rishabh
 */
public class MyCon {
    private static Connection con;
    static
    {
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rnit","root","Rishabh@30m#");
        }
        catch(ClassNotFoundException | SQLException e){
        e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException
    {
     if(con.isClosed())
     {
     con=DriverManager.getConnection("jdbc:mysql://localhost:rishi","root","Rishabh@30m#");
     }
    return con;
    }
}
