<%@ page errorPage="error_ex.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Operation</title>
  </head>
  <body>
    <% int n1=Integer.parseInt(request.getParameter("n1")); int
    n2=Integer.parseInt(request.getParameter("n2")); int res=n1/n2; %>
    <h2>Result: <%= res%></h2>
  </body>
</html>
