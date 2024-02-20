package cgg.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class FirstServlet implements Servlet{
    private ServletConfig config;


    @Override
    public void destroy() {
        System.out.println("Object is getting destroyed");
         }

    @Override
    public ServletConfig getServletConfig() {
        return config;
        }

    @Override
    public String getServletInfo() {
        return "This servlet  author:Sharmila";
         }

    @Override
    public void init(ServletConfig config) throws ServletException {
                 this.config=config;
                 System.out.println("creating object........");
       }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
    System.out.println("servicing...........");   
    res.setContentType("text/html");
    PrintWriter out = res.getWriter();
    out.println("<h1>First Servlet</h1>");
    out.println("<h3>Date :"+new Date()+"</h3>");
    out.close();
    }
    
}
