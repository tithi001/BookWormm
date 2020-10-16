<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%
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
   ServletContext context = pageContext.getServletContext();
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
               String ext = fi.getContentType();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               int id = 0;
                if(resultSetID.next()){
                    id = resultSetID.getInt("user_id");}
                else{
                    statement.executeUpdate("insert into profile(email) values ('"+uname+"')");
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
               fi.write( file ) ;
               %>
               <script>
                   window.alert("Upload Successful").freeze();
                   <%request.getRequestDispatcher("UserProfile.jsp").forward(request, response);%>
                </script>
<%
               //response.sendRedirect("UserProfile.jsp"); 
               //request.getRequestDispatcher("test.jsp").forward(request, response);
               
            }
         }
         //response.sendRedirect("UserProfile.jsp"); 
         request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
       %>
               <script>
                   window.alert("Upload Failed");
                   
                </script>
<%
      response.sendRedirect("UserProfile.jsp"); 
   }
    
%>