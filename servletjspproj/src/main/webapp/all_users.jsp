<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
        <%@taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ page isELIgnored="false" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                        crossorigin="anonymous">

                    <title>Users</title>
                </head>

                <body>
                    <h2>Users list</h2>
                    <sql:setDataSource driver="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/techblog"
                        user="postgres" password="Cgg@2023" var="conn"></sql:setDataSource>
                    <sql:query dataSource="${conn}" var="rs">select * from user1</sql:query>
                    <div class="container">
                        <table class="table">
                            <tr>
                                <td>User Id</td>
                                <td>User Name</td>
                                <td>User Email</td>
                            </tr>
                            <c:forEach items="${rs.rows}" var="row">
                                <tr>
                                    <td>
                                        <c:out value="${row.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${row.name}" />
                                    </td>
                                    <td>
                                        <c:out value="${row.email}" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </body>

                </html>