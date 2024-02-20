package cgg.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class SecondServlet extends GenericServlet{

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("servicing....");
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.println("<h2>Second servlet</h2>");
        out.close();
        }
    
}
