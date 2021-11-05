<%-- 
    Document   : EditProduct
    Created on : Nov 16, 2020, 8:51:33 PM
    Author     : NTD
--%>

<%@page import="Models.Product"%>
<%@page import="Models.ProductDescription"%>
<%@page import="DAL.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        int productid = Integer.parseInt(String.valueOf(request.getParameter("pid")));
        DAO dao = new DAO();
        Product p = dao.getoneProduct(productid);
        ProductDescription pdes = dao.GetProductDesCrip(productid);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <form action="UpdateProductSVL" method="post" >
            <h1><strong  style="color: red" >EDIT PRODUCT</strong></h1>
            <table class="table table-bordered">
                <tr>
                    <th>Mã Sản Phẩm:</th>
                    <th><input type="text" value="<%=productid%>" name="pid" readonly></th>
                    <th><input type="hidden" value="<%=p.getUrl()%>" name="url"></th>
                    <th><input type="hidden" value="<%=p.getCategoryID() %>" name="categoryID"></th>
                    <th><input type="hidden" value="<%=p.getUnitsOnOrder() %>" name="order"></th>
                </tr>
                <tr>
                    <th>Tên Sản Phẩm: </th>
                    <th><input type="text" value="<%=p.getProductName()%>" name="pname"></th>
                </tr>
                <tr>
                    <th>Số lượng: </th>
                    <th><input type="text" value="<%=p.getUnitsinStock()%>" name="psoluong"></th>
                </tr>
                <tr>
                    <th>Đường dẫn ảnh: </th>
                    <th><input type="file" name="newurl" accept="image/*"></th>
                </tr>
                <tr>
                    <th>Giá: </th>
                    <th><input type="text"value="<%=p.getUnitPrice()%>" name="pgia"></th>
                </tr>
                <tr>
                    <th>Màn Hình: </th>
                    <th><input type="text"value="<%=pdes.getManhinh()%>" name="pmanhinh"></th>
                </tr>
                <tr>
                    <th>Camera Sau: </th>
                    <th><input type="text"value="<%=pdes.getCamerasau()%>" name="pcamsau"></th>
                </tr>
                <tr>
                    <th>Came Trước: </th>
                    <th><input type="text"value="<%=pdes.getCameratruoc()%>" name="pcamtruoc"></th>
                </tr>
                <tr>
                    <th>CPU: </th>
                    <th><input type="text"value="<%=pdes.getCpu()%>" name="pcpu"></th>
                </tr>
                <tr>
                    <th>Ram: </th>
                    <th><input type="text"value="<%=pdes.getRam()%>" name="pram"></th>
                </tr>
                <tr>
                    <th>Bộ nhớ trong: </th>
                    <th><input type="text"value="<%=pdes.getBonhotrong()%>" name="pbonhotrong"></th>
                </tr>
                <tr>
                    <th>Sim: </th>
                    <th><input type="text"value="<%=pdes.getSim()%>" name="psim"></th>
                </tr>
                <tr>
                    <th>Sản xuất tại: </th>
                    <th><input type="text"value="<%=pdes.getSanxuattai()%>" name="psanxuattai"></th>
                </tr>
                <tr>
                    <th>Hệ điều hành: </th>
                    <th><input type="text"value="<%=pdes.getHeieuhanh()%>" name="phedieuhanh"></th>
                </tr>
                <tr>
                    <th>Chống nước: </th>
                    <th><input type="text"value="<%=pdes.getChongnuoc()%>" name="pchongnuoc"></th>
                </tr>
            </table>
                <input type="submit" value="Update" style="margin-left: 458px" class="btn-danger">
        </form>
    </body>
</html>
