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
@WebServlet(name = "allUser", urlPatterns = {"/allUser"})
public class allUser extends HttpServlet {

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            String sql="select p.user_id,p.username,p.address,p.phone_number,p.email,p.age from profile p,signup s where p.email=s.email";
            String sql1="select s.email from signup s where (select p.email from profile p where p.email = s.email) IS NULL";
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st=con.prepareStatement(sql);
            
            ResultSet rs=st.executeQuery();
            PreparedStatement st1=con.prepareStatement(sql1);
            
            ResultSet rs1=st1.executeQuery();
            
            
            HttpSession session=request.getSession(true);
            /*while(rs.next()){
                o.println(rs.getString("book_name"));
            }*/
            
            
            session.setAttribute("profile_info", rs);
            session.setAttribute("profile_inf", rs1);
            
        }catch(Exception e){
            e.printStackTrace();
        }
            
        
            
            
            
            
            
            response.sendRedirect("allUser.jsp");
    }

   
}
