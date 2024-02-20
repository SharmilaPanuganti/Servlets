<%@ page import="cgg.techproj.entities.Message" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="css/style.css" rel="stylesheet" />
    <style>
      .banner-background {
        clip-path: polygon(0% 0%,
            100% 0%,
            100% 82%,
            87% 81%,
            75% 100%,
            24% 89%,
            0 100%);
      }

      .primary-background {
        background: #2962ff;
      }
    </style>
    <title>Login</title>
  </head>

  <body>
    <%@include file="navbar.jsp" %>
      <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
        <div class="container">
          <div class="row">
            <div class="col-md-4 offset-md-4">
              <div class="card">
                <div class="card-header text-center primary-background text-white">
                  <span class="fa fa-user-plus fa-3x"></span>
                  <p>Login Here</p>
                </div>
                <% Message msg=(Message)session.getAttribute("msg"); if(msg!=null){%>
                  <div class="alert <%=msg.getCssClass()%>" role="alert">
                    <%= msg.getContent()%>
                  </div>
                  <% session.removeAttribute("msg"); }%>
                    <div class="card-body">
                      <form action="login" method="post">
                        <div class="form-group">
                          <label for="exampleInputEmail1" class="form-label ">Email address</label>
                          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                            name="email" />
                          <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                            anyone
                            else.</small>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputPassword1" class="form-label ">Password</label>
                          <input type="password" class="form-control" id="exampleInputPassword1" name="password" />
                        </div>
                        <div class="container text-center">
                          <button type="submit" class="btn btn-primary mt-1">
                            Submit
                          </button>
                        </div>
                      </form>
                    </div>
              </div>
            </div>
          </div>
        </div>
      </main>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
  </body>

  </html>