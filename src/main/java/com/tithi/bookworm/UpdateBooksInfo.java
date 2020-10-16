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
 * @author NUSRAT
 */
@WebServlet(name = "UpdateBooksInfo", urlPatterns = {"/UpdateBooksInfo"})
public class UpdateBooksInfo extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int g_id=0;
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            
            int id=Integer.parseInt(request.getParameter("book_id"));
            
       String bookName=request.getParameter("book_name");
       String date=request.getParameter("release_date");
       String authorName=request.getParameter("author_name");
       String description=request.getParameter("description");
       String[] genres=request.getParameterValues("genre");
       
    
       String sql="Update book set book_name=?,release_date=?,author_name=?,description=? where book_id=?";
       String sql1="delete from book_genre where book_id=?";
       try{
          
            
          
             Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
           
          
          
       PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,bookName);
            st.setDate(2,java.sql.Date.valueOf(date));
            st.setString(3,authorName);
             st.setString(4,description);
            st.setInt(5,id);
           
            ResultSet rs=st.executeQuery();
            
             PreparedStatement st1=con.prepareStatement(sql1);
           
            st1.setInt(1,id);
           
            ResultSet rs1=st1.executeQuery();
            
            for (int i = 0; i < genres.length; i++) {
              
           //System.out.println(genres[i]);
           String sql2="select genre_id from genre where genre_name=?";
            PreparedStatement st2=con.prepareStatement(sql2);
           st2.setString(1,genres[i]);
           ResultSet rs2=st2.executeQuery();
           while(rs2.next()){
               g_id=rs2.getInt("genre_id");
           }
               // System.out.println(g_id);
           String sql3=" insert into book_genre values(?,?)";
            PreparedStatement st3=con.prepareStatement(sql3);
           st3.setInt(1,id);
            st3.setInt(2,g_id);
           
           ResultSet rs3=st3.executeQuery();
           
           
           
           
        
     }
            
            
           HttpSession session=request.getSession();
           session.setAttribute("oldBook", "updated");
       }catch(Exception e){
           
       }
       
   response.sendRedirect("AllBooks");
        
        
    }

  

}
