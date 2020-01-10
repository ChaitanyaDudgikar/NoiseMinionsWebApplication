<%-- 
    Document   : login
    Created on : 29 Aug, 2019, 9:38:58 AM
    Author     : arnav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form:form commandName="loginform">
            Username <form:input path="username" /> <br/>
            Password <form:password path="password" /> <br/>
            <input type="submit">
        </form:form>
        ${message}
    </body>
</html>
