<%-- 
    Document   : viewCart
    Created on : Jul 3, 2022, 10:26:24 PM
    Author     : Admin
--%>

<%@page import="user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.ProductDTO"%>
<%@page import="order.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart page</title>
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
                                <a href="homepage.jsp"> <span class="glyphicon glyphicon-home"></span>Homepage</a>
                            </li>
                            <li><a href="#">About Us</a></li>
                            <!--<li><a href="viewProduct.jsp">Our Menu</a></li>-->
                            <li><a href="#">Recruitment</a></li>
                            <li> <a href="#"><span class="glyphicon glyphicon-envelope"></span> Contact</a> </li>
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
            <h1 style="text-align: center; font-family: Cursive;">Your cart</h1>
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"R03".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
            %>
            <div style="margin-left: 30px">
                <table border="1">
                    <thead>
                        <tr>
                            <th style="text-align: center">No</th>
                            <th style="text-align: center">Image</th>
                            <th style="text-align: center">Name</th>
                            <th style="text-align: center">Price</th>
                            <th style="text-align: center">Quantity</th>
                            <th style="text-align: center">Total</th>
                            <th style="text-align: center">Remove</th>
                            <th style="text-align: center">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            double total = 0;
                            for (ProductDTO tea : cart.getCart().values()) {
                                total += tea.getpPrice() * tea.getQuantity();
                        %>
                    <form action="MainController">
                        <tr>
                            <td style="text-align: center"><%= count++%></td>
                            <td>
                                <img style="height: 100px;" src="<%=tea.getImages()%>" alt="Milktea">
                            </td>
                            <td style="text-align: center; width: 300px"><%= tea.getpName()%></td>
                            <td style="text-align: center; width: 170px"><%= tea.getpPrice()%></td>
                            <td style="width: 230px; text-align: center">
                                <input style="text-align: center; width: 150px" type="number" name="quantity" value ="<%= tea.getQuantity()%>" required="" min="1">
                            </td>
                        <input type ="hidden" name ="Id" value ="<%= tea.getProductID()%>"/>
                        <td style="text-align: center; width: 80px"><%= tea.getpPrice() * tea.getQuantity()%></td>
                        <td style="text-align: center; width: 100px">
                            <input style="text-align: center; width: 70px" type ="submit" name ="action" value ="Remove"/>
                        </td>
                        <td style="text-align: center; width: 100px">
                            <input style="text-align: center; width: 70px" type ="submit" name ="action" value ="Edit"/>
                        </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                <h1>Total = <%= total%>$</h1>
                <form>
                    <button style="background-color: #ec971f; padding: 15px 32px; display: inline-block; color: white; border: none;" formaction="ViewProductController">Continue Shopping?</button>
                </form></br>
                <%
                    }
                %>
                <form action="MainController">
                    <input style="background-color: #ec971f; padding: 15px 32px; display: inline-block; color: white; border: none;" type="submit" name="action" value="CheckOut">
                </form>
            </div>
        </table>
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