<%-- 
    Document   : addProduct
    Created on : Jul 8, 2022, 1:17:40 PM
    Author     : Admin
--%>

<%@page import="product.ProductDTO"%>
<%@page import="product.ProductError"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Meow Tea</title>
        <script src="js/homepage.js"></script>
        <!-- Bootstrap -->
        <!--        <link rel="stylesheet" href="css/login.css">-->
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
                ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                if (productError == null) {
                    productError = new ProductError();
                }%>
            <div>
                <form action="MainController" method="POST">
                    <div class="txt_field">
                        <input type="text" name="productID" required/>
                        <span></span>
                        <label>Product ID</label>
                    </div>
                    <div class="error">
                        <%= productError.getProductID()%>
                    </div>
                    <div class="txt_field">
                        <input type="text" name="name" required/>
                        <span></span>
                        <label>Product Name</label>
                    </div>
                    <div class="error">
                        <%= productError.getpName()%>
                    </div>
                    <div class="txt_field">
                        <input type="number" name="price" min="1" required/>
                        <span></span>
                        <label>Price</label>
                    </div>
                    <div class="txt_field">
                        <input type="number" name="quantity" min="1" required/>
                        <span></span>
                        <label>Quantity</label>
                    </div>
                    <select name ="categoryID">
                        <option value ="C01">Milk Tea</option>
                        <option value ="C02">Fresh Fruit Tea</option>
                        <option value ="C03">Yogurt</option>
                        <option value ="C04">Macchiato Cream Cheese</option>
                        <option value ="C05">Special</option>
                    </select>
                    <span></span>
                        <label>Category ID</label>
                    <div class="txt_field">
                        <input type="hidden" name="categoryName" value="" required/>
                        <div class="error">
                        </div>
                    </div>
                    <div class="txt_field">
                        <input type="text" name="img" required/>
                        <span></span>
                        <label>Image link</label>
                    </div>
                    <input type="submit" name="action" value="AddProduct">
                </form>
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
        <!--Kết thúc contianer-->
        <!--Thư viên javascript của Bootstrap-->
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

