package cgg.techproj.filters;

import cgg.techproj.entities.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = { "/profile.jsp", "/show_blog_post.jsp" })
public class MyFilter implements Filter {

  @Override
  public void doFilter(
    ServletRequest request,
    ServletResponse response,
    FilterChain chain
  ) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;

    HttpSession session = req.getSession();
    User user = (User) session.getAttribute("user");
    if (user != null) {
      chain.doFilter(request, response);
    } else {
      HttpServletResponse resp = (HttpServletResponse) response;
      resp.sendRedirect("login.jsp");
    }
  }
}
