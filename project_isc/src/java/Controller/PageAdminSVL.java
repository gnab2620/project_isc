/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.Account;
import Models.Feedback;
import Models.OrderDetails;
import Models.OrderModel;
import Models.Orders;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NTD
 */
public class PageAdminSVL extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAO dao = new DAO();
            String email = null;
            email = (String) request.getAttribute("email");
            if (email == null) {
                Cookie cookies[] = request.getCookies();
                for (Cookie cooky : cookies) {
                    if (cooky.getName().equals("email")) {
                        email = cooky.getValue();
                    }
                }
            }
            ArrayList<Account> lstAccount = dao.getAllAccount();
            ArrayList<Product> lstDienthoai = dao.getEachTypeProduct(1);
            ArrayList<Product> lstMaytinh = dao.getEachTypeProduct(2);
            ArrayList<Product> lstThietbidientu = dao.getEachTypeProduct(3);
            ArrayList<Feedback> lstFeedback = dao.getFeedback("Feedbackshop");
            ArrayList<Feedback> lstFeedbackProduct = dao.getFeedback("Product");
            ArrayList<OrderModel> lstOrderModel = dao.getAllOrder();

            int sizeall = dao.getAllProduct().size();
            request.setAttribute("email", email);
            request.setAttribute("sizeallPD", sizeall);
            request.setAttribute("lstAc", lstAccount);
            request.setAttribute("lstDt", lstDienthoai);
            request.setAttribute("lstMt", lstMaytinh);
            request.setAttribute("lstTbdt", lstThietbidientu);
            request.setAttribute("lstFeedback", lstFeedback);
            request.setAttribute("lstFeedbackProduct", lstFeedbackProduct);
            request.setAttribute("lstOrderModel", lstOrderModel);
            request.getRequestDispatcher("PageAdmin.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
