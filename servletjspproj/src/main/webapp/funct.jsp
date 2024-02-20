<%@taglib prefix="c" uri="jakarta.tags.core" %>
    <%@taglib prefix="fn" uri="jakarta.tags.functions" %>
        <%@ page isELIgnored="false" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>JSTL Function tags</title>
            </head>

            <body>
                <h3>Functional tags</h3>
                <c:set var="name" value="Sharmila" />
                <h2>
                    <c:out value="${name}" />
                </h2>
                <h3>Length is:
                    <c:out value="${fn:length(name)}" />
                </h3>
                <h3>
                    <c:out value="${fn:toLowerCase(name)}" />
                </h3>
                <h3>
                    <c:out value="${fn:contains(name,'a')}" />
                </h3>

            </body>

            </html>