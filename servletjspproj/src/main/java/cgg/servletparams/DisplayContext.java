package cgg.servletparams;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/discontext")
public class DisplayContext extends GenericServlet {
    private ServletContext ctx;

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter writer = res.getWriter();
        int count = Integer.parseInt(ctx.getInitParameter("count"));
        String name = ctx.getInitParameter("name");
        writer.println("<h2>Count : " + count + "</h2>");
        writer.println("<h2>Name : " + name + "</h2>");
        writer.close();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.ctx = config.getServletContext();
    }

}
