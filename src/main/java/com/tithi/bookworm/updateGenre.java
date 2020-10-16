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
@WebServlet(name = "updateGenre", urlPatterns = {"/updateGenre"})
public class updateGenre extends HttpServlet {


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session=request.getSession();
       
        int bid=0; int g_id=0;
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            String[] genres=(String[])session.getAttribute("genres_b");
            String a_name=(String)session.getAttribute("a_name");
             String b_name=(String)session.getAttribute("b_name");
                 
             try{
          
            
          
             Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            String sql= "select book_id from book where book_name=? and author_name=?";
            PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,b_name);
            st.setString(2,a_name);
             ResultSet rs=st.executeQuery();
             while(rs.next()){
                 bid=rs.getInt("book_id");
                 System.out.println(bid);
             }
                
            for (int i = 0; i < genres.length; i++) {
              
           System.out.println(genres[i]);
           String sql1="select genre_id from genre where genre_name=?";
            PreparedStatement st1=con.prepareStatement(sql1);
           st1.setString(1,genres[i]);
           ResultSet rs1=st1.executeQuery();
           while(rs1.next()){
               g_id=rs1.getInt("genre_id");
           }
                System.out.println(g_id);
           String sql2=" insert into book_genre values(?,?)";
            PreparedStatement st2=con.prepareStatement(sql2);
           st2.setInt(1,bid);
            st2.setInt(2,g_id);
           
           ResultSet rs2=st2.executeQuery();
           
           
           
           
        
     }
             
            session.setAttribute("newBook", "added");
             }catch(Exception e){
           
       }
             session.removeAttribute("genres_b");
              session.removeAttribute("a_name");
               session.removeAttribute("b_name");
              response.sendRedirect("addBook.jsp");
    }

  
}
