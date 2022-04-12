/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.controller;

import com.cruznotes.fields.Newcomment;
import com.cruznotes.model.CommentHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author devcruz
 */
@WebServlet(name = "postcomments", urlPatterns = {"/postcomments"})
public class postcomments extends HttpServlet {
    CommentHandler comment = new CommentHandler();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String post_id = request.getParameter("post_id");
        
        try {
            JSONArray comment_arr = comment.GetComments(Integer.valueOf(post_id));
            
            try(PrintWriter out = response.getWriter()){
                out.println(comment_arr.toJSONString());
                out.flush();
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(postcomments.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String post_id = request.getParameter("post_id");
        String user_name = request.getParameter("user_name");
        String comment_body = request.getParameter("comment_body");
        
        Newcomment nc = new Newcomment();
        
        nc.setPost_id(Integer.valueOf(post_id));
        nc.setComment_name(user_name);
        nc.setComment_body(comment_body);
        
        JSONObject obj = new JSONObject();
        
        try {
            if(comment.CreateComment(nc) > 0) {
                obj.put("status", "success");
                try(PrintWriter out = response.getWriter()) {
                    out.println(obj);
                    out.flush();
                }
            } else {
                obj.put("status", "error");
                try(PrintWriter out = response.getWriter()) {
                    out.println(obj);
                    out.flush();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(postcomments.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
