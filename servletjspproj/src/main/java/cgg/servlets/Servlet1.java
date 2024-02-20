package cgg.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/s1")
public class Servlet1 extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      int n1=Integer.parseInt(req.getParameter("n1"));
      int n2=Integer.parseInt(req.getParameter("n2"));
      int sum=n1+n2;
      req.setAttribute("s", sum);
      RequestDispatcher reqDisp = req.getRequestDispatcher("/s2");
      reqDisp.forward(req, resp);

    }
    
}
