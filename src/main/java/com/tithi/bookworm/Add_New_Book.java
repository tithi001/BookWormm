/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "Add_New_Book", urlPatterns = {"/Add_New_Book"})
public class Add_New_Book extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
          String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
       String bookName=request.getParameter("book_name");
       String date=request.getParameter("release_date");
       String authorName=request.getParameter("author_name");
       String[] genres=request.getParameterValues("genre");
       String description=request.getParameter("description");
    
     
    
       String sql="insert into book(book_name,release_date,author_name,description)values (?,?,?,?)";
       
       try{
          
            
          
             Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            
           
          
          
       PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,bookName);
            st.setDate(2,java.sql.Date.valueOf(date));
            st.setString(3,authorName);
             st.setString(4,description);
           
            ResultSet rs=st.executeQuery();
         
             session.setAttribute("genres_b",genres);
       session.setAttribute("b_name",bookName);
       session.setAttribute("a_name",authorName);
             
       }catch(Exception e){
           
       }
       
      
     response.sendRedirect("updateGenre");
  
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

}
