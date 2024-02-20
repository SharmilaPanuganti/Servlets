package cgg.tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.util.Date;

public class MyTagHandler extends TagSupport {

  @Override
  public int doStartTag() throws JspException {
    try {
      //task tag
      JspWriter out = pageContext.getOut();
      out.print("<h2>Custom tags</h2>");
      out.println("<p>This is custom para</p>");
      out.println(new Date());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return SKIP_BODY;
  }
}
