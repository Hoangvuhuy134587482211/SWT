<%-- 
    Document   : manageaccount
    Created on : Mar 18, 2024, 12:54:28 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1 {
                color: #ff6600; /* Orange color */
                text-align: center;
                margin-top: 20px;
            }

            table {
                border-collapse: collapse;
                width: 50%;
                margin: 20px auto;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            h3 {
                text-align: center;
                margin-top: 20px;
            }

            a {
                text-decoration: none;
                color: #0066cc;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
        <script type="text/javascript">
            function doDelete(uid) {
                if (confirm("are You sure to delete Human with id =" + uid)) {
                    window.location = "deleteac?uid=" + uid;
                }
            }
        </script>
    </head>
    <body>
    <center>
        <h1 style="color: highlight">LIST ACCOUNT</h1><br/>
        <h3><a href="home">Home</a> &nbsp;
        </h3>
        <table border="1px" width="50%">
            <tr>
                <th>Uid</th>
                <th>User</th>
                <th>Pass</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <c:set var="id" value="${c.uid}"/>
                <tr>
                    <td>${id}</td>
                    <td>${c.user}</td>
                    <td>${c.pass}</td>
                    <td>
                        <a href="updateac?uid=${id}">Update</a> &nbsp;&nbsp;&nbsp;
                        <a href="#" onclick="doDelete('${id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table><br/>

    </center>
</html>
