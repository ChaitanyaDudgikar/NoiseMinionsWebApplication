<%-- 
    Document   : register
    Created on : 29 Aug, 2019, 10:06:46 AM
    Author     : arnav
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form:form commandName="registerform">
            Username <form:input path="username" /> <br/>
            Password <form:password path="password" /> <br/>
            Retype password <form:password path="retypedpassword" /> <br/>
            Role <form:password path="role" /> <br/>
            <input type="submit">
        </form:form>
            ${message1}
    </body>
</html>
