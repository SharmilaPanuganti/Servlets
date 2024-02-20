<%@page isELIgnored="false"%> <%@taglib prefix="c" uri="jakarta.tags.core"%> <%@
page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JSTL tag lib</title>
  </head>
  <body>
    <h1>JSP tag lib directive</h1>
    <hr />
    <c:set var="name" value="CGG"></c:set>
    <c:out value="${name}"> </c:out>
    <c:if test="${3<2}">
      <h3>this is true</h3>
    </c:if>
    <%! int n1=5; int n2=1;String name=null; %> <% int divi=n1/n2; %>
    <%=divi%><%=name.length() %>
  </body>
</html>
