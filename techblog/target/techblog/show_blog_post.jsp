<%@ page errorPage="error_page.jsp" %>
    <%@ page import="cgg.techproj.entities.*" %>
        <%@ page import="cgg.techproj.dao.*,java.text.DateFormat" %>
            <%@ page import="cgg.techproj.helper.ConnectionProvider" %>
                <% int post_id=Integer.parseInt(request.getParameter("post_id")); PostDao pd=new
                    PostDao(ConnectionProvider.getConnection()); Post p=pd.getPostById(post_id); User
                    user=(User)session.getAttribute("user"); %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>`
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                            crossorigin="anonymous" />
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
                        <link href="css/style.css" rel="stylesheet" />
                        <script src="js/myscript.js"></script>
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

                            .post-title {
                                font-weight: 100;
                                font-size: 30px;

                            }

                            .post-content {
                                font-weight: 100;
                                font-size: 25px;

                            }

                            .post-date {
                                font-style: italic;
                                font-weight: bold;

                            }

                            .row-user {
                                border: 1px #17181a;
                                padding: 15px;
                            }

                            body {
                                background: url(images/background.jpg);
                                background-size: cover;
                                background-attachment: fixed;
                            }
                        </style>
                        <title>
                            <%=p.getpTitle()%>
                        </title>
                    </head>

                    <body>
                        <div id="fb-root"></div>
                        <script async defer crossorigin="anonymous"
                            src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0"
                            nonce="VEK4QZwz"></script>
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
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                                            <a class="nav-link" href="#" data-bs-toggle="modal"
                                                data-bs-target="#add-post-modal"><span
                                                    class="fa fa-sticky-note-o"></span> Post</a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link" href="#">contact</a>
                                        </li>
                                    </ul>
                                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="modal" data-bs-target="#profileModal"
                                                href="#"><span class="fa fa-user-circle"></span>
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
                        <!-- main content -->
                        <main>
                            <div class="container ">
                                <div class="row my-3">
                                    <div class=" col-md-8 offset-md-2">
                                        <div class="card">
                                            <div class="card-header primary-background text-white">
                                                <h4 class="post-title">
                                                    <%=p.getpTitle()%>
                                                </h4>
                                            </div>


                                            <div class="card-body">
                                                <img src="blog-pics/<%= p.getpPic() %>" class="card-img-top my-2"
                                                    alt="img_not_found">
                                                <div class="row my-3 row-user">
                                                    <div class="col-md-8">
                                                        <%UserDao ud=new UserDao(ConnectionProvider.getConnection());
                                                            User puser=ud.getUserById(p.getUserId()); %>
                                                            <p class="post-user"><a href="#">
                                                                    <%=puser.getName()%>
                                                                </a> has posted</p>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p class="post-date">
                                                            <%=DateFormat.getDateTimeInstance().format(p.getpDate())%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <p class="post-content">
                                                    <%=p.getpContent()%>
                                                </p>
                                                <br>
                                                <br>
                                                <div class="post-code">
                                                    <pre><%=p.getpCode()%></pre>
                                                </div>
                                            </div>
                                            <div class="card-footer primary-background text-white ">
                                                <%LikeDao lk=new LikeDao(ConnectionProvider.getConnection()); String
                                                    likeBtnId="likeBtn_" + p.getPid(); String likeIconId="likeIcon_" +
                                                    p.getPid();%>
                                                    <a href="#!" class="btn btn-outline-light btn-sm"
                                                        onclick="doLike('<%=p.getPid()%>','<%=user.getId()%>')"
                                                        id="<%=likeBtnId%>"><i class="fa fa-thumbs-o-up"
                                                            id="<%=likeIconId%>"></i><span id="<%=p.getPid()%>">

                                                            <%=lk.countLikeOnPost(p.getPid())%>
                                                        </span>
                                                    </a>


                                                    <a href="#!" class="btn btn-outline-light btn-sm"><i
                                                            class="fa fa-commenting-o"></i><span>12</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="fb-comments"
                                data-href="http://localhost:8080/techblog/show_blog_post.jsp?post_id=20" data-width=""
                                data-numposts="5"></div>
                        </main>
                        <!-- Profile modal -->
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
                                                alt="no image" class="mb-3 "
                                                style="border-radius: 50%;max-width: 100px;">
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
                                                        <td><input type="password" class="form-control"
                                                                name="user_password" value="<%=user.getPassword()%>" />
                                                        </td>
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
                                        <button type="button" class="btn btn-seconadary"
                                            data-dismiss="modal">Close</button>
                                        <button id="edit-profile-button" type="button"
                                            class="btn btn-primary">EDIT</button>
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

                    </body>

                    </html>