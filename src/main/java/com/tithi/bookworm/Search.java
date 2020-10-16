/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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
 * @author User
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {
    private Connection con;
    private ResultSet results;

    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "IPM";
    String password = "IPM_LAB";
    String genre = "";
    String img_name,author,desc;
    Date date;
    String book_name;
    DataBaseConnection db = new DataBaseConnection();
    
    int id;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!request.getParameter("title").equals("")) {
            System.out.println(request.getParameter("title"));
          
            String selectedItem = request.getParameter("searchType");
            System.out.println(selectedItem);
            if (selectedItem.equals("Author")) {
                String authorName = request.getParameter("title");
                System.out.println(authorName);

              
       try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
            String sql = "select book_id,book_name,release_date,author_name,description"
                    + " from book where"
                    + " Upper(author_name) like '%" + authorName.toUpperCase() + "%' order by book_id";
            
            PreparedStatement st1 = con.prepareStatement(sql); 
            ResultSet rs1 = st1.executeQuery();
          
           
            HttpSession session=request.getSession(true);
            session.setAttribute("rs1", rs1);
            System.out.println("read is accessed!!!!!!!!!!!!");
       
       }catch (Exception e) {

        }
      
         response.sendRedirect("read.jsp");
        
    }
               

             
         if (selectedItem.equals("Genre")) {
                String genreName = request.getParameter("title");
                System.out.println(genreName);

               try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
            String sql = "select b.book_id,b.book_name,b.release_date,b.author_name,b.description"
                    + " from book b,genre g,book_genre bg where b.book_id=bg.book_id and g.genre_id=bg.genre_id and"
                    + " Upper(g.genre_name) like '%" + genreName.toUpperCase() + "%' order by b.book_id";
           
            PreparedStatement st1 = con.prepareStatement(sql);
            ResultSet rs1 = st1.executeQuery();
           
            HttpSession session=request.getSession(true);
            session.setAttribute("rs1", rs1);
           
            System.out.println("read is accessed!!!!!!!!!!!!");
       
       }catch (Exception e) {

        }
      
         response.sendRedirect("read.jsp");
        
    }

        
            if (selectedItem.equals("Title")) {
                String bookName = request.getParameter("title");
                System.out.println(bookName);
                
                
               try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
            String sql = "select book_id,book_name,release_date,author_name,description"
                    + " from book where"
                    + " Upper(book_name) like '%" + bookName.toUpperCase() + "%' order by book_id";
           
            PreparedStatement st1 = con.prepareStatement(sql);
            ResultSet rs1 = st1.executeQuery();
           
            HttpSession session=request.getSession(true);
            session.setAttribute("rs1", rs1);
           
            System.out.println("read is accessed!!!!!!!!!!!!");
       
       }catch (Exception e) {

        }

               
            response.sendRedirect("read.jsp");

          } 
        if (selectedItem.equals("All")) {
               String all = request.getParameter("title");
               System.out.println(all);
               
                try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
            String sql = "select b.book_id,b.book_name,b.release_date,b.author_name,b.description"
                    + " from book b,genre g,book_genre bg where b.book_id=bg.book_id and g.genre_id=bg.genre_id and"
                    + " (Upper(b.book_name) like '%" + all.toUpperCase() + "%' or Upper(b.author_name) like '%" + all.toUpperCase() + "%'"
                    + " or Upper(g.genre_name) like '%" + all.toUpperCase() + "%') order by b.book_id";
                    System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> "+sql);
            PreparedStatement st1 = con.prepareStatement(sql);
            ResultSet rs1 = st1.executeQuery();
           
            HttpSession session=request.getSession(true);
            session.setAttribute("rs1", rs1);
           
            System.out.println("read is accessed!!!!!!!!!!!!");
       
       }catch (Exception e) {

        }

 
               response.sendRedirect("read.jsp");
              
           }
        } else {

            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Search bar cannot be empty. Please enter a value.');");
            pw.println("</script>");
           // RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
            //rd.include(request, response);

        }
    }
}

