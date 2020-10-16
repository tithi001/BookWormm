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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class Rate extends HttpServlet {

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
            out.println("<title>Servlet Rate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Rate at " + request.getContextPath() + "</h1>");
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
            
            String rev= (String) request.getParameter("comment");
        try {
            HttpSession session=request.getSession(true);  
            int id = (Integer)(session.getAttribute("id"));
            int rate = Integer.parseInt((String)request.getParameter("rateSave"));
            String uname = (String)(session.getAttribute("username"));
            System.out.println("id" + id);
            // String genre = "";
         Class.forName("oracle.jdbc.driver.OracleDriver");

         Connection   con = DriverManager.getConnection(
                 "jdbc:oracle:thin:@localhost:1521:orcl", "IPM", "IPM_LAB");
           //String sql= "select b.book_id,b.book_name,b.release_date,b.author_name,b.description,i.img_name from book b, book_img i where b.book_id=i.book_id and b.book_id=" + id ;
           Statement statement = con.createStatement();
           ResultSet resultSet = statement.executeQuery("select * from bookshelf where BOOK_ID = "+id+" and email = '"+uname+"'");
            System.out.println(id+ "     "+uname);
           if(resultSet.next()){
               statement.executeUpdate("update bookshelf set RATE = "+rate+", REVIEW = '"+rev+"' "
                       + "where BOOK_ID= "+id+" and EMAIL = '"+uname+"'");
           }
           else{
               ResultSet rs_book = statement.executeQuery("select * from book where book_id = "+id);
               rs_book.next();
               statement.executeUpdate("insert into bookshelf(BOOK_ID, EMAIL, BOOK_NAME, "
                       + "AUTHOR_NAME, RATE, REVIEW) values ("+id+", '"+uname+"', '"+
                       rs_book.getString("BOOK_NAME")+"', '"+rs_book.getString("AUTHOR_NAME")+
                       "', "+rate+", '"+rev+"')");
           }
           ResultSet rs_bookname = statement.executeQuery("select book_name from book where book_id = "+id);
           String m = "rated a book", m2 ="added a review" ;
           if(rs_bookname.next()){
           m = "rated "+ rs_bookname.getString("book_name")+" a "+rate;
           m2 = "added a review to "+ rs_bookname.getString("book_name");
           }
           String history= "insert into history (user_name,event_name,event_time)values('"+uname+"','"+m+"',localtimestamp)";
           statement.executeUpdate(history);
           history= "insert into history (user_name,event_name,event_time)values('"+uname+"','"+m2+"',localtimestamp)";
           statement.executeUpdate(history);
           RequestDispatcher rd=getServletContext().getRequestDispatcher("/bp");
                rd.forward(request,response);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
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
