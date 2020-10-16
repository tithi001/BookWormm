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
@WebServlet(name = "deleteBook", urlPatterns = {"/deleteBook"})
public class deleteBook extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int bid=Integer.parseInt(request.getParameter("bId"));
       
        
         String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
              String sql1="delete from bookshelf where book_id=?";
            String sql3=" delete from book_genre where book_id=?";
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            /**/
          PreparedStatement st=con.prepareStatement(sql1);
            st.setInt(1,bid);
          ResultSet rs=st.executeQuery();
          
         PreparedStatement st2=con.prepareStatement(sql3);
            st2.setInt(1,bid);
          ResultSet rs2=st2.executeQuery();
          
          
         /* PreparedStatement st3=con.prepareStatement(sql4);
            st3.setInt(1,bid);
            ResultSet rs3=st3.executeQuery();*/
                       
        }catch(Exception e){
            e.printStackTrace();
        }
        doPost(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bid=Integer.parseInt(request.getParameter("bId"));
      
        
         String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
       
            String sql4=" delete from book where book_id=?";
         try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
          
          
          
       PreparedStatement st3=con.prepareStatement(sql4);
            st3.setInt(1,bid);
            ResultSet rs3=st3.executeQuery();
             HttpSession session=request.getSession();
        session.setAttribute("deleteBook", "deleted");
                       
        }catch(Exception e){
            e.printStackTrace();
        }
        
             response.sendRedirect("AllBooks");
    }


}
