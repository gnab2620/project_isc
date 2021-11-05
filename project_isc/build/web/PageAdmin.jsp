<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.OrderModel"%>
<%@page import="Models.OrderDetails"%>
<%@page import="Models.Orders"%>
<%@page import="Models.Feedback"%>
<%@page import="Models.Account"%>
<%@page import="DAL.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%
            DecimalFormat fm = new DecimalFormat("#,###.###");
            String emailAdminJoin = (String) request.getAttribute("email");
            ArrayList<Account> lstac = (ArrayList<Account>) request.getAttribute("lstAc");
            ArrayList<Product> lstdt = (ArrayList<Product>) request.getAttribute("lstDt");
            ArrayList<Product> lstmt = (ArrayList<Product>) request.getAttribute("lstMt");
            ArrayList<Product> lsttbdt = (ArrayList<Product>) request.getAttribute("lstTbdt");
            ArrayList<Feedback> lstFeedback = (ArrayList<Feedback>) request.getAttribute("lstFeedback");
            ArrayList<Feedback> lstFeedbackProduct = (ArrayList<Feedback>) request.getAttribute("lstFeedbackProduct");
            ArrayList<OrderModel> lstOrders = (ArrayList<OrderModel>) request.getAttribute("lstOrderModel");
            int sizeallPD = Integer.parseInt((String.valueOf(request.getAttribute("sizeallPD"))));
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>DungTrongShop.vn</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i">
        <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <h1>ADMIN PAGE</h1>
                    <form action="LogOutSVL" method="Get">
                        <button class="alert-danger" type="submit">Đăng Xuất</button>
                    </form>
                </div>
            </div>
        </div>
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col"><h3>LIST - ACCOUNT</h3></th>
                </tr>
            </thead>
            <thead>
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">PassWord</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Type</th>
                </tr>
            </thead>
            <tbody>
                <%for (Account ac : lstac) {%>
                <tr>
                    <th><%=ac.getUsername()%></th>
                    <td><%=ac.getPassword()%></td>
                    <td><%=ac.getPhone()%></td>
                    <td><%=ac.getEmail()%></td>
                    <td><%if (ac.getAuthority() == 1) {%>Admin<%} else {%>Customer<%}%></td>
                    <%if (ac.getAuthority() != 1 || !ac.getEmail().equals(emailAdminJoin)) {%>
            <form action="DeleteandUpdateUserSVL" method="post">
                <input name="email" value="<%=ac.getEmail()%>" type="hidden">
                <td><select name="change">
                        <option value="0">Change Type</option>
                        <option value="1" >Admin</option>
                        <option value="2">Customer</option>
                    </select>
                    <button type="submit">Save</button>
                    <button><a href="DeleteandUpdateUserSVL?email=<%=ac.getEmail()%>" style="color: red">Delete</a></button>
                </td>
            </form>
            <%}%>
        </tr>
        <%}%>
    </tbody>
</table>
<!-- LIST ORDERS -->
<table class="table table-active">
    <tr>
        <th>
            <h3 style="color: #0069d9"><strong>LIST - ORDERS</strong></h3><button id="listorder" onclick="showlist()" class="btn btn-info">Show List</button>
        </th>
    </tr>
