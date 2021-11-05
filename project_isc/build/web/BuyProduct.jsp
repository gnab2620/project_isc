<%@page import="Models.Account"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.QuantityProductAdd"%>
<%@page import="Models.ProductDescription"%>
<%@page import="DAL.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <%
        DecimalFormat fm = new DecimalFormat("#,###.###");
        Account acount = null;
        try {
            acount = (Account) request.getAttribute("ac");
        } catch (Exception e) {
        }
        ArrayList<Product> lstProductincard;
        ArrayList<QuantityProductAdd> lstProductQuantity;
        try {
            lstProductincard = (ArrayList<Product>) session.getAttribute("lstProductincard");
            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
        } catch (Exception e) {
            lstProductincard = null;
            lstProductQuantity = null;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>DungTrongShop.vn</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
        <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <div id="wallpaper">
            <header>
                <div class="top">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <p>Wellcome to DungTrongShop.vn</p>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="top-menu">
                                    <ul>
                                        <%if (acount==null) {%>
                                        <li><a href="Login.jsp"><img src="images/user.png" height="25rem">Tài Khoản</a></li>
                                                <%} else {%>
                                        <form action="LogOutSVL" method="GET" role="form" >
                                            <li id="username" data-toggle="modal" data-target="#exampleModal"><img src="images/user.png" height="25rem"><%=acount.getUsername()%></li>
                                            <input type="submit" value="Đăng Xuất">
                                        </form>
                                        <%}%>
                                        </li
                                    </ul>
                                </div>
                            </div>
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Thông tin sản phẩm</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="EditInformationUser" method="get">
                                            <div class="modal-body">
                                                <%if (acount != null) {%>
                                                <strong>User Name: </strong><input type="text" value="<%=acount.getUsername()%>" name="username"><br>
                                                <strong>Phone: </strong><input type="number" value="<%=acount.getPhone()%>" name="phone"><br>
                                                <strong>Email: </strong><input type="text" value="<%=acount.getEmail()%>" readonly name="email"><br>
                                                <%}%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-menu-header">
                    <div class="container">
                        <div id="nav-menu">
                            <ul>
                                <li class="current-menu-item"><a href="LoginSVL" >Trang chủ</a></li>
                                <!--<li><a href="#">Giới thiệu</a></li>-->
                                <li>
                                    <a href="#">Sản phẩm</a>
                                    <ul>
                                        <li><a href="DisplayeachtypeSVL?type=1">Điện thoại</a></li>
                                        <li><a href="DisplayeachtypeSVL?type=2">Máy tính</a></li>
                                        <li><a href="DisplayeachtypeSVL?type=3">Sản phẩm khác</a></li>
                                    </ul>
                                </li>
                                <li><a onclick="bottomFunction()">Liên hệ</a></li>

                            </ul>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </header>
            <div id="content">
                <div class="container">
                    <div class="slider">
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="images/banner-01.png" alt="First slide">
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="images/iphone-12-800-300-800x300-3.png"
                                         alt="Second slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                               data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                               data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="product-box">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3 order-lg-0 order-1">
                                <div class="sidebar">
                                </div>
                            </div>
                        </div>
                        <a href="LoginSVL" style="margin-left: 17px"><button type="button" class="btn btn-dark">< Tiếp tục mua sắm</button></a>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9 order-lg-1 order-0">
                            <div class="product-section product-section2" style="width: 63rem;">
                                <h2 class="title-product">
                                    <a href="#" class="title title2" >Xác nhận Đơn hàng</a>
                                    <div class="bar-menu"><i class="fa fa-bars"></i></div>

                                    <div class="clear"></div>
                                </h2>
                                <%if (lstProductQuantity.size() != 0) {%>
                                <div class="content-product-box">
                                    <div class="row">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col"></th>
                                                    <th scope="col">Product</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Total money</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%for (int i = 0; i < lstProductincard.size(); i++) {%>
                                                <tr>
                                            <form action="DeleteSessionPrdSVL" method="post">
                                                <input  value="<%=lstProductQuantity.get(i).getProductID()%>" name="productid" hidden>
                                                <td><img src="<%=lstProductincard.get(i).getUrl()%>" width="150rem" height="150rem"></td>
                                                <td><%=lstProductincard.get(i).getProductName()%></td>
                                                <td><a href="BuyProductSVL?productid=<%=lstProductQuantity.get(i).getProductID()%>&operator=add"><button type="button">+</button></a>
                                                    <%=lstProductQuantity.get(i).getQuantity()%>
                                                    <a href="BuyProductSVL?productid=<%=lstProductQuantity.get(i).getProductID()%>&operator=sub"><button type="button">-</button></a></td>
                                                <td><%=fm.format(lstProductQuantity.get(i).getAmount())%></td>
                                                <td><input type="submit" class="btn-danger" value="X"></td>
                                            </form>    
                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="">Total: <%=fm.format(session.getAttribute("money"))%></th>
                                                <th scope="col"></th>
                                            </tr>
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"><button class="btn-warning" id="cforder" onclick="cforder()">ORDER</button>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table id="tableif" class="table" style="display: none" >
                                            <thead>
                                                <tr>
                                                    <th scope="col"></th>
                                                    <th scope="col">Receiver's information</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <form action="BuyProductSVL" method="post">
                                                <input value="<%=acount.getEmail() %>" name="email" hidden>
                                                <tr>
                                                    <th scope="col">Receiver:</th>
                                                    <td scope="col"><input type="text" name="reciever" id="reciever"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">Phone:</th>
                                                    <td scope="col"><input type="number" name="phone" id="phone"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">Address:</th>
                                                    <td scope="col"><input type="text" name="address" id="address"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">Note:</th>
                                                    <td scope="col">
                                                        <textarea name="note" cols="30" rows="10" class="form-control"></textarea>
                                                    </td>
                                                </tr>
                                                <tr><th></th>
                                                    <td><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                            <p id="notyFail" style="display: none; color: red;">Pls Fill all the blank !</p>
                                                        </div>
                                                        <button onclick="checkinfoOrder()" type="button" class="btn-danger" id="checkOD">Check Info</button>
                                                        <button type="submit" class="btn-dark " id="sendOD" style="display: none" onclick="notiy2()">ORDER</button>
                                                    </td>
                                                </tr>
                                            </form>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>

                    <br>
                    <br>

                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="box-footer info-contact">
                    <h3>Thông tin liên hệ</h3>
                    <div class="content-contact">
                        <p><strong>Facebook:</strong> <a href="https://www.facebook.com/TrongDungFU" style="color: red">https://www.facebook.com/TrongDungFU</a></p>
                        <p>
                            <strong>Địa chỉ:</strong> Thuận Thành, Bắc Ninh
                        </p>
                        <p>
                            <strong>Email: </strong> trongson247@gmail.com
                        </p>
                        <p>
                            <strong>Điện thoại: </strong> 0964364112
                        </p>

                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <!--                <div class="box-footer info-contact">
                                    <h3>Thông tin khác</h3>
                                    <div class="content-list">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-angle-double-right"></i> Chính sách bảo mật</a></li>
                                            <li><a href="#"><i class="fa fa-angle-double-right"></i> Chính sách đổi trả</a></li>
                                            <li><a href="#"><i class="fa fa-angle-double-right"></i> Phí vẫn chuyển</a></li>
                                            <li><a href="#"><i class="fa fa-angle-double-right"></i> Hướng dẫn thanh toán</a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-angle-double-right"></i> Chương trình khuyến mãi</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>-->
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>Design by @DungtrongFU</p>
    </div>
</footer>
<script src="js/buyproduct.js"></script>
<script src="js/newjs.js"></script>
<script src="libs/jquery-3.4.1.min.js"></script>
<script src="libs/bootstrap/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<div id="fb-root"></div>

</body>

</html>