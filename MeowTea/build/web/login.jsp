<%-- 
    Document   : login
    Created on : Jun 22, 2022, 11:42:40 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="center">
            <h1>Meow Coffee Login</h1>
            <form action="MainController" method="POST">
                <div class="txt_field">
                    <input type="text" name="userID" required/>
                    <span></span>
                    <label>Username</label>
                </div>
                <div class="txt_field">
                    <input type="password" name="password" required/>
                    <span></span>
                    <label>Password</label>
                </div>
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error%>
                <div class="pass">Forgot Password?</div>
                <input type="submit" name="action" value="Login">
                <div class="signup_link">
                    Not a member? <a href="createUser.jsp">Sign up</a>
                </div>
            </form>
        </div>
    </body>
</html>
