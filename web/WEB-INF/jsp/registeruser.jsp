<%-- 
    Document   : registeruser
    Created on : 30 Sep, 2019, 10:38:20 AM
    Author     : arnav
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form:form commandName="registeruserform">
            Username <form:input path="username" /> <br/>
            Password <form:password path="password" /> <br/>
            Retype Password <form:password path="rpassword" /> <br/>
            Role <form:password path="role" /> <br/>
            <input type="submit">
        </form:form>
        
    </body>
</html>
