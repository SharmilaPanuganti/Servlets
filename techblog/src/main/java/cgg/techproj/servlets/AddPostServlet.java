package cgg.techproj.servlets;

import cgg.techproj.dao.PostDao;
import cgg.techproj.entities.Post;
import cgg.techproj.entities.User;
import cgg.techproj.helper.ConnectionProvider;
import cgg.techproj.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(urlPatterns = "/addpostservlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String category = req.getParameter("p-category");
    String title = req.getParameter("p-title");
    String content = req.getParameter("p-content");
    String program = req.getParameter("p-program");
    Part part = req.getPart("p-pic");
    resp.setContentType("text/html");
    PrintWriter writer = resp.getWriter();
    HttpSession session = req.getSession();
    User user = (User) session.getAttribute("user");
    Post p = new Post(
      title,
      content,
      program,
      part.getSubmittedFileName(),
      new Date(),
      Integer.parseInt(category)
    );
    p.setUserId(user.getId());
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    if (postDao.savePost(p)) {
      String imagePath =
        req.getServletContext().getRealPath("/blog-pics/") +
        File.separator +
        part.getSubmittedFileName();
      Helper.saveFile(part.getInputStream(), imagePath);
      writer.println("done");
    } else {
      writer.println("error");
    }
  }
}
