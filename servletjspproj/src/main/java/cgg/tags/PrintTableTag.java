package cgg.tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class PrintTableTag extends TagSupport {

  private int number;
  private String color;

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  @Override
  public int doStartTag() throws JspException {
    try {
      JspWriter out = pageContext.getOut();
      out.println();
      out.println("<div style='color:" + color + "'>");
      for (int i = 1; i <= 10; i++) {
        out.println(number + " * " + i + " = " + number * i + "<br>");
      }
      out.println("</div>");
    } catch (Exception e) {}
    return SKIP_BODY;
  }
}
