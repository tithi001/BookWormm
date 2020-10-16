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
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SWO SIRAJ
 */
@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Logout</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Logout at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        //History code
        
        PrintWriter o = response.getWriter();  
        
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String username="IPM";
            String password="IPM_LAB";
            HttpSession session = request.getSession(true);
            String userName=(String)session.getAttribute("username");
            o.println(userName);
            //String sql="select book_id, avg(rate),book_name,author_name from bookshelf group by book_id,book_name,author_name order by avg(rate) desc";
            String sql= "insert into history(user_name,event_name,event_time,mark_type,book_name) values('"+userName+"','logged out',localtimestamp,null,null)";
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
            
        
        
        
        
        
        
        

HttpSession theSession = request.getSession( false );

 if( theSession != null ) {
      
        theSession.invalidate();
       
    }
 
 RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
dispatcher.forward(request, response);
 

        Cookie userNameCookieRemove = new Cookie("userName", null);
        userNameCookieRemove.setMaxAge(0);
        response.addCookie(userNameCookieRemove);
        Cookie userNameCookieRemove2 = new Cookie("password", null);
        userNameCookieRemove2.setMaxAge(0);
        response.addCookie(userNameCookieRemove2);
         
        
        
        
      /*  HttpSession session = request.getSession(false);
if (request.isRequestedSessionIdValid() && session != null) {
session.invalidate();
}
Cookie[] cookies = request.getCookies();
for (Cookie cookie : cookies) {
cookie.setMaxAge(0);
cookie.setValue(null);
cookie.setPath("/");
response.addCookie(cookie);

}*/
      
      
      
     /* response.setContentType("text/html");
        Cookie loginCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) {
                    loginCookie = cookie;
                    break;
                }
            }
        }
        if (loginCookie != null) {
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }

ServletContext sc = getServletContext();
        sc.getRequestDispatcher("/ViewModel2/BookList.html").forward(request, response);*/

        
        
        
        //PrintWriter out=response.getWriter();  
        //out.println( userNameCookieRemove.getValue());
        //out.println( userNameCookieRemove2.getValue());
        
         
               // processRequest(request, response);
    }
    
    
    
    
    
    
    
    
    
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
