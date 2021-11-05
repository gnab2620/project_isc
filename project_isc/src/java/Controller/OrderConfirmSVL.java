/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NTD
 */
public class OrderConfirmSVL extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Admin goi
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int orderID = Integer.parseInt(String.valueOf(request.getParameter("orderID")));
        String action = request.getParameter("ac");
        String status;
        DAO dao = new DAO();
        if (action.equalsIgnoreCase("confirm")) {
            status = "Đặt hàng thành công";
            ArrayList<OrderDetails> lstOrderDetails = dao.getAllordersDetails();
            for (OrderDetails o : lstOrderDetails) {
                if (o.getOrderID() == orderID) {
                    dao.UpdateProductOrder(o.getProductID(), dao.getoneProduct(o.getProductID()).getUnitsOnOrder() + o.getQuantity());
                }
            }
        } else {
            status = "Đơn Hàng Bị Hủy";
        }
        dao.UpdateStatusOrder(orderID, status);
        response.sendRedirect("PageAdminSVL");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Ngươi dung goi
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        int orderID = Integer.parseInt(String.valueOf(request.getParameter("orderID")));
//        String action = request.getParameter("ac");
//        String status;
//        DAO dao = new DAO();
//        if (action.equalsIgnoreCase("confirm")) {
//            status = "Đặt hàng thành công";
//            ArrayList<OrderDetails> lstOrderDetails = dao.getAllordersDetails();
//            for (OrderDetails o : lstOrderDetails) {
//                if (o.getOrderID() == orderID) {
//                    dao.UpdateProductOrder(o.getProductID(), dao.getoneProduct(o.getProductID()).getUnitsOnOrder() + o.getQuantity());
//                }
//            }
//        } else {
//            status = "Đơn Hàng Bị Hủy";
//        }
//        dao.UpdateStatusOrder(orderID, status);
//        response.sendRedirect("PageAdminSVL");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
