<%-- 
    Document   : viewProduct
    Created on : Jun 29, 2022, 1:58:51 AM
    Author     : Admin
--%>

<%@page import="user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
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
                                <a href="homepage.jsp"> <span class="glyphicon glyphicon-home"></span>Homepage</a>
                            </li>
                            <li><a href="#">About Us</a></li>
                            <!--<li><a href="viewProduct.jsp">Our Menu</a></li>-->
                            <li><a href="#">Recruitment</a></li>
                            <li> <a href="#"><span class="glyphicon glyphicon-envelope"></span> Contact</a> </li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
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
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"R03".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            <div class="search" style="text-align: center">
                <form action="MainController">
                    <input type="text" name="search" value="<%= search%>"/>
                    <input class="submit" type="submit" name="action" value="Search"/>
                </form>
            </div>
            </br>
            <div class="row" style="text-align: center;margin-left: 30px; margin-right: 30px; color: black; overflow-x:auto">
                <table border="1">
                    <thead>
                        <tr>
                            <th style="text-align: center; overflow-x:auto;">Image</th>
                            <th style="text-align: center; overflow-x:auto;">Name</th>
                            <th style="text-align: center; overflow-x:auto;">Price</th>
                            <th style="text-align: center; overflow-x:auto;">Category Name</th>
                            <th style="text-align: center; overflow-x:auto;">Quantity</th>
                            <th style="text-align: center; overflow-x:auto;">Add to cart</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${VIEW_PRODUCT}" var="o">
                        <form action="MainController">
                            <tr>
                                <td><img style="height: 130px;" src="${o.images}" alt="Milktea"></td>
                                <td style="width: 300px">${o.pName}</td>
                                <td style="width: 170px">${o.pPrice}</td>
                                <td style="width: 150px">${o.categoryName}</td>
                            <input type ="hidden" name="images" value ="${o.images}">
                            <input type ="hidden" name="pName" value ="${o.pName}">
                            <input type ="hidden" name="productID" value ="${o.productID}">
                            <input type ="hidden" name="pPrice" value ="${o.pPrice}">
                            <input type ="hidden" name="pCategoryName" value ="${o.categoryName}">
                            <td style="width: 200px">
                                <input type="number" name="cQuantity" required="" min="1"/>
                            </td>
                            <td style="width: 150px">
                                <input style="width: 120px" type="submit" name="action" value="Add">
                            </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
                <div style="padding-top: 20px; padding-left: 44%" class="submit">
                    <form action="MainController">
                        <input type="submit" name="action" value = "ViewCart"/>
                    </form>
                </div>
            </div>
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
        <!--Kết thúc container-->
        <!--Thư viên javascript của Bootstrap-->
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
