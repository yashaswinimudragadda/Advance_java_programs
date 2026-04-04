package com.project.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils{
    private static String url = "jdbc:mysql://localhost:3306/projects";
    private static String user = "root";
    private static String pass = "1234";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);//database connection line
    }
}
