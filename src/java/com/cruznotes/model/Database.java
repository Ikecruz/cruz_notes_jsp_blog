/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author devcruz
 */
public class Database {
    private Connection connection;
    
    public boolean connect () throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cruznotes?useSSL=false","root","");
            return true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
            // Could not find the database driver
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
            // Could not connect to the database
        }
    }
    
    public Connection getConnection() {
        return connection;
    }
}
