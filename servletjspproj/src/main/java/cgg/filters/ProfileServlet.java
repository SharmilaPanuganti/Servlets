package cgg.filters;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    System.out.println("Profile servlet");
    resp.setContentType("text/html");
    PrintWriter writer = resp.getWriter();
    writer.println("<h2>Profile servlet page</h2>");
    writer.println("<p>Welcome to your profile</p>");
    writer.close();
  }
}
