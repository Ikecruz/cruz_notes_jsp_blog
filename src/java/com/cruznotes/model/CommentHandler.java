/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.model;

import com.cruznotes.fields.Newcomment;
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
public class CommentHandler {
    Database db = new Database();
    
    public JSONArray GetComments (int post_id) throws SQLException {
        
        JSONArray arr = new JSONArray();
        
        if(db.connect()) {
            final Connection con = db.getConnection();
            
            String SELECT = " SELECT * FROM comments WHERE post_id = ?";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ps.setInt(1, post_id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                String user_name = rs.getString("user_name");
                String comment_body = rs.getString("comment_content");
                String comment_date = rs.getString("comment_date");
                
                JSONObject obj = new JSONObject();
                
                obj.put("user_name", user_name);
                obj.put("comment_body", comment_body);
                obj.put("comment_date", comment_date);
                
                arr.add(obj);
            }
            
            con.close();
            
        }
        
        return arr;
    }
    
    public int CreateComment (Newcomment nc) throws SQLException {
        
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String INSERT = "INSERT INTO comments(post_id,user_name,comment_content) VALUES(?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(INSERT);
            
            ps.setInt(1, nc.getPost_id());
            ps.setString(2, nc.getComment_name());
            ps.setString(3, nc.getComment_body());
            
            result = ps.executeUpdate();
            
            con.close();
        }
        
        return result;
    }
    
    public JSONArray GetAllComments () throws SQLException {
        JSONArray arr = new JSONArray();
        
        if(db.connect()) {
            final Connection con = db.getConnection();
            
            String SELECT = " SELECT * FROM comments";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                String id = rs.getString("comment_id");
                String user_name = rs.getString("user_name");
                String comment_body = rs.getString("comment_content");
                String comment_date = rs.getString("comment_date");
                
                JSONObject obj = new JSONObject();
                
                obj.put("comment_id", id);
                obj.put("user_name", user_name);
                obj.put("comment_body", comment_body);
                obj.put("comment_date", comment_date);
                
                arr.add(obj);
            }
            
            con.close();
            
        }
        
        return arr;
    }
    
    public int deleteComment (int id) throws SQLException {
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String DELETE = "DELETE FROM comments WHERE comment_id = ?";
            
            PreparedStatement ps = con.prepareStatement(DELETE);
            
            ps.setInt(1, id);
            
            result = ps.executeUpdate();
        }
        
        return result;
    }
    
    public int countComment () throws SQLException {
        int result = 0;
        
        if (db.connect()){
            final Connection con =db.getConnection();
            
            String COUNT = "SELECT COUNT(comment_id) as count FROM comments";
            
            PreparedStatement ps = con.prepareStatement(COUNT);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) result = rs.getInt("count");
        }
        
        return result;
    }
    
}
