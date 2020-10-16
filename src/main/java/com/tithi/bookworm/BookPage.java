/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tithi.bookworm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rodela
 */@WebServlet(name = "BookPage", urlPatterns = {"/BookPage"})
public class BookPage extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    
       
        
        
     

                RequestDispatcher dispatcher = request.getRequestDispatcher("BookPage.jsp");
                dispatcher.forward(request, response);
   
    }

}
