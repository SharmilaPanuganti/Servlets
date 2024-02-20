<%@taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>JSTL tags</title>
        </head>

        <body>
            <!-- out tag -->
            <!-- set tag -->
            <c:set var="x" value="25" scope="application"></c:set>
            <c:out value="${x}"></c:out>

            <!-- remove tag -->
            <!-- <c:remove var="x"></c:remove> -->
            <c:set var="x" value="24" scope="application"></c:set>
            <h1>
                <c:out value="${x}">default</c:out>
            </h1>


            <!-- if tag -->
            <c:if test="${x==25}">
                <h2>Condition is true</h2>
            </c:if>

            <!-- choose when otherwise=>switch -->

            <c:choose>
                <c:when test="${x>0}">
                    <h3>Number is positive</h3>

                </c:when>
                <c:when test="${x<0}">
                    <h3>Number is negative</h3>
                </c:when>
                <c:otherwise>
                    <h3>It is zero</h3>
                </c:otherwise>
            </c:choose>

            <!-- loops:foreach -->
            <!-- collections: items attribute -->
            <c:forEach var="j" begin="1" end="10">
                <h3>Value: <c:out value="${j}"></c:out>
                </h3>
            </c:forEach>

            <!-- redirect tag -->

            <c:url var="myurl" value="https://www.google.com/search">
                <c:param name="q" value="Center for good governance"></c:param>
            </c:url>
            <c:out value="${myurl}"></c:out>
            <c:redirect url="${myurl}"></c:redirect>


        </body>

        </html>