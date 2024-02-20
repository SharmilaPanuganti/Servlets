package cgg.techproj.servlets;

import cgg.techproj.dao.UserDao;
import cgg.techproj.entities.Message;
import cgg.techproj.entities.User;
import cgg.techproj.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String email = req.getParameter("email");
    String pwd = req.getParameter("password");
    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
    resp.setContentType("text/html");
    // PrintWriter writer = resp.getWriter();
    try {
      User user = userDao.getUserByEmailandPwd(email, pwd);
      if (user == null) {
        //error
        // writer.println("<h2>Invalid credentials ! Try again</h2>");
        Message message = new Message(
          "Invalid credentials ! Try again",
          "error",
          "alert-danger"
        );
        HttpSession session = req.getSession();
        session.setAttribute("msg", message);
        resp.sendRedirect("login.jsp");
      } else {
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        resp.sendRedirect("profile.jsp");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
