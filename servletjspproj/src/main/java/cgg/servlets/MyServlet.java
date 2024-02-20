package cgg.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("Get request httpservlet!");  
      resp.setContentType("text/html");
      PrintWriter out = resp.getWriter(); 
      out.println("<h2>HTTP Servlet get request</h2>");
      out.close();   
    }

    
}
