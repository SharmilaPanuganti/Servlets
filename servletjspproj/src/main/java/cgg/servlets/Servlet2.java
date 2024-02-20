package cgg.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/s2")
public class Servlet2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int n1 = Integer.parseInt(req.getParameter("n1"));
       int n2 = Integer.parseInt(req.getParameter("n2"));
       int sum = (int) req.getAttribute("s");
       int p=n1*n2;
       resp.setContentType("text/html");
       PrintWriter writer = resp.getWriter();
       writer.println("<h2>Sum:     "+sum+"</h2>");
       writer.println("<h2>Product: "+p+"</h2>");
    }
    
}
