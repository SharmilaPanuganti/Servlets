package cgg.sessionservlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/profileservlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        HttpSession session = req.getSession(false);
        if (session != null) {
            String userid = (String) session.getAttribute("userid");
            writer.println("<h2>Welcome to servlet </h2>" + userid);
        } else {
            // resp.sendRedirect("login.html");
            RequestDispatcher rd = req.getRequestDispatcher("login.html");
            rd.include(req, resp);

        }
        writer.println("<a href='sessiondemo.html'>Back</a>");
    }

}
