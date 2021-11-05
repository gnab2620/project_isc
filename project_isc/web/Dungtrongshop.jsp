<%@page import="Models.Account"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.QuantityProductAdd"%>
<%@page import="DAL.DAO"%>
<%@page import="java.util.*"%>
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
        ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("lst");
        ArrayList<Product> lstProductincard;
        ArrayList<QuantityProductAdd> lstProductQuantity;
        try {
            lstProductincard = (ArrayList<Product>) session.getAttribute("lstProductincard");
            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
        } catch (Exception e) {
            lstProductincard = null;
            lstProductQuantity = null;
        }
        String typeProduct;
        int type = -1;
        try {
            type = Integer.parseInt(String.valueOf(request.getAttribute("type")));
            if (type == -1) {
                typeProduct = "SẢN PHẨM MỚI";
            } else if (type == 1) {
                typeProduct = "ĐIỆN THOẠI";
            } else if (type == 2) {
                typeProduct = "MÁY TÍNH";
            } else if (type == 3) {
                typeProduct = "THIẾT BỊ ĐIỆN TỬ";
            } else {
                typeProduct = "TẤT CẢ SẢN PHẨM";
            }
        } catch (Exception e) {
            typeProduct = "SẢN PHẨM MỚI";
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>DungTrongShop.vn</title>
        <!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">-->
        <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/responsive.css">
        <!--<link rel="stylesheet prefetch" href="http://bootswatch.com/slate/bootstrap.min.css">-->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/newcss.css">
    </head>
    <body>
        <div id="wallpaper">
            <header>
                <div class="top">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <p>Wellcome to DungTrongShop.vn </p>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="top-menu">
                                    <ul>
                                        <%if (acount == null) {%>
                                        <li><a href="Login.jsp"><img src="images/user.png" height="25rem">Tài Khoản</a></li>
                                                <%} else {%>
                                        <form action="LogOutSVL" method="GET" role="form">
                                            <li id="username" data-toggle="modal" data-target="#exampleModal"><img src="images/user.png" height="25rem"><%=acount.getUsername()%></li>
                                            <input type="submit" value="Đăng Xuất">
                                            <li><a href="UsercheckOrder?email=<%=acount.getEmail()%> ">Đơn Hàng Của tôi</a></li>
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
                                        <span><%if (session.getAttribute("money") != null) {%><%=fm.format(session.getAttribute("money"))%><%} else {%>0<%}%> đ</span>
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
                                                    <td><img src="<%=lstProductincard.get(i).getUrl()%>" width="50rem" height="50rem" ></td>
                                                    <td><%=lstProductincard.get(i).getProductName()%></td>
                                                    <td><%=lstProductQuantity.get(i).getQuantity()%></td>
                                                    <td><%=fm.format(lstProductQuantity.get(i).getAmount())%></td>
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
                                <li><a href="LoginSVL">Trang chủ</a></li>
                                <!--<li><a href="#">Giới thiệu</a></li>-->
                                <li>
                                    <a href="">Sản phẩm</a>
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
                                    <div class="category-box">
                                        <h3>Danh mục sản phẩm</h3>
                                        <div class="content-cat">
                                            <ul>                                                
                                                <li><i class="fa fa-angle-right"></i> <a href="DisplayeachtypeSVL?type=-1">Sản phẩm mới nhất</a></li>
                                                <li><i class="fa fa-angle-right"></i> <a href="DisplayeachtypeSVL?type=0">Tất cả sản phẩm</a></li>
                                                <li><i class="fa fa-angle-right"></i> <a href="DisplayeachtypeSVL?type=1">Điện thoại</a></li>
                                                <li><i class="fa fa-angle-right"></i> <a href="DisplayeachtypeSVL?type=2">Máy tính</a></li>
                                                <li><i class="fa fa-angle-right"></i> <a href="DisplayeachtypeSVL?type=3">Sản phẩm khác</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9 order-lg-1 order-0">
                                <div class="product-section">
                                    <h2 class="title-product">
                                        <form action="SortProduct" method="get">
                                            <a href="#" class="title"><%=typeProduct%></a>
                                            <input type="hidden" value="<%=type%>" name="type">
                                            <select class="custom-select-sm" name="orderby" style="margin-left: 25rem">
                                                <option value="">Sắp xếp theo giá</option>
                                                <option value="asc">Giá giảm dần</option>
                                                <option value="desc">Giá tăng dần</option>
                                            </select>
                                            <input type="submit" value="Duyệt" style="font-size: 21px; height: 32px; border-radius: 4px" class="btn-info">
                                        </form>
                                        <div class="bar-menu"><i class="fa fa-bars"></i></div>
                                        <div class="clear"></div>
                                    </h2>
                                    <div class="content-product-box ">
                                        <div class="row">
                                            <%if (type == -1) {%>
                                            <%for (int i = products.size() - 1; i >= products.size() - 16; i--) {%>
                                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                <div class="item-product">
                                                    <div class="thumb">
                                                        <a href="InforproductSVL?productid=<%=products.get(i).getProductID()%>"><img src="<%=products.get(i).getUrl()%>" alt="" height="150rem" ></a>
                                                        <!--<span class="sale">Giảm <br>15%</span>-->
                                                        <div class="action">
                                                            <a href="BuyProductSVL?productid=<%=products.get(i).getProductID()%>" class="buy"><i class="fa fa-cart-plus"></i>Mua ngay</a>
                                                            <a href="AddsessionCard?productid=<%=products.get(i).getProductID()%>" class="like" style="color: red"><i class="fa fa-cart-plus" ></i> Thêm</a>
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>

                                                    <div class="info-product">
                                                        <h4><a href="#"><%=products.get(i).getProductName()%></a></h4>
                                                        <div class="price">
                                                            <span class="price-current"><%=fm.format(products.get(i).getUnitPrice())%>₫</span>
                                                        </div>
                                                        <a href="InforproductSVL?productid=<%=products.get(i).getProductID()%>" class="view-more">Xem chi tiết</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}
                                            } else {%>
                                            <%for (int i = products.size() - 1; i >= 0; i--) {%>
                                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                <div class="item-product">
                                                    <div class="thumb">
                                                        <a href="InforproductSVL?productid=<%=products.get(i).getProductID()%>"><img src="<%=products.get(i).getUrl()%>" alt="" height="150rem" ></a>
                                                        <!--<span class="sale">Giảm <br>15%</span>-->
                                                        <div class="action">
                                                            <a href="BuyProductSVL?productid=<%=products.get(i).getProductID()%>" class="buy"><i class="fa fa-cart-plus"></i>Mua ngay</a>
                                                            <a href="AddsessionCard?productid=<%=products.get(i).getProductID()%>" class="like" style="color: red"><i class="fa fa-cart-plus" ></i> Thêm</a>
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>

                                                    <div class="info-product">
                                                        <h4><a href="#"><%=products.get(i).getProductName()%></a></h4>
                                                        <div class="price">
                                                            <span class="price-current"><%=fm.format(products.get(i).getUnitPrice())%>₫</span>
                                                        </div>
                                                        <a href="InforproductSVL?productid=<%=products.get(i).getProductID()%>" class="view-more">Xem chi tiết</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}
                                                }%>
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
    </body>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="box-footer info-contact">
                        <h3>Thông tin liên hệ</h3>
                        <div class="content-contact">
                            <p><strong>Facebook: </strong><a href="https://www.facebook.com/TrongDungFU" style="color: red">https://www.facebook.com/TrongDungFU</a></p>
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
                <!--                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
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
                        <h3>FeedBack:</h3>
                        <div class="content-contact"  >
                            <form action="InsertFeedbackSVL" method="GET" name="formfeedback">
                                <div class="row">
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
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <p id="notyFail" style="display: none">Pls Write Title and Content to Feedback !</p>
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

</html>