</table>
<table class="table table-bordered"  id="bodyOrder" style="display: none; " >
    <thead >
        <tr>
            <th scope="col"><h6 style="color: blue">MÃ ĐƠN HÀNG</h6></th>
            <th scope="col"><h6 style="color: blue">MAIL</h6></th>
            <th scope="col"><h6 style="color: blue">TÊN</h6></th>
            <th scope="col"><h6 style="color: blue">SỐ ĐIỆN THOẠI</h6></th>
            <th scope="col"><h6 style="color: blue">ĐỊA CHỈ</h6></th>
            <th scope="col"><h6 style="color: blue">NGÀY ĐẶT HÀNG</h6></th>
            <th scope="col"><h6 style="color: blue">GHI CHÚ</h6></th>
            <th scope="col"><h6 style="color: blue">TỒNG TIỀN ĐƠN HÀNG</h6></th>
        </tr>
    </thead>
    <tbody>
        <%  int orderid = -1;
            for (OrderModel o : lstOrders) {
                if (orderid != o.getOrder().getOrderID()) {%>
        <tr>
            <th style="color: red"><%=o.getOrder().getOrderID()%></th>
            <th style="color: red"><%=o.getOrder().getMail()%></th>
            <th style="color: red"><%=o.getOrder().getNameReceiver()%></th>
            <th style="color: red"><%=o.getOrder().getPhone()%></th>
            <th style="color: red"><%=o.getOrder().getAddress()%></th>
            <th style="color: red"><%=o.getOrder().getOrderDate()%></th>
            <th style="color: red"><%=o.getOrder().getNote()%></th>
            <!--<th style="color: tomato">TOTAL:</th>-->
            <th><%=fm.format(o.getOrder().getTotalMoney())%></th>
            <th><%=o.getOrder().getStatus()%><% if (!o.getOrder().getStatus().equalsIgnoreCase("Đặt hàng thành công")
                        && !o.getOrder().getStatus().equalsIgnoreCase("Đơn Hàng Bị Hủy")) {%>
                <a href="OrderConfirmSVL?orderID=<%=o.getOrder().getOrderID()%>&ac=confirm">
                    <button class="btn-danger">CONFIRM</button></a>
                <a href="OrderConfirmSVL?orderID=<%=o.getOrder().getOrderID()%>&ac=delete">
                    <button class="btn-danger">Delete</button></a>
                    <%}%>
            </th>
        </tr>
    <th scope="col"><h6 style="color: blue"></h6></th>
    <th scope="col"><h6 style="color: blue"></h6></th>
    <th scope="col"><h7 style="color: blue">Mã sản phẩm</h7></th>
    <th scope="col"><h7 style="color: blue">Sản phẩm</h7></th>
<th scope="col"><h7 style="color: blue">Số lượng</h7></th>
<th scope="col"><h7 style="color: blue">Tổng tiền sản phẩm</h7></th>
    <%}%>

<tr>
    <th></th>
    <th></th>
    <th><%=o.getOrderDetails().getProductID() %></th>
    <th><img src="<%=o.getOrderDetails().getUrlPRD()%>" width="50rem" height="50rem"></th>
    <th><%=o.getOrderDetails().getQuantity()%></th>
    <th><%=fm.format(o.getOrderDetails().getAmount())%></th>
</tr>
<tr>
    <th></th>
    <th></th>
    <th></th>

</tr>    
<% orderid = o.getOrder().getOrderID();
    }%>
