package cgg.techproj.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import cgg.techproj.dao.UserDao;
import cgg.techproj.entities.User;
import cgg.techproj.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String check = req.getParameter("check");
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        if (check == null) {

            writer.println("Please check the box");
            writer.close();
        } else {
            String name = req.getParameter("user_name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String gender = req.getParameter("gender");
            String about = req.getParameter("about");
            User user = new User(name, email, password, gender, about);
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            if (userDao.saveUser(user)) {
                writer.println("done");
            } else {
                writer.println("error");
            }

        }
    }

}
