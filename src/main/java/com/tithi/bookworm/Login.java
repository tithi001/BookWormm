/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

/**
 *
 * @author NUSRAT
 */
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
     @Override
    protected void doPost (HttpServletRequest req,
                        HttpServletResponse resp)
                        throws ServletException, IOException {

        resp.setContentType("text/html");

        try {
            String idToken = req.getParameter("id_token");
            GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(idToken);
            String name = (String) payLoad.get("name");
            String email = payLoad.getEmail();
            String pass = "12345678";
            System.out.println("User name: " + name);
            System.out.println("User email: " + email);
            Class.forName("oracle.jdbc.driver.OracleDriver");

         Connection   con = DriverManager.getConnection(
                 "jdbc:oracle:thin:@localhost:1521:orcl", "IPM", "IPM_LAB");
            Statement statement = con.createStatement();
            ResultSet resultset = statement.executeQuery("select * from signup where email = '"+email+"'");
            if(!resultset.next()) new SignD().signup(email,pass);
            
            String sql= "insert into history (user_name,event_name,event_time)values('"+email+"','logged in',localtimestamp)";
            statement.executeUpdate(sql);
            HttpSession session = req.getSession(true);
            session.setAttribute("username", email);
            req.getServletContext()
              .getRequestDispatcher("/Home").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
