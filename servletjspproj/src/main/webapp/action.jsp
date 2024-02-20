<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Action</title>
</head>


<body>
    <h1>
        <%=request.getParameter("action")%>
    </h1>
    <jsp:include page="users">
        <jsp:param name="action" value="included" />
    </jsp:include>
    <h3>List of users included</h3>
    <jsp:useBean id="obj" class="cgg.servlets.BeanEx" />
    <% int m=obj.cube(5); out.print("cube of 5 is "+m);  
%>  
</body>

</html>