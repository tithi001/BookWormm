/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;



@WebServlet(name = "Forgot", urlPatterns = {"/Forgot"})
public class Forgot extends HttpServlet {
    
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
    
    public String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 7) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
    
    
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        String uname=request.getParameter("uname");
        ForgotD ld=new ForgotD();

        if((uname.equals("admin@gmail.com"))){
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('ADMIN CANNOT CHANGE PASS');");
            pw.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("forgot.jsp");
            rd.include(request, response);
        }


        else if(ld.check(uname)){
//            HttpSession session=request.getSession(false);
//            session.setAttribute("message", uname);
//            response.sendRedirect("sendMail.jsp");
            String password = getSaltString();
            String encryptedPassword = password;
            try {
                encryptedPassword = getEncryptedPassword(password);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Forgot.class.getName()).log(Level.SEVERE, null, ex);
            }
            ld.setPassword(uname, encryptedPassword);
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            pw.println("<script src=\"https://smtpjs.com/v3/smtp.js\">");
            pw.println("</script>");

            pw.println("<script type=\"text/javascript\">");


            pw.println("Email.send({");
            pw.println("Host : \"smtp.elasticemail.com\",");      
            pw.println("Username : \"fariasolaiman22@gmail.com\",");       
            pw.println("Password : \"ef428e0b-03d6-4105-a70f-710dc073eb64\",");       
            pw.println("To : \""+ uname +"\",");       
            pw.println("From : \"fariasolaiman22@gmail.com\",");       
            pw.println("Subject : \"Password Reset\",");       
            pw.println("Body : \""+ password +"\",");       
            pw.println("}).then(");   
            pw.println("message => alert(message)");     
            pw.println(");");   
            pw.println("</script>"); 
            
            RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
            rd.include(request, response);
          
            

    }


        else{

            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Invalid Email Address');");
            pw.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("forgot.jsp");
            rd.include(request, response);

        }
    }
   
}

  
