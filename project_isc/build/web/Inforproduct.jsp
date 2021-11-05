<%@page import="Models.Account"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.Comment"%>
<%@page import="Models.QuantityProductAdd"%>
<%@page import="Models.ProductDescription"%>
<%@page import="DAL.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Account acount = null;
        try {
            acount = (Account) request.getAttribute("ac");
        } catch (Exception e) {
        }
        Product product = (Product) request.getAttribute("product");
        ProductDescription productDes = (ProductDescription) request.getAttribute("productdes");
        ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("lst");
        ArrayList<Product> lstProductincard;
        ArrayList<QuantityProductAdd> lstProductQuantity;

        DecimalFormat fm = new DecimalFormat("#,###.###");

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
        <link rel="stylesheet" href="css/newcss.css">
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
                                        <%if (acount == null) {%>
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
                        </div>
                    </div>
                </div>
                <!-- Modal -->
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
                <div class="main-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-6 col-xs-6 col-sm-6 col-md-3 col-lg-3 order-md-0 order-0">
                                <div class="logo">
                                    <a href="#"><img src="images/LogoMakr_0Dua6Y.png" alt=""></a>
                                    <h1>Website bán hàng</h1>
                                </div>
                            </div>
                            <div class="col-12 col-xs-12 col-sm-12 col-md-6 col-lg-6 order-md-1 order-2">
                                <div class="form-seach-product">
                                    <form action="SearchSVL" method="post" >
                                        <select name="input" id="" class="form-control" required="required">
                                            <option value="0">Chọn danh mục</option>
                                            <option value="1" >Điện thoại</option>
                                            <option value="2">Máy tính</option>
                                            <option value="3">Sản phẩm khác</option>
                                        </select>
                                        <div class="input-seach">
                                            <input type="text" name="txtsearch" id="" class="form-control">
                                            <button type="submit" class="btn-search-pro"><i
                                                    class="fa fa-search"></i></button>
                                        </div>
                                        <div class="clear"></div>
                                    </form>
                                </div>
                            </div>

                            <div class="col-6 col-xs-6 col-sm-6 col-md-3 col-lg-3 order-md-2 order-1"
                                 style="text-align: right">
                                <div class="dropdown">
                                    <div class="icon">
                                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                        <span><%=session.getAttribute("card")%></span>
                                    </div>
                                    <div class="info-cart">
                                        <p>Giỏ hàng</p>
                                        <span><%if (session.getAttribute("money") != null) {%><%=session.getAttribute("money")%><%} else {%>0<%}%> đ</span>
                                    </div>
                                    <span class="clear"></span>
                                    <%if (lstProductincard != null && lstProductincard.size() != 0) {%>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <table class="table table-light fixtb">
                                            <thead>
                                            <th scope="col">Product</th>
                                            <th scope="col">Quantity</th>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < lstProductincard.size(); i++) {%>
                                                <tr>
                                                    <td><img src="<%=lstProductincard.get(i).getUrl()%>" width="50rem" height="50rem"></td>
                                                    <td><%=lstProductincard.get(i).getProductName()%></td>
                                                    <td><%=lstProductQuantity.get(i).getQuantity()%></td>
                                                    <td><%=lstProductQuantity.get(i).getAmount()%></td>
                                                    <td><a href="DeleteSessionPrdSVL?productid=<%=lstProductincard.get(i).getProductID()%>"><button class="btn-danger">x</button></a></td>
                                                </tr>
                                                <%}%>
                                                <tr>
                                                    <td></td>
                                                    <td><a href="BuyProductSVL"><button class="btn btn-danger">Mua Ngay</button></a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <%}%>
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
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9 order-lg-1 order-0">
                            <div class="product-section product-section2" style="width: 63rem;">
                                <h2 class="title-product">
                                    <a href="#" class="title title2" ><%=product.getProductName()%>i</a>
                                    <div class="bar-menu"><i class="fa fa-bars"></i></div>

                                    <div class="clear"></div>
                                </h2>
                                <div class="content-product-box">
                                    <div class="row">
                                        <div  class="display_item"> 
                                            <ul> 
                                                <li>
                                                    <div class="item-product">
                                                        <div class="thumb">
                                                            <a class="thu"><img class="reflection-grid-cell" src="<%=product.getUrl()%>" alt="" style="width: 30rem" ></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="des" style="margin-left: 5rem" >
                                                    <div class="item-product">
                                                        <div class="thumb">
                                                            <table class="table">
                                                                <tr>
                                                                    <th scope="row">Màn hình:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getManhinh()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">Camera sau:</th><td></td>
                                                                    <td><%=productDes.getCamerasau()%></td>
                                                                </tr> <tr>
                                                                    <th scope="row">Camera trước:</th><td></td>
                                                                    <td><%=productDes.getCameratruoc()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">CPU:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getCpu()%></td>
                                                                </tr>
                                                                <tr><th scope="row">Ram:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getRam()%></td>
                                                                </tr>
                                                                <tr><th scope="row">Bộ nhớ trong:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getBonhotrong()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">Sim:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getSim()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">Sản xuất tại:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getSanxuattai()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">Hệ điều hành:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getHeieuhanh()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">Chống nước:</th>
                                                                    <td></td>
                                                                    <td><%=productDes.getChongnuoc()%></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="info-product">
                                                            <div class="price">
                                                                <span class="price-current" ><%=fm.format(product.getUnitPrice())%>₫</span>
                                                            </div>
                                                            <a href="BuyProductSVL?productid=<%=product.getProductID()%>" class="view-more">Mua Ngay</a>
                                                            <a href="AddsessionCard?productid=<%=product.getProductID()%>" class="view-more"><button class="btn-danger" name="productid" value="<%=product.getProductID()%>">Thêm Vào Giỏ Hàng</button> </a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
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
            <!--            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <div class="box-footer info-contact">
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
                            </div>
                        </div>-->
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="box-footer info-contact" style="display: none" id="re-js">
                    <h3>FeedBack this product:</h3>
                    <div class="content-contact">
                        <form action="InsertFeedbackSVL" method="Post" name="formfeedback">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                    <input name="productID" id="productID" value="<%=product.getProductID()%>" hidden>
                                    <input type="text"  class="form-control"
                                           value="<%=product.getProductName()%>" style="color: white" readonly>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="text" name="usernameFB" id="usernameFB" class="form-control"
                                           <%if (acount != null) {%>value="<%=acount.getUsername()%>" readonly <%}%> style="color: white">
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                    <input type="email" name="emailFB" id="emailFB" class="form-control"
                                           <%if (acount != null) {%>value="<%=acount.getEmail()%>" readonly <%}%> style="color: white" >
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                    <input type="number" name="phoneFB" id="phoneFB" class="form-control"
                                           placeholder="Số điện thoại" style="color: white">
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="text" name="titleFB" id="titleFB" class="form-control" placeholder="Tiêu đề" style="color: white">
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <textarea name="contentFB" id="contentFB" cols="30" rows="10" class="form-control" style="color: white"></textarea>
                                </div>
                            </div>
                            <button onclick="feedback()" type="button" class="btn-contact btn2" id="checkFB">Check Feedback</button>
                            <button type="submit" class="btn-contact btn2" id="sendFB" style="display: none" onclick="notiy()">Send Feedback</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>Design by @DungtrongFU</p>
    </div>
</footer>
<script src="js/newjs.js"></script>
<script src="libs/jquery-3.4.1.min.js"></script>
<script src="libs/bootstrap/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<div id="fb-root"></div>

</body>

</html>