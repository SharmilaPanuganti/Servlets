<%@ page errorPage="error_page.jsp" %>
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
        clip-path: inset(0 10% 0 10% round 5% 20% 0 10%);

      }

      .primary-background {
        background: #0e47e4;
      }
    </style>
    <title>Register</title>
  </head>

  <body>
    <%@include file="navbar.jsp" %>
      <main style="padding-bottom: 50px;" class="banner-background primary-background">
        <div class="container ">
          <div class="row">
            <div class="col-md-6 offset-md-3">
              <div class="card">
                <div class="card-header text-center text-white primary-background">
                  <span class="fa fa-user-circle fa-3x"></span>
                  <h4>Register Here</h4>
                </div>
                <div class="card-body">
                  <form action="register" method="post" id="reg_form">
                    <div class="form-group">
                      <label for="user_name" class="form-label ">User Name</label>
                      <input type="text" class="form-control" id="user_name" name="user_name" />

                    </div>
                    <label for="exampleInputEmail1" class="form-label ">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" name="email"
                      aria-describedby="emailHelp" />
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                      else.</small>

                    <div class="form-group">
                      <label for="exampleInputPassword1" class="form-label ">Password</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" name="password" />
                    </div>
                    <div class="form-group">
                      <label for="gender" class="form-label ">Gender</label> &nbsp;
                      <input type="radio" name="gender" value="male">Male
                      <input type="radio" name="gender" value="female">Female
                    </div>
                    <div class="mb-3">
                      <textarea name="about" placeholder="something about you" rows="5"
                        class="form-control "></textarea>

                    </div>
                    <div class="form-group form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" />

                      <label class="form-check-label" for="exampleCheck1">I agree to terms and conditions</label>
                    </div>
                    <div class="text-center container " style="display: none;" id="loader">
                      <span class="fa fa-refresh fa-spin fa-3x"></span>
                      <p>Please wait..</p>
                    </div>
                    <div class="text-center">
                      <button type="submit" class="btn btn-primary" id="submitted">Submit</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
      </main>

      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
        integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script>
        $(document).ready(function () {
          console.log('Loaded')
          $('#reg_form').on('submit', function (event) {
            event.preventDefault();
            let formData = new FormData(this)
            console.log(formData);
            $('#loader').show();
            $('#submitted').hide();

            $.ajax({
              url: 'register',
              type: "POST",
              data: formData,
              success: function (data, textStatus, jqXHR) {
                console.log(data);
                $('#loader').hide();
                $('#submitted').show();
                if (data.trim() === 'done') {
                  swal("Registered successful.....redirecting to login page").then(value => {
                    window.location = 'login.jsp'
                  })
                }
                else {
                  swal(data)
                }
              },
              error: function (jqXHR, textStatus, error) {
                console.log(jqXHR);
                $('#loader').hide();
                $('#submitted').show();
                swal('Something went wrong try again')
              },
              contentType: false,
              processData: false
            })
          })
        })
      </script>
  </body>

  </html>