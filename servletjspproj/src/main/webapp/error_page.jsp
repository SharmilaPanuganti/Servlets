<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error</title>
  </head>
  <body>
    <div
      style="background-color: rgb(249, 110, 110); color: white; padding: 5px"
    >
      <h3>Something went wrong</h3>
      <p><%=exception%></p>
    </div>
  </body>
</html>
