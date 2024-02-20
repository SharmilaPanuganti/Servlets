package cgg.techproj.servlets;

import cgg.techproj.dao.UserDao;
import cgg.techproj.entities.Message;
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
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    String userEmail = req.getParameter("user_email");
    String userNmae = req.getParameter("user_name");
    String userPassword = req.getParameter("user_password");
    String userAbout = req.getParameter("user_about");
    Part part = req.getPart("image");
    String imageName = part.getSubmittedFileName();

    PrintWriter out = resp.getWriter();
    //get the user from the session...
    HttpSession s = req.getSession();
    User user = (User) s.getAttribute("user");
    user.setEmail(userEmail);
    user.setName(userNmae);
    user.setPassword(userPassword);
    user.setAbout(userAbout);
    user.setProfile(imageName);
    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
    boolean ans = userDao.updateUser(user);
    if (ans) {
      String imagePath =
        req.getServletContext().getRealPath("/images/") +
        File.separator +
        imageName;

      // System.out.println(imagePath);
      String oldFile = user.getProfile();
      String pathOldFile =
        req.getServletContext().getRealPath("/images/") +
        File.separator +
        oldFile;
      if (!oldFile.equals("default.png")) {
        Helper.deleteFile(pathOldFile);
      }
      if (Helper.saveFile(part.getInputStream(), imagePath)) {
        out.println("updated to db");
        Message msg = new Message(
          "Profile updated....",
          "success",
          "alert-success"
        );
        s.setAttribute("msg", msg);
      } else {
        Message msg = new Message(
          "Something went wrong....",
          "error",
          "alert-danger"
        );
        s.setAttribute("msg", msg);
      }
    } else {
      Message msg = new Message(
        "Something went wrong....",
        "error",
        "alert-danger"
      );
      s.setAttribute("msg", msg);
    }
    resp.sendRedirect("profile.jsp");
  }
}
