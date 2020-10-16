/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SWO SIRAJ
 */
@WebServlet(name = "HomeGenre", urlPatterns = {"/HomeGenre"})
public class HomeGenre extends HttpServlet {

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
            out.println("<title>Servlet HomeGenre</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeGenre at " + request.getContextPath() + "</h1>");
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
        
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            
            int genreId=Integer.parseInt(request.getParameter("genre"));
            String sql=" select book_id,book_name,author_name,description, release_date from book where book_id in(select book_id from book_genre where genre_id="+genreId+")";
            String sql2="select genre_name from genre where genre_id="+genreId;
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st=con.prepareStatement(sql);
            PreparedStatement st2=con.prepareStatement(sql2);
            
            ResultSet rs=st.executeQuery();
            ResultSet rs2=st2.executeQuery();
            
            
            HttpSession session=request.getSession(true);
           /* while(rs.next()){
                o.println(rs.getString("book_name"));
                o.println(rs.getDate("release_date"));
            }*/
            
            
            session.setAttribute("rs", rs);
            session.setAttribute("rs2", rs2);
            
        }catch(Exception e){
            e.printStackTrace();
        }
 
            response.sendRedirect("GenrePage.jsp");
        
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
        processRequest(request, response);
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
