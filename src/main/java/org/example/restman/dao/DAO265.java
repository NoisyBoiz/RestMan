package org.example.restman.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO265 {
    public static Connection conn;
    public DAO265(){
        if(conn==null) {
            String url = "jdbc:mysql://localhost:3306/restman";
            String username = "root";
            String password = "1234";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
            } catch (Exception e) {
                System.out.println("Error: ##############");
                e.printStackTrace();
            }
        }
    }
}