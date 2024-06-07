<%-- 
    Document   : updateac
    Created on : Mar 18, 2024, 1:16:51 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <h1>Update a Account</h1>
    <c:set var="c" value="${requestScope.data}"/>
    <form action="updateac" method="post">
        Enter UID: <input type="number" readonly="readonly" name="uid" value="${c.uid}"/><br/>
        Enter User: <input type="text" name="user" value="${c.user}"/><br/>
        Enter Pass: <input type="text" name="pass" value="${c.pass}"/><br/>
        <input type="submit" value="Update"/><br/>
    </form>
    </body>
</html>
