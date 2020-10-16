
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NUSRAT
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String oldPass=request.getParameter("old_pass");
    String newPass=request.getParameter("new_pass");
    String confirmPass=request.getParameter("confirm_pass");
    LoginD id=new LoginD();
    HttpSession session=request.getSession(true);
String uname=(String)session.getAttribute("username");
        
if (id.check(uname,oldPass)){
   
    if(newPass.equals(confirmPass)){
        
    id.changePass(newPass,uname);
 
    }
    else{
    request.setAttribute("changePass","mismatch");
    RequestDispatcher rd=request.getRequestDispatcher("changePassword.jsp");
rd.forward(request, response);
}
    PrintWriter out=response.getWriter();
    out.println("password has been changed successfully");
    session.setAttribute("oldPassword","changed");
      RequestDispatcher rd=request.getRequestDispatcher("changePassword.jsp");
rd.forward(request, response);
    
}
else{
    request.setAttribute("oldPass","wrong");
    RequestDispatcher rd=request.getRequestDispatcher("changePassword.jsp");
rd.forward(request, response);
}
        }
    

    
}
