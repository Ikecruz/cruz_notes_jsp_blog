/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.controller;

import com.cruznotes.fields.Newpost;
import com.cruznotes.model.PostHandler;
import java.io.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author devcruz
 */
@WebServlet(name = "addpost", urlPatterns = {"/dashboard/addpost"})
public class addpostServlet extends HttpServlet {
    Newpost nw = new Newpost();
    PostHandler post = new PostHandler();
    JSONObject obj = new JSONObject();

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
        
        HttpSession session = request.getSession();
        
        if (session.getAttribute("loggedin") == null || session.getAttribute("loggedin").equals("")){
            response.sendRedirect("../login");
            return;
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/addpost.jsp");
        dispatcher.forward(request, response);
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
    
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image");
        String tags = request.getParameter("tags");
        String author = request.getParameter("author");
        
        nw.setTitle(title);
        nw.setContent(content);
        nw.setImage(image);
        nw.setTags(tags);
        nw.setAuthor(author);
        
        try {
            if(post.CreatePost(nw) > 0){
                obj.put("status", "success");
                try (PrintWriter out = response.getWriter();) {
                    out.println(obj.toJSONString());
                    out.flush();
                }
            } else{
                obj.put("status", "error");
                try (PrintWriter out = response.getWriter();) {
                    out.println(obj.toJSONString());
                    out.flush();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(addpostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
