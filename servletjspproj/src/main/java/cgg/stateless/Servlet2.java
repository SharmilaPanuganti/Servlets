package cgg.stateless;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/servlet2")
public class Servlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String name = req.getParameter("name");
      // Cookie[] cookies = req.getCookies();
      // boolean f=false;
      resp.setContentType("text/html");
      PrintWriter writer = resp.getWriter();
      // if (cookies==null) {
      //  writer.println("you are a new user go back");
      // } else {
      //   for (Cookie cookie : cookies) {
      //    String tName=cookie.getName();
      //    if(tName.equalsIgnoreCase("user_name")){
      //     f=true;
      //     name=cookie.getValue();
      //    }
         
      //   }
      // }
      // if (f) {
      //   writer.println("<h2> Hello again "+ name+"</h2>");
      // writer.println("<h2>Thanks</h2>");
      // }
      // else{
      //   writer.println("you are a new user go back");
      // }
      writer.println("<h2>Hello there! "+name+"</h2>");
      
      writer.close();
    }
    
}
