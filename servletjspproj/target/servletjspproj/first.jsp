<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>First JSP</title>
</head>
<body style="background-color: bisque;">
    <h1>First JSP</h1>
    <%!
    int a=10;
    int b=79;
    String name="Sharmi";
    public int doSum(){
        return a+b;
    }
    public String revName(){
        StringBuffer sb=new StringBuffer(name);
        return sb.reverse().toString();
    }
    %>
    <%
    out.println(a+"  "+b+"<br>");
    out.println("sum= "+doSum()+"<br>");
    out.println("Reverse= "+revName()+"<br>");
    %>
    <h1>Sum : <%=doSum()%></h1>
    <h1>a: <%=a%></h1>
</body>
</html>