</tbody>
</table>
<!-- ADD PRODUCT -->
<table class="table table-active" >
    <thead>
        <tr>
            <th scope="col"><button id="value" onclick="addProduct()" class="btn btn-info">Add more product</button></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <form action="InsertProductSVL" method="get">
        <thead id="addProduct" style="display: none">
            <tr>
                <th scope="row">ProductName:</th>
                <td><input type="text" name="prdName"></td>
            </tr>
            <tr>
                <th scope="row">Type: </th>
                <td><select name="prdCategoryid">
                        <option value="1">1 - Điện thoại</option>
                        <option value="2">2 - Máy Tính</option>
                        <option value="3">3 - Khác</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th scope="row">UnitPrice:</th>
                <td><input type="number" name="prdPrice" min="0"></td>
            </tr>
            <tr>
                <th scope="row">UnitsInStock:</th>
                <td><input type="number" name="prdStock"  min="0"></td>
            </tr>
            <tr>
                <th scope="row">Imange (must choose image in this Project):</th>
                <td><input type="file" accept="image/*" name="prdImageurl"></td>
            </tr>
            <tr><th></th><th style="color: blue">DESCRIPTION ABOUT PRODUCT BELOW: </th></tr>

            <tr>
                <th scope="row">Screen:</th>
                <td><input type="text" name="desScreen"></td>
            </tr><tr>
                <th scope="row">Rear camera: :</th>
                <td><input type="text" name="desCamerasau"></td>
            </tr><tr>
                <th scope="row">Front camera::</th>
                <td><input type="text" name="desCameratruoc"></td>
            </tr><tr>
                <th scope="row">Cpu:</th>
                <td><input type="text" name="desCpu"></td>
            </tr><tr>
                <th scope="row">Ram:</th>
                <td><input type="text" name="desRam"></td>
            </tr><tr>
                <th scope="row">Memory:</th>
                <td><input type="text" name="desMemory"></td>
            </tr><tr>
                <th scope="row">Sim:</th>
                <td><input type="text" name="desSim"></td>
            </tr><tr>
                <th scope="row">Made in:</th>
                <td><input type="text" name="desMadein"></td>
            </tr><tr>
                <th scope="row">Operating system:</th>
                <td><input type="text" name="desOs"></td>
            </tr><tr>
                <th scope="row">Waterproof:</th>
                <td><input type="text" name="desWaterproof"></td>
            </tr>
            <tr>
                <th></th>
                <th><input type="submit" value="ADD" class="btn btn-danger"> </th>
            </tr>
        </thead>
    </form>
</table>
<!-- Product -->
<h3 style="color: red; margin-left: 600px" ><strong>LIST - PRODUCT</strong></h3>
<!-- Dien thoai -->
<h4 style="color: #0069d9; margin-left: 20px">Điện Thoại: <%=lstdt.size()%> Sản phẩm</h4>
<table class="table table-bordered">
    <tr>
        <th style="color: red">Mã Sản Phẩm</th>
        <th style="color: red">Tên Sản Phẩm</th>
        <th style="color: red">Giá</th>
        <th style="color: red">Số Lượng</th>
        <th style="color: red">Đã Bán</th>
    </tr>
    <%for (Product p : lstdt) {%>
    <tr>
    <input type="hidden" name="url" value="<%=p.getUrl()%>">
    <th><%=p.getProductID()%></th>
    <th><%=p.getProductName()%></th>
    <th><%=fm.format(p.getUnitPrice())%></th>
    <th><%=p.getUnitsinStock()%></th>
    <th><%=p.getUnitsOnOrder()%></th>
    <th><a href="EditProduct.jsp?pid=<%=p.getProductID()%>"</a>EDIT</th>
    <th><a href="DeleteProductSVL?productid=<%=p.getProductID()%>">DELETE</a></th>
</tr>
<%}%>
</table>
<!-- May tinh -->
<h4 style="color: #0069d9;margin-left: 20px">Máy Tính: <%=lstmt.size()%> Sản phẩm</h4>
<table class="table table-bordered">
    <tr>
        <th style="color: red">Mã Sản Phẩm</th>
        <th style="color: red">Tên Sản Phẩm</th>
        <th style="color: red">Giá</th>
        <th style="color: red">Số Lượng</th>
        <th style="color: red">Đã Bán</th>
    </tr>
    <%for (Product p : lstmt) {%>
    <tr>
    <input type="hidden" name="url" value="<%=p.getUrl()%>">
    <th><%=p.getProductID()%></th>
    <th><%=p.getProductName()%></th>
    <th><%=fm.format(p.getUnitPrice())%></th>
    <th><%=p.getUnitsinStock()%></th>
    <th><%=p.getUnitsOnOrder()%></th>
    <th><a href="EditProduct.jsp?pid=<%=p.getProductID()%>"</a>EDIT</th>
    <th><a href="DeleteProductSVL?productid=<%=p.getProductID()%>">DELETE</a></th>
</tr>
<%}%>
</table>
<!-- San Pham Khac -->
<h4 style="color: #0069d9;margin-left: 20px">Các Thiết Bị Khác: <%=lsttbdt.size()%> Sản phẩm</h4>
<table class="table table-bordered">
    <tr>
        <th style="color: red">Mã Sản Phẩm</th>
        <th style="color: red">Tên Sản Phẩm</th>
        <th style="color: red">Giá</th>
        <th style="color: red">Số Lượng</th>
        <th style="color: red">Đã Bán</th>
    </tr>
    <%for (Product p : lsttbdt) {%>
    <tr>
    <input type="hidden" name="url" value="<%=p.getUrl()%>">
    <th><%=p.getProductID()%></th>
    <th><%=p.getProductName()%></th>
    <th><%=fm.format(p.getUnitPrice())%></th>
    <th><%=p.getUnitsinStock()%></th>
    <th><%=p.getUnitsOnOrder()%></th>
    <th><a href="EditProduct.jsp?pid=<%=p.getProductID()%>"</a>EDIT</th>
    <th><a href="DeleteProductSVL?productid=<%=p.getProductID()%>">DELETE</a></th>
</tr>
<%}%>
</table>

