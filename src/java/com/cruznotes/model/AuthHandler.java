/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.model;

import com.cruznotes.fields.Auth;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author devcruz
 */
public class AuthHandler {
    Database db = new Database();
    
    public boolean Login (Auth ath) throws SQLException {
        boolean result = false;
        
        if (db.connect()){
            
            final Connection con = db.getConnection();
            
            String SELECT = "SELECT * FROM admin WHERE admin_email = ? AND admin_password = ?";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ps.setString(1, ath.getEmail());
            ps.setString(2, ath.getPassword());
            
            ResultSet rs = ps.executeQuery();
            
            result = rs.next();
            
        }
        
        return result;
    }
}
