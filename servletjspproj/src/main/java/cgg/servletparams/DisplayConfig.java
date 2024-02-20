package cgg.servletparams;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/disconfig", initParams = { @WebInitParam(name = "count", value = "10"),
        @WebInitParam(name = "name", value = "sharmi") })
public class DisplayConfig extends GenericServlet {
    private int count;
    private String name;
    private ServletConfig config;

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter writer = res.getWriter();
        count = Integer.parseInt(config.getInitParameter("count"));
        writer.println("<h2>Count : " + this.count + "</h2>");
        writer.println("<h2>Name: " + this.name + "</h2>");
        writer.close();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
        this.name = config.getInitParameter("name");
    }

}
