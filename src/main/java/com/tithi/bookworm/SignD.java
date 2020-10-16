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

/**
 *
 * @author User
 */
public class SignD {
    String url="jdbc:oracle:thin:@localhost:1521:orcl";
    String username="IPM";
    String password="IPM_LAB";   
    String sql1="insert into signup (email,password) VALUES(?,?)";
    String sql2="commit";
    String sql ="select * from signup where email=?";

    public void signup(String uname,String pass){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st1=con.prepareStatement(sql1);
            st1.setString(1,uname);
            st1.setString(2,pass);
            PreparedStatement st2=con.prepareStatement(sql2);
            ResultSet rs=st1.executeQuery();
            rs=st2.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
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









}
