<%@ page language="java" contentType="text/html;charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %> <%@ page import="java.util.Random,java.util.sql.*"
%> <%@ page isErrorPage="true" %> <%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Directives</title>
  </head>
  <body>
    <%@ include file="Header.jsp"%>
    <h1><% Random r=new Random(); int n=r.nextInt(10); %> <%=n%></h1>
  </body>
</html>
