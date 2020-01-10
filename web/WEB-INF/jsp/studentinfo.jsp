<%-- 
    Document   : studentinfo
    Created on : 28 Aug, 2019, 9:32:12 AM
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
        Name: ${student.name}<br/>
        Roll: ${student.rollno}<br/>

        Marks:
        <c:forEach items="${student.marks}" var="m">
            $<{m.subject} : ${m.marks} <br/>
        </c:forEach>
        Average : ${student.average}<br/>
        <c:if test="${student.average ge 40}">
            Passed
        </c:if>
        <c:if test="${student.average lt 40}">
            Failed
        </c:if>
         
    </body>
</html>
