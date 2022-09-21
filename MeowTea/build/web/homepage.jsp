<%-- 
    Document   : index
    Created on : Jun 20, 2022, 8:41:34 PM
    Author     : Admin
--%>

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
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"R03".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.jsp");
                    return;
                }
            %>
            <div class="row">
                <div class="col-md-12">
                    <!--Bắt đầu slider-->
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img style="height: 400px; width: 1600px" src="img/3.jpg" alt="Cat Coffee">
                            </div>
                            <div class="item">
                                <img style="height: 400px; width: 1600px" src="img/2.png" alt="Cat Coffee">
                            </div>
                            <div class="item">
                                <img style="height: 400px; width: 1600px" src="img/1.png" alt="Cat Coffee">
                            </div>
                            <div class="item">
                                <img style="height: 400px; width: 1600px" src="img/logo1.png" alt="Cat Coffee">
                            </div>
                        </div>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <!--Kết thúc slider-->
                </div>
            </div>
            <!--<div class="header"><h1>Top Selling</h1></div>-->
            <!-- Nội dung chi tiết-->
            <div class="row">
                <div>
                    <!-- Món ăn thứ nhất-->
                    <div> <img style="height: 250px" src="https://tocotocotea.com/wp-content/uploads/2022/04/tra%CC%80-xoa%CC%80i-bu%CC%9Bo%CC%9B%CC%89i-ho%CC%82%CC%80ng.png" class="img-responsive" /></div>
                    <div>
                        <h2>Red Grapefruit Mango Tea</h2>
                        <p style="color: #000; text-align: center">This is a delicious drink!</p>
                    </div>
                    <div class="clearfix"> </div>
                    <!--Ngăn không cho hộp tiếp theo chạy lên-->
                </div>
                <div>
                    <!-- Món ăn thứ hai-->
                    <div> <img style="height: 250px" src="https://tocotocotea.com/wp-content/uploads/2022/04/tra%CC%80-xoa%CC%80i-bu%CC%9Bo%CC%9B%CC%89i-ho%CC%82%CC%80ng-kem-pho%CC%82-mai.png" class="img-responsive" /></div>
                    <div>
                        <h2>Red Grapefruit Mango Tea Cream Cheese</h2>
                        <p style="color: #000; text-align: center">This is a delicious drink in this f*cking hot summer!</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="row">
                <div>
                    <!-- Món ăn thứ ba-->
                    <div> <img style="height: 250px" src="https://tocotocotea.com/wp-content/uploads/2021/12/Hi%CC%80nh-a%CC%89nh-sp-website_1000x1000_choco-ngu%CC%83-co%CC%82%CC%81c-kem-cafe.png" class="img-responsive" /></div>
                    <div>
                        <h2>Cereal Choco Coffee Cream</h2>
                        <p style="color: #000; text-align: center">This is also a delicious drink!</p>
                    </div>
                    <div class="clearfix"> </div>
                    <!--Ngăn không cho hộp tiếp theo chạy lên-->
                </div>
                <div>
                    <!-- Món ăn thứ tư-->
                    <div> <img style="height: 250px" src="https://tocotocotea.com/wp-content/uploads/2021/12/Hi%CC%80nh-a%CC%89nh-sp-website_1000x1000_ho%CC%82%CC%80ng-tra%CC%80-ngu%CC%83-co%CC%82%CC%81c-kem-cafe.png" class="img-responsive" /></div>
                    <div>
                        <h2>Red Cereal Tea Coffee Cream</h2>
                        <p style="color: #000; text-align: center">This is also a delicious drink!</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div style="text-align: center" class="submit">
                <form action="MainController">
                    <input type="submit" name="action" value = "View"/>
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