package cgg.stateless;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/servlet1")
public class Servlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("user_name");
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        // Cookie cookie=new Cookie("user_name", name);
        // resp.addCookie(cookie);
        writer.println("<h2>Hello," + name + " Welcome to CGG");
        // writer.println("<h3><a href='servlet2?name=" +name+"'>go to
        // servlet2</a></h3>");
        writer.println("<form action='servlet2'><input type='text' name='name' value='" + name
                + "' hidden><button type='submit'>go</button></form>");
        writer.close();
    }

}
