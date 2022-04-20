/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.model;

import com.cruznotes.fields.Newpost;
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
public class PostHandler {
    
    Database db = new Database();
    
    public int CreatePost (Newpost nw) throws SQLException {
        
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
        
            String INSERT = "INSERT INTO stories(title,content,image,tags, author) VALUES (?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(INSERT);

            ps.setString(1, nw.getTitle());        
            ps.setString(2, nw.getContent());        
            ps.setString(3, nw.getImage());        
            ps.setString(4, nw.getTags());        
            ps.setString(5, nw.getAuthor());
            
            result = ps.executeUpdate();
        }
        
        return result;
        
    }
    
    public String GetPost () throws SQLException {
        JSONArray arr = new JSONArray();
        
        if (db.connect()){
            final Connection con = db.getConnection();
            
            String SELECT = "SELECT * FROM stories ORDER BY date_created DESC";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                
                String id = rs.getString("post_id");
                String title = rs.getString("title");
                String tags = rs.getString("tags");
                String image = rs.getString("image");
                String content = rs.getString("content");
                String author = rs.getString("author");
                String date_created = rs.getString("date_created");
                int views = rs.getInt("views");
                
                JSONObject obj = new JSONObject();
                
                obj.put("id", id);
                obj.put("title", title);
                obj.put("tags", tags);
                obj.put("image", image);
                obj.put("content", content);
                obj.put("author", author);
                obj.put("date_created", date_created);
                obj.put("views", views);
                
                arr.add(obj);
            }
            
            con.close();
            
        }
        
        return arr.toJSONString();
    }
    
    public JSONObject GetSinglePost (String post_id) throws SQLException {
        JSONObject obj = new JSONObject();
        
        if (db.connect()){
            final Connection con = db.getConnection();
            
            String SELECT = "SELECT * FROM stories WHERE post_id = ? ";
            
            PreparedStatement ps = con.prepareStatement(SELECT);
            
            ps.setString(1, post_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                
                String id = rs.getString("post_id");
                String title = rs.getString("title");
                String tags = rs.getString("tags");
                String image = rs.getString("image");
                String content = rs.getString("content");
                String author = rs.getString("author");
                String date_created = rs.getString("date_created");
                int views = rs.getInt("views");
                
                obj.put("id", id);
                obj.put("title", title);
                obj.put("tags", tags);
                obj.put("image", image);
                obj.put("content", content);
                obj.put("author", author);
                obj.put("date_created", date_created);
                obj.put("views", views);
                
            }
            
            con.close();
        }
        
        return obj;
    }
    
    public int UpdateViews (int views, int id) throws SQLException {
        
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String UPDATE = "UPDATE stories SET views = ? WHERE post_id = ?";
            
            PreparedStatement ps = con.prepareStatement(UPDATE);
            
            ps.setInt(1, views + 1);
            ps.setInt(2, id);
            
            result = ps.executeUpdate();
            
        }
        
        return result;
    }
    
    public int updatePost (Newpost np) throws SQLException {
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String UPDATE = "UPDATE stories SET content = ? WHERE post_id = ?";
            
            PreparedStatement ps = con.prepareStatement(UPDATE);
            
            ps.setString(1, np.getContent());
            ps.setInt(2, np.getId());
            
            result = ps.executeUpdate();
        }
        
        return result;
    }
    
    public int deletePost (int id) throws SQLException {
        int result = 0;
        
        if(db.connect()){
            final Connection con = db.getConnection();
            
            String DELETE = "DELETE FROM stories WHERE post_id = ?";
            
            PreparedStatement ps = con.prepareStatement(DELETE);
            
            ps.setInt(1, id);
            
            result = ps.executeUpdate();
        }
        
        return result;
    }
    
    public int countPost () throws SQLException {
        int result = 0;
        
        if (db.connect()){
            final Connection con =db.getConnection();
            
            String COUNT = "SELECT COUNT(post_id) as count FROM stories";
            
            PreparedStatement ps = con.prepareStatement(COUNT);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) result = rs.getInt("count");
        }
        
        return result;
    }
}
