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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DAFFODIL
 */
public class bookShelf extends HttpServlet {


    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "IPM";
    String password = "IPM_LAB";
    String status="";
    String review="";
    int rate=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookShelf</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookShelf at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        out.println("ok");
       
     
        //int id=Integer.parseInt((String) session.getAttribute("id"));
        int id=Integer.parseInt(request.getParameter("bId"));
        String bName=request.getParameter("bName");
        String Auth=request.getParameter("Auth");       
        out.println(id);
        out.println("here");
        String selectedItem = request.getParameter("shelfType");
        System.out.println("aaaaaaaaaa"+selectedItem);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
           
            Statement statement = con.createStatement();
            HttpSession session=request.getSession();
            String user=(String)session.getAttribute("username");
            System.out.println("user="+user);
            String sql4=("select * from bookshelf where BOOK_ID = "+id+" and email = '"+user+"'");
            System.out.println(id+ "     "+user);
            
            PreparedStatement st4 = con.prepareStatement(sql4); 
            
            ResultSet rs4 = st4.executeQuery();
           if(rs4.next()){
               //status=rs4.getString("status");
               rate=rs4.getInt("rate");
               review=rs4.getString("review");
               PreparedStatement st6 = con.prepareStatement("update bookshelf set status ='"+selectedItem+"' "
                       + "where BOOK_ID= "+id+" and EMAIL = '"+user+"'");
               ResultSet rs6 = st6.executeQuery();
               
           }
           else{
               
      
            String sql = "insert into bookshelf (book_id,email,status,book_name,author_name,rate,review) values"
                    + " (?,?,?,?,?,?,?)";
           
                      
  
            PreparedStatement st = con.prepareStatement(sql); 
            st.setInt(1,id);
            st.setString(2,(String)session.getAttribute("username"));
            st.setString(3,selectedItem);
            st.setString(4,bName);
            st.setString(5,Auth);
            st.setInt(6,rate);
            st.setString(7,review);
            
            ResultSet rs = st.executeQuery();
           
          
        
           }
           ResultSet rs_bookname = statement.executeQuery("select book_name from book where book_id = "+id);
           String m = "marked a book";
           if(rs_bookname.next()){
           m = "marked "+ rs_bookname.getString("book_name")+" as "+selectedItem;
           }
           String history= "insert into history (user_name,event_name,event_time)values('"+user+"','"+m+"',localtimestamp)";
           statement.executeUpdate(history);
           
            String sql2 = "select book_id,email,status,book_name,author_name from bookshelf"
                    + " where email='"
                    +(String)session.getAttribute("username")+"' order by book_id";
            PreparedStatement st2 = con.prepareStatement(sql2); 
            ResultSet rs5 = st2.executeQuery();
             System.out.println("Here stopped");
           session=request.getSession(true);
            session.setAttribute("rs5", rs5);
            
         
    
        // PreparedStatement st3 = con.prepareStatement(sql3); 
        //    ResultSet rs3= st3.executeQuery();
            
        /*     String sql4 = "select book_id,book_name,author_name from book where book_id="
                    +i;
             PreparedStatement st4 = con.prepareStatement(sql4); 
            ResultSet rs4= st4.executeQuery();
             System.out.println("Here stopped");*/
           //session.setAttribute("rs3", rs3);
           // session.setAttribute("rs4", rs4);
           
       }catch (Exception e) {

        }
      
       response.sendRedirect("bookShelf.jsp");
        
    }
       
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        out.println("ok");
       
     
     
        out.println("here");
  
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
              HttpSession session=request.getSession();
            String user=(String)session.getAttribute("username");
            System.out.println("user="+user);
            String sql7 = "select book_id,status,email,book_name,author_name from bookshelf where status is not null and email='"+(String)session.getAttribute("username")+
                    "'";
        
            PreparedStatement st7 = con.prepareStatement(sql7); 
            ResultSet rs5 = st7.executeQuery();

      
             System.out.println("Here stopped");
           session=request.getSession(true);
            session.setAttribute("rs5", rs5);
            
  //#19C160
       }catch (Exception e) {

        }
      
       response.sendRedirect("bookShelf.jsp");
        
    }
    }

    
    


