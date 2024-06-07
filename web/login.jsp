<%-- 
    Document   : login
    Created on : Mar 3, 2024, 12:39:24 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                margin-top: 150px;
                margin-bottom: 150px;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            h1, h2 {
                text-align: center;
                color: #333;
            }

            h3 {
                text-align: center;
                color: red;
            }

            .form-container {
                max-width: 300px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0173b2;
            }
        </style>
    </head>
    <body>
        
        <h3 style="color: red;">${requestScope.ms}</h3>
        <div id="loginForm" class="form-container">
            <h1>Login</h1>
            <form action="login">
                enter username: <input type="text" name="user" required/><br/>
                enter password: <input type="password" name="pass" required/><br/>
                <input type="submit" value="LOGIN"/>
            </form>
            <p>Don't have an account? <a href="signup">Sign Up</a></p>
        </div>
       
    </body>
</html>



