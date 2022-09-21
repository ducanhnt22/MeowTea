<%-- 
    Document   : productManagement
    Created on : Jul 4, 2022, 5:23:44 PM
    Author     : Admin
--%>

<%@page import="product.ProductDTO"%>
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
                String search = request.getParameter("SearchProduct");
                if (search == null) {
                    search = "";
                }
            %>
            <div style="text-align: center; margin-bottom: 20px">
                <form action="MainController">
                    <a href="addProduct.jsp">Add Product</a>
                    <input type ="search" name="search" value = "<%= search%>"/>
                    <input type="submit" name ="action" value="SearchProduct"/>
                </form>
            </div>
            <%
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("VIEW_PRODUCT");
                if (listProduct != null && listProduct.size() > 0) {
            %>
            <div style="margin-left: 30px; margin-right: 30px">
                <table border="1">
                    <thead>
                        <tr>
                            <th style="text-align: center">ID</th>
                            <th style="text-align: center">Product Name</th>
                            <th style="text-align: center">Price</th>
                            <th style="text-align: center">Quantity</th>
                            <th style="text-align: center">Category ID</th>
                            <th style="text-align: center">Category Name</th>
                            <th style="text-align: center">Image link</th>
                            <th style="text-align: center">Image</th>
                            <th style="text-align: center">Update</th>
                            <th style="text-align: center">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (ProductDTO product : listProduct) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td style="text-align: center"> <%= product.getProductID()%> </td>
                        <input type="hidden" name="pID" value="<%= product.getProductID()%>"/>
                        <td>
                            <input style="text-align: center" type ="text" name="pName" value="<%= product.getpName()%>" required=""/>
                        </td>
                        <td>
                            <input style="text-align: center; width: 100px" type ="number" name="pPrice" value="<%= product.getpPrice()%>" required=""/>
                        </td>
                        <td>
                            <input style="text-align: center; width: 80px" type ="number" name="pQuantity" value="<%= product.getQuantity()%>" required=""/>
                        </td>
                        <td>
                            <input style="text-align: center; width: 100px" type ="text" name="pCategoryID" value="<%= product.getCategoryID()%>" required=""/>
                        </td>
                        <td style="text-align: center; width: 150px">
                            <%= product.getCategoryName()%>
                        </td>
                        <td  style="text-align: center">
                            <input style="text-align: center" type ="text" name="pImages" value="<%= product.getImages()%>" required=""/>
                        </td>
                        <td  style="text-align: center">
                            <img style="height: 100px;" src="<%= product.getImages()%>" alt="Milktea">
                        </td>
                        <!--update function-->
                        <td>
                            <input type="hidden" name="UserID" value="<%= product.getProductID()%>"/>
                            <input type="hidden" name="search" value="<%= search%>"/>                        
                            <input type="submit" name="action" value="UpdateProduct"/>
                        </td>
                        <!--delete function-->
                        <td>
                            <input type="hidden" name="UserID" value="<%= product.getProductID()%>"/>
                            <input type="hidden" name="search" value="<%= search%>"/>                        
                            <input type="submit" name="action" value="DeleteProduct"/>
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