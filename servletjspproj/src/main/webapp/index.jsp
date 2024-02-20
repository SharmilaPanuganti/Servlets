<html>
    <head>
        <style>
            .container{
                width: 40%;
                border: 1px solid black;
                margin: auto;
                padding: 20px;
                font-size: 20px;
            }
            #my_form table tr td{
                font-size: 20px;
            }
        </style>
    </head>
<body>
<div class="container">
    <h2>My form</h2>
    <form action="RegisterServlet" method="post" id="my_form">
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="user_name" placeholder="Enter your name"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" placeholder="Enter your Email"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pwd" placeholder="Enter Password"></td>
            </tr>
            <tr>
                <td>Select Gender:</td>
                <td><input type="radio" name="gender" value="male">Male 
                    <td><input type="radio" name="gender" value="Female">Female </td>
                </td>
            </tr>
            <tr>
                <td>Select course</td>
                <td>
                <select name="courses">
                    <option value="java">Java</option>
                    <option value="python">python</option>
                    <option value="webdev">Web development</option>
                </select>
            </td>
            </tr>
            <tr>
                <td style="text-align: right;"><input type="checkbox" name="condition" value="checked"></td>
                <td>Agree to terms and conditions</td>
            </tr>
            <tr>
                <td><input type="submit"></td>
                <td><input type="reset"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
