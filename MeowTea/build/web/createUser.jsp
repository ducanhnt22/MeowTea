<%-- 
    Document   : createUser
    Created on : Jun 27, 2022, 1:15:11 PM
    Author     : Admin
--%>

<%@page import="user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title>Register</title>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <div class="center">
            <h1>Meow Coffee Login</h1>
            <form action="MainController" method="POST">
                <div class="txt_field">
                    <input type="text" name="userID" required/>
                    <span></span>
                    <label>User ID</label>
                </div>
                <div class="error">
                    <%= userError.getUserID()%>
                </div>
                <div class="txt_field">
                    <input type="text" name="name" required/>
                    <span></span>
                    <label>Username</label>
                </div>
                <div class="error">
                    <%= userError.getName()%>
                </div>
                <div class="txt_field">
                    <input type="text" name="phone" required/>
                    <span></span>
                    <label>Phone number</label>
                </div>
                <div class="error">
                    <%= userError.getPhone()%>
                </div>
                <div class="txt_field">
                    <input type="text" name="address" required/>
                    <span></span>
                    <label>Address</label>
                </div>
                <div class="txt_field">
                    <input type="text" name="email" required/>
                    <span></span>
                    <label>Email</label>
                </div>
                <div class="error">
                    <%= userError.getEmail()%>
                </div>
                <div class="txt_field">
                    <input type="text" name="roleID" value="R03" required readonly="">
                    <span></span>
                    <!--<label>Username</label>-->
                </div>
                <div class="txt_field">
                    <input type="password" name="password" required/>
                    <span></span>
                    <label>Password</label>
                </div>
                <div class="txt_field">
                    <input type="password" name="confirm" required/>
                    <span></span>
                    <label>Confirm password</label>
                </div>
                <div class="error">
                    <%= userError.getConfirm()%>
                </div>
                <input type="submit" name="action" value="Register">
                <div class="signup_link">
                    Already have an account? <a href="login.jsp">Login</a>
                </div>
            </form>
        </div>
    </body>
</html>
