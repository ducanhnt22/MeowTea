/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author Admin
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=MeowTea";
        conn = DriverManager.getConnection(url, "sa", "12345");
        return conn;
    }
    
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        DBUtils utils = new DBUtils();
//        System.out.println(utils.getConnection());
//    }
}
