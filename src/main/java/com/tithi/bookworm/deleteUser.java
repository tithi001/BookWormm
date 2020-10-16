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
@WebServlet(name = "deleteUser", urlPatterns = {"/deleteUser"})
public class deleteUser extends HttpServlet {

 

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String em=request.getParameter("email");
          
            //String id1=String.valueOf(id);
           
            String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
           // String sql1=" delete from profile where user_id=?";
            String sql2=" delete from signup where email=?";
           
         
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
           
          PreparedStatement st=con.prepareStatement(sql2);
            st.setString(1,em);
          ResultSet rs=st.executeQuery();
          
                       
        }catch(Exception e){
            e.printStackTrace();
        } HttpSession session=request.getSession();
           session.setAttribute("deleteUser", "deleted");
             response.sendRedirect("allUser");
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /* int id=Integer.parseInt(request.getParameter("uId"));
          
            String id1=String.valueOf(id);
           
            String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            String sql1=" delete from profile where user_id=?";
            //String sql2=" delete from signup where email=(select email from profile where user_id=?)";
           
         
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            
         
          PreparedStatement st1=con.prepareStatement(sql1);
            st1.setInt(1,id);
            ResultSet rs1=st1.executeQuery();
                       
        }catch(Exception e){
            e.printStackTrace();
        }
            
      
  
            
            
            HttpSession session=request.getSession();
           session.setAttribute("deleteUser", "deleted");
           
            
            response.sendRedirect("allUser");*/
         
    }

  

}
