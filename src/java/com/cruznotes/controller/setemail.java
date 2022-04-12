/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cruznotes.controller;

import com.cruznotes.fields.Newemail;
import com.cruznotes.model.EmailHandler;
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
import org.json.simple.JSONObject;

/**
 *
 * @author devcruz
 */
@WebServlet(name = "setemail", urlPatterns = {"/setemail"})
public class setemail extends HttpServlet {
    Newemail ne = new Newemail();
    EmailHandler email = new EmailHandler();

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet setemail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet setemail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
        
        String useremail = request.getParameter("email");
        
        ne.setEmail(useremail);
        
        JSONObject obj = new JSONObject();
        
        try {
            
            if (email.EmailExists(useremail)) {
                obj.put("status", "emailexists");
                
                try(PrintWriter out = response.getWriter()){
                    out.println(obj.toJSONString());
                }
                
                return;
            }
            
            if (email.SetEmail(ne) > 0){
                
                obj.put("status", "success");
                
                try(PrintWriter out = response.getWriter()){
                    out.println(obj.toJSONString());
                }
            } else {
                obj.put("status", "error");
                
                try(PrintWriter out = response.getWriter()){
                    out.println(obj.toJSONString());
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(setemail.class.getName()).log(Level.SEVERE, null, ex);
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
