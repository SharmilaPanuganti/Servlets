<%@ page isErrorPage="true" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
      .primary-background {
        background: #2962ff;
      }
    </style>
    <title>Error!</title>
  </head>

  <body>
    <div class="container text-center">
      <img src="images/error_img.png" alt="img not found" class="img-fluid" />
      <h2 class="display-3">Sorry! something went wrong</h2>
      <p>
        <%= exception%>
      </p>
      <a href="index.jsp" class="btn primary-background text-white">Home page</a>
    </div>
  </body>

  </html>