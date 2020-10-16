/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EditMail", urlPatterns = {"/EditMail"})
public class EditMail extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String editMail=request.getParameter("editMail");
       HttpSession session=request.getSession(true);
String uname=(String)session.getAttribute("username");
        System.out.println(uname);
    LoginD id=new LoginD();
    id.EditMail(editMail,uname);
    session.removeAttribute("username");

  
    session.setAttribute("username",editMail);
    session.setAttribute("mail", "changed");
   response.sendRedirect("editMail.jsp");
    }

   
}
