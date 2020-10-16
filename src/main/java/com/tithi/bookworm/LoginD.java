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
public class LoginD {
    String url="jdbc:oracle:thin:@localhost:1521:orcl";
    String username="IPM";
    String password="IPM_LAB";
    String sql="select * from signup where email=? and password=?";
     
    String sql1="update signup set password=? where email=?";
     String sql2="commit";
     String sql3="update signup set email=? where email=?";
    public boolean check(String uname,String pass){
        try{
             
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,uname);
            st.setString(2, pass);
            ResultSet rs=st.executeQuery();
         while(rs.next()){
                
                return true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }
    public void changePass(String newPass,String uname){
       try{ Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st=con.prepareStatement(sql1);
            
            st.setString(1,newPass);
             st.setString(2,uname);
           
            ResultSet rs=st.executeQuery();
            st=con.prepareStatement(sql2);
            
            rs=st.executeQuery();
           
       }catch(Exception e){
           
       }
    }
    public void EditMail(String editMail,String uname){
       try{ Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            PreparedStatement st=con.prepareStatement(sql3);
            
            st.setString(1,editMail);
             st.setString(2,uname);
           
            ResultSet rs=st.executeQuery();
            st=con.prepareStatement(sql2);
            
            rs=st.executeQuery();
           
       }catch(Exception e){
           
       }
    }
    
    
}
