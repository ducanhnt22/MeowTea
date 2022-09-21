<%-- 
    Document   : userManagement
    Created on : Jul 4, 2022, 5:23:31 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Meow Tea</title>
        <script src="js/homepage.js"></script>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styleHomepage.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="logo"><img style="height: 100px; display: block; margin-left: auto; margin-right: auto" src="img/logo.png" alt="logo"</div> 
        <div class="container">
            <!--Nội dung Menu-->
            <nav class="navbar navbar-inverse bg-primary" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"> 
                                <a href="ViewUserController">User Management</a>
                            </li>

                            <li><a href="ViewProductManagerController">Product Management</a></li>
                        </ul>
                        <form class="navbar-form navbar-right">
                            <div class="form-group">

                                <h5>Welcome ${sessionScope.LOGIN_USER.fullName}!!!</h1>
                            </div>
                            <a href="MainController?action=Logout">Logout</a>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
            <!--Nội dung Slider-->
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"R01".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            <div style="text-align: center; margin-bottom: 20px">
                <form action="MainController">
                    <input type ="search" name="search" value = "<%= search%>"/>
                    <input type="submit" name ="action" value="search"/>
                </form>
            </div>
            <%
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("VIEW_USER");
                if (listUser != null && listUser.size() > 0) {
            %>
            <div style="margin-left: 30px">
                <table border="1">
                    <thead>
                        <tr>
                            <th style="text-align: center">No</th>
                            <th style="text-align: center">User ID</th>
                            <th style="text-align: center">Full Name</th>
                            <th style="text-align: center">Phone</th>
                            <th style="text-align: center">Address</th>
                            <th style="text-align: center">Email</th>
                            <th style="text-align: center">Role ID</th>
                            <th style="text-align: center">Role Name</th>
                            <th style="text-align: center">Password</th>
                            <th style="text-align: center">Update</th>
                            <th style="text-align: center">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (UserDTO user : listUser) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td style="text-align: center"> <%= count++%> </td>
                            <td style="text-align: center"> <%= user.getUserID()%> </td>
                            <td>
                                <input style="text-align: center" type ="text" name="name" value="<%= user.getFullName()%>" required=""/>
                            </td>
                            <td>
                                <input style="text-align: center; width: 100px" type ="text" name="phone" value="<%= user.getPhone()%>" required=""/>
                            </td>
                            <td>
                                <input style="text-align: center; width: 150px" type ="text" name="address" value="<%= user.getAddress()%>" required=""/>
                            </td>
                            <td  style="text-align: center">
                                <input style="text-align: center" type ="text" name="email" value="<%= user.getEmail()%>" required=""/>
                            </td>
                            <td style="text-align: center">
                                <input style="width: 100px; text-align: center;" type ="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                            </td>
                            <td style="text-align: center"><%= user.getRoleName()%></td>
                            <td style="text-align: center"> <%= user.getPassword()%> </td>
                        <input type="hidden" name="password" value="<%= user.getPassword()%>"/>
                        <!--update function-->
                        <td>
                            <input type="hidden" name="UserID" value="<%= user.getUserID()%>"/>
                            <input type="hidden" name="search" value="<%= search%>"/>                        
                            <input type="submit" name="action" value="Update"/>
                        </td>
                        <!--delete function-->
                        <td>
                            <input type="hidden" name="UserID" value="<%= user.getUserID()%>"/>
                            <input type="hidden" name="search" value="<%= search%>"/>                        
                            <input type="submit" name="action" value="Delete"/>
                        </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
            <%
                }
            %>
            <!--nội dung footer-->
            <div class="row footer">
                <div class="col-md-8">
                    <ul>
                        <li>Phone : 0867960120</li>
                        <li>Address : Meow Tea, District 9, Ho Chi Minh City</li>
                        <li>Copyright - Vietnamese Milk Tea. All rights Reserved.</li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <a href="#"><img src="img/facebook_1.png" /></a>
                    <a href="#"><img src="img/linkein.png" /></a>
                    <a href="#"><img src="img/Twiter.png" /></a>
                </div>
            </div>
        </div>
        <!--Kết thúc contianer-->
        <!--Thư viên javascript của Bootstrap-->
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>