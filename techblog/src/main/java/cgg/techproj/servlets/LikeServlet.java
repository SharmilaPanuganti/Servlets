package cgg.techproj.servlets;

import cgg.techproj.dao.LikeDao;
import cgg.techproj.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/LikeServlet")
public class LikeServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String op = req.getParameter("operation");
    int pid = Integer.parseInt(req.getParameter("pid"));
    int uid = Integer.parseInt(req.getParameter("uid"));
    if (op.equals("Like")) {
      LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
      boolean res = likeDao.insertLike(pid, uid);
      if (res) {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.println(res);
      } else {
        PrintWriter writer = resp.getWriter();
        writer.println("err");
      }
    }
    if (op.equals("disLike")) {
      LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
      boolean res = likeDao.deleteLike(pid, uid);
      if (res) {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.println("Removed like");
      } else {
        PrintWriter writer = resp.getWriter();
        writer.println("err");
      }
    }
  }
}
