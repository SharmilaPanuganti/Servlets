package cgg.sessionservlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/loginservlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = req.getParameter("userid");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        if (userid.equalsIgnoreCase("admin")) {
            session.setAttribute("userid", userid);
            resp.sendRedirect("profileservlet");

        } else {
            resp.sendRedirect("login.html");
        }
    }

}