<table class="table table-bordered">
    <thead>
        <tr>
            <th scope="col"><h5 style="color: tomato">FEEDBACK SHOP</h5><button id="innerValue" onclick="Feedbackad()" class="btn btn-danger">SHOW FEEDBACK</button></th>
        </tr>
    </thead>
    <tbody id="fb" style="display: none"><tr>
            <th scope="col"><h6 style="color: blue">TITLE </h6></th>
            <th scope="col"><h6 style="color: blue">CONTENT</h6></th>
            <th scope="col"><h6 style="color: blue">SENDER</h6></th>
            <th scope="col"><h6 style="color: blue">EMAIL</h6></th>
            <th scope="col"><h6 style="color: blue">PHONE</h6></th>
        </tr>
        <%for (Feedback f : lstFeedback) {%> 
        <tr>
            <th><%=f.getTitle()%></th>
            <th><%=f.getContent()%></th>
            <th><%=f.getName()%></th>
            <th><%=f.getEmail()%></th>
            <th><%=f.getPhone()%></th>

        </tr>
        <%}%>
    </tbody>
    <thead><tr>
            <th scope="col"><h5 style="color: tomato">FEEDBACK OF PRODUCT</h5><button id="innerValue2" onclick="Feedback2ad()" class="btn btn-danger">SHOW FEEDBACK</button></th>
        </tr>
    </thead>
    <tbody id="fb2" style="display: none">
        <tr>
            <th scope="col"><h6 style="color: blue">TITLE </h6></th>
            <th scope="col"><h6 style="color: blue">ID PRODUCT </h6></th>
            <th scope="col"><h6 style="color: blue">CONTENT</h6></th>
            <th scope="col"><h6 style="color: blue">SENDER</h6></th>
            <th scope="col"><h6 style="color: blue">EMAIL</h6></th>
            <th scope="col"><h6 style="color: blue">PHONE</h6></th>
        </tr>
        <%for (Feedback f : lstFeedbackProduct) {%> 
        <tr>
            <th><%=f.getTitle()%></th>
            <th><%=f.getProductID()%></th>
            <th><%=f.getContent()%></th>
            <th><%=f.getName()%></th>
            <th><%=f.getEmail()%></th>
            <th><%=f.getPhone()%></th>
        </tr>
        <%}%>
    </tbody>
</table>
<script>
    function showlist() {
        if (document.getElementById("listorder").innerHTML !== "Hide") {
            document.getElementById("listorder").innerHTML = "Hide";
            document.getElementById("bodyOrder").style.display = "block";
        } else {
            document.getElementById("listorder").innerHTML = "Show List";
            document.getElementById("bodyOrder").style.display = "none";
        }
    }
</script>
<script src="js/newjs.js"></script>
<script src="libs/jquery-3.4.1.min.js"></script>
<script src="libs/bootstrap/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<div id="fb-root"></div>

</body>

</html>