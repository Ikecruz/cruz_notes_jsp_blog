/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.model;

import com.cruznotes.fields.Newemail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author devcruz
 */
public class EmailHandler {
    Database db = new Database();
    
    public int SetEmail (Newemail ne) throws SQLException {
        int result = 0;
        
        if (db.connect()){
            final Connection con = db.getConnection();
            
            String INSERT = "INSERT INTO email(email_content) VALUES(?)";
            
            PreparedStatement ps = con.prepareStatement(INSERT);
            
            ps.setString(1, ne.getEmail());
            
            result = ps.executeUpdate();
        }
        
        return result;
    }
    
    public boolean EmailExists (String email) throws SQLException {
        boolean result = false;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String SELECT = "SELECT * FROM email WHERE email_content = ?";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            result = rs.next();
        }
        
        return result;
    }
    
    public JSONArray GetAllEmails () throws SQLException {
        JSONArray arr = new JSONArray();
        
        if(db.connect()) {
            final Connection con = db.getConnection();
            
            String SELECT = " SELECT * FROM email";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                String id = rs.getString("email_id");
                String email = rs.getString("email_content");
                String date = rs.getString("date_created");
                
                JSONObject obj = new JSONObject();
                
                obj.put("email_id", id);
                obj.put("email_body", email);
                obj.put("date_created", date);
                
                arr.add(obj);
            }
            
            con.close();
            
        }
        
        return arr;
    }
    
    public int DeleteEmail  (int email_id) throws SQLException {
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String DELETE = "DELETE FROM email WHERE email_id = ?";
            
            PreparedStatement ps = con.prepareStatement(DELETE);
            
            ps.setInt(1,email_id);
            
            result = ps.executeUpdate();
        }
        
        return result;
    }
    
    public int countEmail () throws SQLException {
        int result = 0;
        
        if (db.connect()){
            final Connection con =db.getConnection();
            
            String COUNT = "SELECT COUNT(email_id) as count FROM email";
            
            PreparedStatement ps = con.prepareStatement(COUNT);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) result = rs.getInt("count");
        }
        
        return result;
    }
}
