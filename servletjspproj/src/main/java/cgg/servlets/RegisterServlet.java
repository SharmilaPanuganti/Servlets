package cgg.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String name=req.getParameter("user_name");
       String email = req.getParameter("email");
       String pwd = req.getParameter("pwd");
       String gender = req.getParameter("gender");
       String course = req.getParameter("courses");
       String condition = req.getParameter("condition");
       resp.setContentType("text/html");
       PrintWriter writer = resp.getWriter();
       if(condition!=null){
        if(condition.equals("checked")){
            writer.println("<h2>Name    :"+name+"</h2>");
            writer.println("<h2>Email   :"+email+"</h2>");
            writer.println("<h2>Password:"+pwd+"</h2>");
            writer.println("<h2>Gender  :"+gender+"</h2>");
            writer.println("<h2>Course  :"+course+"</h2>");
            RequestDispatcher reqDisp = req.getRequestDispatcher("/success");
            reqDisp.forward(req, resp);
        }
        else{
            writer.println("<h2>Please agree to terms and conditions</h2>");
        }
       }
       else{
            writer.println("<h2>Please agree to terms and conditions</h2>");
            RequestDispatcher regDisp=req.getRequestDispatcher("index.jsp");
            regDisp.include(req, resp);
        }
 
    }
    
}
