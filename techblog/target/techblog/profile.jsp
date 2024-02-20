<%@ page import="cgg.techproj.entities.User" %>
  <%@ page import="cgg.techproj.dao.PostDao" %>
    <%@ page import="cgg.techproj.helper.ConnectionProvider" %>
      <%@ page import="cgg.techproj.entities.Category" %>
        <%@ page import="cgg.techproj.entities.Message" %>
          <%@ page import="java.util.ArrayList" %>
            <%@ page import="java.io.File" %>
              <%@ page errorPage="error_page.jsp" %>
                <% User user=(User)session.getAttribute("user"); String imageName=user.getProfile(); String
                  imagePath=request.getServletContext()+"/images" + File.separator + imageName; %>
                  <!-- //if(user==null){ response.sendRedirect("login.jsp"); } -->
                  <!DOCTYPE html>
                  <html lang="en">

                  <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                      rel="stylesheet"
                      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                      crossorigin="anonymous" />
                    <link rel="stylesheet"
                      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
                    <link href="css/style.css" rel="stylesheet" />
                    <script src="js/myscript.js"></script>
                    <style>
                      body {
                        background: url(images/background.jpg);
                        background-size: cover;
                        background-attachment: fixed;
                      }

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
                    <title>Profile</title>
                  </head>

                  <body>
                    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
                      <div class="container-fluid">
                        <a class="navbar-brand" href="index.jsp">Techblog</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                          aria-expanded="false" aria-label="Toggle navigation">
                          <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                              <a class="nav-link active" aria-current="page" href="profile.jsp">Home</a>
                            </li>

                            <li class="nav-item dropdown">
                              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Categories
                              </a>
                              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Programming languages</a></li>
                                <li><a class="dropdown-item" href="#">Project implementation</a></li>
                                <li>
                                  <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Tutorials</a></li>
                              </ul>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span
                                  class="fa fa-sticky-note-o"></span> Post</a>
                            </li>

                            <li class="nav-item">
                              <a class="nav-link" href="#">contact</a>
                            </li>
                          </ul>
                          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                              <a class="nav-link" data-bs-toggle="modal" data-bs-target="#profileModal" href="#"><span
                                  class="fa fa-user-circle"></span>
                                <%=user.getName()%>
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="logout"><span></span>Logout</a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </nav>
                    <% Message msg=(Message)session.getAttribute("msg"); if(msg!=null){%>
                      <div class="alert <%=msg.getCssClass()%>" role="alert">
                        <%= msg.getContent()%>
                      </div>
                      <% session.removeAttribute("msg"); }%>
                        <main>
                          <div class="container">
                            <div class="row mt-2">
                              <!-- categories -->
                              <div class="col-md-4">
                                <div class="list-group">
                                  <a href="#" onclick="getPost(0,this)"
                                    class="list-group-item list-group-item-action active  c-link" aria-current="true">
                                    All Posts
                                  </a>
                                  <% PostDao p=new PostDao(ConnectionProvider.getConnection()); ArrayList<Category>
                                    cat=p.getAllCategories();
                                    for(Category c:cat){
                                    %>
                                    <a href="#!" onclick="getPost('<%= c.getCid() %>',this)"
                                      class="list-group-item list-group-item-action c-link">
                                      <%=c.getName()%>
                                    </a>
                                    <% } %>


                                </div>
                              </div>
                              <!-- Posts -->
                              <div class="col-md-8">
                                <div class="container text-center" id="loader">
                                  <i class="fa fa-refresh fa-4x fa-spin"></i>
                                  <h3 class="mt-2">Loading...</h3>
                                </div>
                                <div class="container-fluid" id="post-container">

                                </div>
                              </div>
                            </div>
                          </div>
                        </main>
                        <!-- Modal -->
                        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
                          aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header primary-background text-white ">
                                <h5 class="modal-title fs-5" id="title">Provide the post detail.</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                  aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <form action="addpostservlet" method="post" enctype="multipart/form-data" id="myform">
                                  <table class="table table-borderless">
                                    <tbody>
                                      <tr>
                                        <td>
                                          <div class="form-group">
                                            <input type="text" placeholder="Enter your title" class="form-control "
                                              name="p-title" />
                                          </div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="form-group">
                                            <select class="form-control" name="p-category">
                                              <option selected disabled>--Select Category---</option>
                                              <% PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                                ArrayList<Category>
                                                list=postd.getAllCategories();
                                                for(Category c:list)
                                                {
                                                %>
                                                <option value="<%=c.getCid()%>">
                                                  <%=c.getName()%>
                                                </option>
                                                <% } %>

                                            </select>
                                          </div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="form-group">
                                            <textarea class="form-control" style="height:200px;"
                                              placeholder="Enter your content" name="p-content"></textarea>
                                          </div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="form-group">
                                            <textarea class="form-control" style="height:200px;"
                                              placeholder="Enter your program(if any)" name="p-program"></textarea>
                                          </div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="form-group">
                                            <label class="form-label ">Select your pic...</label>
                                            <br>
                                            <input type="file" class="form-control " name="p-pic" />
                                          </div>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>

                                  <div class="container text-center ">
                                    <button class=" btn btn-outline-primary ">Submit</button>
                                  </div>
                                </form>
                              </div>

                            </div>
                          </div>
                        </div>

                        <!--END add post modal -->
                        <!-- Button trigger modal -->


                        <!-- Modal -->
                        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                          aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header primary-background text-white">
                                <h1 class="modal-title fs-5 " id="exampleModalLabel">Tech blog</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                  aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <div class="container text-center">

                                  <img src="<%= request.getContextPath() %>/images/<%= user.getProfile() %>"
                                    alt="no image" class="mb-3 " style="border-radius: 50%;max-width: 100px;">
                                  <br>
                                  <%= user.getName()%>
                                </div>
                                <div id="profile-details">
                                  <table class="table">

                                    <tbody>
                                      <tr>
                                        <th scope="row">ID:</th>
                                        <td>
                                          <%=user.getId()%>
                                        </td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Email:</th>
                                        <td>
                                          <%=user.getEmail()%>
                                        </td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Gender:</th>
                                        <td>
                                          <%=user.getGender()%>
                                        </td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Status:</th>
                                        <td>
                                          <%=user.getAbout()%>
                                        </td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Registered on:</th>
                                        <td>
                                          <%=user.getrDate().toString()%>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </div>

                                <!--profile edit-->
                                <div id="profile-edit" style="display:none;">
                                  <h3 class="mt-2">Please Edit Carefully</h3>
                                  <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                      <tr>
                                        <td>ID:</td>
                                        <td>
                                          <%=user.getId()%>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>Email:</td>
                                        <td><input type="email" class="form-control" name="user_email"
                                            value="<%=user.getEmail()%>" />
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>Name:</td>
                                        <td><input type=" text" class="form-control" name="user_name"
                                            value="<%=user.getName()%>" />
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>Password:</td>
                                        <td><input type="password" class="form-control" name="user_password"
                                            value="<%=user.getPassword()%>" /></td>
                                      </tr>
                                      <tr>
                                        <td>Gender:</td>
                                        <td>
                                          <%=user.getGender().toUpperCase()%>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>About:</td>
                                        <td>
                                          <textarea rows=" 3" class="form-control"
                                            name="user_about"><%=user.getAbout()%></textarea>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>New Profile:</td>
                                        <td>
                                          <input type="file" name="image" class="form-control">
                                        </td>
                                      </tr>

                                    </table>
                                    <div class="container">
                                      <input type="submit" class="btn btn-outline-primary">
                                    </div>
                                  </form>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-seconadary" data-dismiss="modal">Close</button>
                                <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                          integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                          crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
                          integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
                          crossorigin="anonymous" referrerpolicy="no-referrer"></script>

                        <script>
                          $(document).ready(function () {
                            let editStatus = false;
                            $('#edit-profile-button').click(function () {
                              if (editStatus == false) {
                                $("#profile-details").hide()

                                $("#profile-edit").show();

                                editStatus = true;
                                $(this).text("Back")
                              } else {
                                $("#profile-details").show()

                                $("#profile-edit").hide();
                                editStatus = false;
                                $(this).text("Edit")
                              }

                            })
                          });
                        </script>
                        <script>
                          $(document).ready(function () {
                            $('#myform').on('submit', function (event) {
                              event.preventDefault();
                              let f = new FormData(this);
                              $.ajax(
                                {
                                  url: 'addpostservlet',
                                  type: 'POST',
                                  data: f,
                                  success: function (data, textStatus, JqueryXHR) {
                                    console.log(data);
                                    if (data.trim() == "done") {
                                      swal("Good job!", "Post Saved succesfully", "success");
                                    }
                                    else {
                                      swal("Error !!", "something went wrong.Try again", "error");
                                    }
                                  },
                                  error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(errorThrown);

                                    swal("Error !!", "something went wrong.Try again", "error");
                                  },
                                  processData: false,
                                  contentType: false
                                }
                              )
                            })
                          })
                        </script>
                        <!-- Posts -->
                        <script>
                          function getPost(cid, temp) {
                            $("#loader").show();
                            $("#post-container").hide();
                            $('.c-link').removeClass('active');
                            $.ajax({
                              url: "loadpost.jsp",
                              data: { catId: cid },
                              success: function (data, textStatus, jqXHR) {

                                $("#loader").hide()
                                $("#post-container").show()
                                $("#post-container").html(data)
                                $(temp).addClass('active')
                              },

                              contentType: false
                            })
                          }
                          $(document).ready(function () {
                            let postRef = $('.c-link')[0]
                            getPost(0, postRef);



                          })
                        </script>
                  </body>

                  </html>