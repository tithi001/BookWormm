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
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NUSRAT
 */
@WebServlet(name = "Genre", urlPatterns = {"/Genre"})
public class Genre extends HttpServlet {
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<String> gName=new ArrayList<>(); 
        
   
         String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
   String sql1=" select book_id,book_name,author_name,description from book where book_id in(select book_id from book_genre where genre_id=?)";
          HttpSession session=request.getSession(true);
     String sql="select * from genre";
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
           
            
           PreparedStatement st=con.prepareStatement(sql);
           ResultSet rs=st.executeQuery();
           while(rs.next()){
               int gid=rs.getInt("genre_id");
               String g_name=rs.getString("genre_name");
               gName.add(g_name);
               System.out.println(gid);
                PreparedStatement st1=con.prepareStatement(sql1);
                st1.setInt(1,gid);
                
           ResultSet rs1=st1.executeQuery();
            
              
           
            session.setAttribute(g_name, rs1);
               
           }
             session.setAttribute("gname",gName);
             
            
        }catch(Exception e){
            e.printStackTrace();
        }
            
        
            
            response.sendRedirect("Genre.jsp");
            
           
            
           
    }

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 @Override
    public String getServletInfo() {
        return "Short description";
    }

}