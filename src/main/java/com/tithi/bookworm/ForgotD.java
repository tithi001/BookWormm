/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ForgotD {
    String url="jdbc:oracle:thin:@localhost:1521:orcl";
    String username="IPM";
    String password="IPM_LAB";
    String sql="select email,password from signup where email=?";
    String sql2 = "update signup set password=? where email=?";
    String sql3 = "commit";
    
    public boolean check(String uname){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,uname);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                
                return true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }
    
    public void setPassword(String uname, String pass){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st1=con.prepareStatement(sql2);
            st1.setString(1,pass);
            st1.setString(2,uname);
            PreparedStatement st2=con.prepareStatement(sql3);
            ResultSet rs=st1.executeQuery();
            rs=st2.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
