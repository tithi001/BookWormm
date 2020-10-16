/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "Login2", urlPatterns = {"/Login2"})
public class Login2 extends HttpServlet {
    
    public  String getEncryptedPassword(String password) throws NoSuchAlgorithmException {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] b = md.digest();
            StringBuffer sb = new StringBuffer();
            for(byte b1 : b){
                 sb.append(Integer.toHexString(b1 & 0xff).toString());
             }
            String result =  sb.toString();
            return result.substring(0,18);
             
    }
    
    
public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    String uname=request.getParameter("uname");
    String pass=request.getParameter("pass");
    String encryptedPassword = pass;
        try {
            encryptedPassword = getEncryptedPassword(pass);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login2.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    LoginD id=new LoginD();
    System.out.println("LOgin2 got it");
    
    
    
     /*if(id.check(uname,pass)){
    HttpSession session=request.getSession();
    session.setAttribute("userName", uname);
         System.out.println("okkkkkkk");
         new HistoryD().insert(uname, "login");
    response.sendRedirect("Home.jsp");
}
    
    
    else{
        
     response.setContentType("text/html");
PrintWriter pw=response.getWriter();
pw.println("<script type=\"text/javascript\">");
pw.println("alert('Invalid Username or Password');");
pw.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
rd.include(request, response);

       
       
         
        
        
    }*/
    
    if((uname.equals("admin@gmail.com"))&&(pass.equals("admin123"))){
        HttpSession session=request.getSession();
    session.setAttribute("username", uname);
    response.sendRedirect("SignUp.jsp");
    }
    
    
    else if(id.check(uname,encryptedPassword)&&(!uname.equals("admin@gmail.com"))&&(!pass.equals("admin123"))){
    HttpSession session=request.getSession();
    session.setAttribute("username", uname);
    
    
    //history code
    PrintWriter o = response.getWriter();  
        
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            //HttpSession session = request.getSession(true);
            String userName=(String)session.getAttribute("username");
            o.println(userName);
            //String sql="select book_id, avg(rate),book_name,author_name from bookshelf group by book_id,book_name,author_name order by avg(rate) desc";
            String sql= "insert into history (user_name,event_name,event_time,mark_type,book_name)values('"+userName+"','logged in',localtimestamp,null,null)";
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection(url, username, password);
            Statement st= con.createStatement();
            st.executeUpdate(sql);
            
            //ResultSet rs=st.executeUpdate();
           
            
            
            /*while(rs.next()){
                o.println(rs.getString("Event_name"));
            }*/
       
        }catch(Exception e){
            e.printStackTrace();
        }
    
    //response.sendRedirect("Home2.jsp");
    RequestDispatcher rd = request.getRequestDispatcher("/Home");
            rd.forward(request, response);
}
    
    
    else{
       
        response.setContentType("text/html");
   PrintWriter pw=response.getWriter();
   //pw.println(pass);
   pw.println("<script type=\"text/javascript\">");
   pw.println("alert('Invalid Username or Password');");
   pw.println("</script>");
   RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
   rd.include(request, response);
   }
    
}}

  

