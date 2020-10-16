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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rodela
 */
public class Shelf extends HttpServlet {

    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "IPM";
    String password = "IPM_LAB";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Shelf</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Shelf at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String shelf = request.getParameter("r");
        System.out.println("shelf value is" + shelf);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url, username, password);
            HttpSession session = request.getSession();
            String user = (String) session.getAttribute("username");
            System.out.println("user=" + user);

            String sql = "select book_id,email,status,book_name,author_name from bookshelf"
                    + " where email='"
                    + (String) session.getAttribute("username") + "'and status='"
                    + shelf + "' order by book_id";

            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs2 = st.executeQuery();
            session = request.getSession(true);
            session.setAttribute("rs2", rs2);
            session.setAttribute("shelf", shelf);

        } catch (Exception e) {

        }

        response.sendRedirect("Shelf.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
