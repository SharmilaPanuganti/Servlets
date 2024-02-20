-----------profile edit-----------
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="css/style.css" rel="stylesheet" />

    <title>edit profile</title>
</head>

<body>
    <div id="profile-details">
        <table class="table">

            <tbody>
                <tr>
                    <th scope="row">ID:</th>
                    <td>
                        <%user.getId()%>
                    </td>

                </tr>
                <tr>
                    <th scope="row">Email:</th>
                    <td>
                        <%user.getEmail()%>
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
                        <%=user.getDateTime().toString()%>
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
                    <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type=" text" class="form-control" name="user_name" value="<%=user.getName()%>" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" class="form-control" name="user_password"
                            value="<%=user.getPassword()%>" /></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <%=user.getGender()%.toUpperCase()>
                    </td>
                </tr>
                <tr>
                    <td>About:</td>
                    <td>
                        <textarea rows=" 3" class="form-control" name="user_about">
                    <%=user.getAbout()%>
                        </textarea>
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
                <buttton type="submit" class="btn btn-outline-primary">Save</button>
            </div>
        </form>
    </div>
    </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-seconadary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
    </div>
    </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
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
                    editStaus = false;
                    $(this).text("Edit")
                }


            })
        });
    </script>
</body>

</html>