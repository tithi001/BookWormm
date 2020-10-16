package com.tithi.bookworm;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SWO SIRAJ
 */
@WebServlet(urlPatterns = {"/bookPage_1"})
public class bookPage_1 extends HttpServlet {

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
            out.println("<title>Servlet bookPage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookPage at " + request.getContextPath() + "</h1>");
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
        
        PrintWriter out=response.getWriter();
        //HttpSession session=request.getSession(true);
       // int id=Integer.parseInt((String)session.getAttribute("bId"));
        int id=Integer.parseInt(request.getParameter("bId"));
        
        
        out.println(id);
        out.println("Here1");
        try {
      // create the Oracle DataSource and set the URL
       Class.forName("oracle.jdbc.driver.OracleDriver");

         Connection   con = DriverManager.getConnection(
                 "jdbc:oracle:thin:@localhost:1521:orcl", "IPM", "IPM_LAB"); //change "oracle" to "orcl" depening on sid

       String sql= "select * from book where book_id=" + id ;
      // create the statement and execute the query
      PreparedStatement stmt =  con.prepareStatement(sql);
         
             ResultSet rset = stmt.executeQuery();
           HttpSession session=request.getSession(true);  
             session.setAttribute("id", id);
             String uname = (String)(session.getAttribute("username"));
             session.setAttribute("rset",rset); 
       Statement statement = con.createStatement();
       ResultSet resultSet = statement.executeQuery("select * from bookshelf where BOOK_ID = "+id+" and email = '"+uname+"'");
       int prev_rate = 0;
       String prev_review = "";
       String prev_status = "";
       if(resultSet.next()){
               prev_rate = resultSet.getInt("RATE");
               prev_review = resultSet.getString("REVIEW");
               prev_status=resultSet.getString("status");
           }
       session.setAttribute("prev_rate", ""+prev_rate);
       session.setAttribute("prev_review", prev_review);
       session.setAttribute("prev_status", prev_status);
       
       Statement st_genre = con.createStatement();
       ResultSet rs_genre = st_genre.executeQuery("select bg.genre_id, g.genre_name "
               + "from book_genre bg, genre g where bg.book_id = "+id+" and bg.genre_id = g.genre_id");
       String genre = "";
       while(rs_genre.next()){
           genre = genre+ ", "+rs_genre.getString("GENRE_NAME");
       }
       if(!genre.equals("")) genre = genre.substring(2);
       ResultSet rs_OtherComments = st_genre.executeQuery("select email, rate, review from bookshelf where book_id = "+id);
       ArrayList<String> AllComments = new ArrayList<>();
       while(rs_OtherComments.next()){
           AllComments.add(rs_OtherComments.getString("EMAIL")+";"
                   +rs_OtherComments.getInt("RATE")+";"+rs_OtherComments.getString("REVIEW"));
           
       }
       session.setAttribute("AllComments", AllComments);
ArrayList ar = new ArrayList();
         
 
  if(rset.next())
            {
                // ar.add(rset.getInt("BOOK_ID"));
              // ar.add("<td> <img class="sideByside" src="rset.getString("book_id")%>.jpg" height="120" width="110" "><br><br>");


 
             ar.add("<br><br><font size = 5 color=#564A3D>"+rset.getString("BOOK_NAME")+ "</font><hr>");
              ar.add("<font size = 3 color=#564A3D>By  " +rset.getString("AUTHOR_NAME")+"</font><br>");
                 ar.add("<br><br><font size = 3 color=#564A3D>Published in : "+rset.getString("RELEASE_DATE")+"</font><br>");
                 ar.add("<font size = 3 color=#564A3D>Genre :"+genre+"</font><br>");
             ar.add("<br><br><br><br><br><br><font size = 3 color=#564A3D>"+rset.getString("DESCRIPTION")+ "</font><br>");
             
             session.setAttribute("ar",ar); 

                // session.setAttribute("list",list);
               
            } 
   
       
      // print out the results
      
    } catch (SQLException e) {
      System.out.println(e.getMessage());
    }        catch (ClassNotFoundException ex) {
                 
             }
 response.sendRedirect("bookpage.jsp");   
    
     //RequestDispatcher rd=getServletContext().getRequestDispatcher("/bookpage.jsp");
               // rd.forward(request,response);
        
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
         PrintWriter out=response.getWriter();
        //HttpSession session=request.getSession(true);
       // int id=Integer.parseInt((String)session.getAttribute("bId"));
        int id=Integer.parseInt(request.getParameter("bId"));
        
        
        out.println(id);
        out.println("Here2");
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
