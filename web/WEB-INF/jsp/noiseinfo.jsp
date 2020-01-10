<%-- 
    Document   : noiseinfo
    Created on : 28 Aug, 2019, 10:19:39 AM
    Author     : arnav
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Name: ${noise.decible}<br/>

        <table border="1" style="border-collapse: collapse">
            <tr>
                <th>Index</th>
                <th>Noise Level (dB)</th>
            </tr>
            <c:forEach items="${noise.decible}" var="n">
                <tr>
                    <td>${n.index} </td>
                    <td>${n.decibal} </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
