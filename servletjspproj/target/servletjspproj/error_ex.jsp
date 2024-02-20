<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    />
    <title>Error occured</title>
  </head>
  <body>
    <div class="container text-center p-3">
      <img src="images/error.png" class="img-fluid h-25" />
      <h2 class="display-3">Sorry!Something went wrong</h2>
      <p><%=exception%></p>
      <a href="add.html" class="btn btn-outline-primary mt-3">Go back</a>
    </div>
  </body>
</html>
