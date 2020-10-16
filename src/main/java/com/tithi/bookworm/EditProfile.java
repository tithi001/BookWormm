/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class EditProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void uploadPic(int ID){
        
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name= (String) request.getParameter("username");
        String add= (String) request.getParameter("address");
        String age= (String) request.getParameter("age");
        String phone= (String) request.getParameter("phonenumber");
        try {
            HttpSession session=request.getSession(true);  
            String uname = (String)(session.getAttribute("username"));
            Class.forName("oracle.jdbc.driver.OracleDriver");

         Connection   con = DriverManager.getConnection(
                 "jdbc:oracle:thin:@localhost:1521:orcl", "IPM", "IPM_LAB");
           //String sql= "select b.book_id,b.book_name,b.release_date,b.author_name,b.description,i.img_name from book b, book_img i where b.book_id=i.book_id and b.book_id=" + id ;
           Statement statement = con.createStatement();
           ResultSet resultSet = statement.executeQuery("select * from profile where email = '"+uname+"'");
           if(resultSet.next()){
               System.out.println("update profile set username = "+name+", address = '"+add+"', "
                       + "phone_number = "+phone+", age = "+age+" where EMAIL = '"+uname+"'");
               statement.executeUpdate("update profile set username = '"+name+"', address = '"+add+"', "
                       + "phone_number = '"+phone+"', age = "+age+" where EMAIL = '"+uname+"'");
           }
           else{
                statement.executeUpdate("insert into profile(username, address, phone_number, "
                       + "age, email) values ('"+name+"', '"+add+"', '"+
                       phone+"', "+age+", '"+uname+"')");
                
           }
           
            response.sendRedirect("UserProfile.jsp");   
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
        try {
            HttpSession session=request.getSession(true);
            String uname = (String)(session.getAttribute("username"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection   con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl", "IPM", "IPM_LAB");
            Statement statementID = con.createStatement();
            Statement statement = con.createStatement();
            ResultSet resultSetID = statementID.executeQuery("select * from profile where email = '"+uname+"'");
            
            File file ;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = this.getServletContext();
            String filePath = context.getInitParameter("file-upload");

            // Verify the content type
            String contentType = request.getContentType();

            if ((contentType.indexOf("multipart/form-data") >= 0)) {
               DiskFileItemFactory factory = new DiskFileItemFactory();
               // maximum size that will be stored in memory
               factory.setSizeThreshold(maxMemSize);

               // Location to save data that is larger than maxMemSize.
               factory.setRepository(new File("e:\\temp"));

               // Create a new file upload handler
               ServletFileUpload upload = new ServletFileUpload(factory);

               // maximum file size to be uploaded.
               upload.setSizeMax( maxFileSize );

               try { 
                  // Parse the request to get file items.
                  List fileItems = upload.parseRequest(request);

                  // Process the uploaded file items
                  Iterator i = fileItems.iterator();
                  while ( i.hasNext () ) {
                     FileItem fi = (FileItem)i.next();
                     if ( !fi.isFormField () ) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        String ext = "'"+fileName.substring( fileName.lastIndexOf("."))+"'";
                        int id = 0;
                        if(resultSetID.next()){
                            id = resultSetID.getInt("user_id");}
                        else{
                            statement.executeUpdate("insert into profile(email, image_ext) values ('"+uname+"', "+ext+")");
                            ResultSet resultSet = statement.executeQuery("select * from profile where email = '"+uname+"'");
                            if(resultSet.next()){
                                id = resultSet.getInt("user_id");}
                        }
                        
                        // Write the file
                        if( fileName.lastIndexOf(".") >= 0 ) {
                           file = new File( filePath + id+
                           fileName.substring( fileName.lastIndexOf("."))) ;
                        } else {
                           file = new File( filePath + id+
                           fileName.substring(fileName.lastIndexOf(".")+1)) ;
                        }
                     }
                  }
               } catch(Exception ex) {
                  System.out.println(ex);
               }
            }
            response.sendRedirect("UserProfile.jsp"); 
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
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
