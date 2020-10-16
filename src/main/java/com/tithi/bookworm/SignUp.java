/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {
    
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

    
public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    String uname=request.getParameter("uname");
    String pass=request.getParameter("pass");
    String encryptedPassword = pass;
    
    try {
        encryptedPassword = getEncryptedPassword(pass);
    } catch (NoSuchAlgorithmException ex) {
        Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
    }
    System.out.println(encryptedPassword);
    
    SignD sd=new SignD();
 
    
    if (sd.check(uname)) {
    
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('Username already exists');");
        pw.println("</script>");
        
        RequestDispatcher rd=request.getRequestDispatcher("SignUp.jsp");
        rd.include(request, response);
    }
    
    else {
        sd.signup(uname,encryptedPassword);
        response.sendRedirect("Login.jsp");
    }
    
    
    
}
   
      

}
