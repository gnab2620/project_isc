/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.Product;
import Models.ProductDescription;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NTD
 */
public class InsertProductSVL extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            DAO dao = new DAO();
            String prdName = request.getParameter("prdName");
            int prdCategoryid = Integer.parseInt(request.getParameter("prdCategoryid"));
            BigDecimal prdPrice = new BigDecimal(request.getParameter("prdPrice"));
            int prdStock = Integer.parseInt(request.getParameter("prdStock"));
            String prdImageurl = request.getParameter("prdImageurl");

            String desScreen = request.getParameter("desScreen");
            String desCamerasau = request.getParameter("desCamerasau");
            String desCameratruoc = request.getParameter("desCameratruoc");
            String desCpu = request.getParameter("desCpu");
            String desRam = request.getParameter("desRam");
            String desMemory = request.getParameter("desMemory");
            String desSim = request.getParameter("desSim");
            String desMadein = request.getParameter("desMadein");
            String desOs = request.getParameter("desOs");
            String desWaterproof = request.getParameter("desWaterproof");

            Product p = new Product(0, prdName, prdCategoryid, prdPrice, prdStock, 0, prdImageurl);
            ProductDescription pdes = new ProductDescription(0, desScreen, desCamerasau, desCameratruoc, desCpu, desRam, desMemory, desSim, desMadein, desOs, desWaterproof);

            dao.InsertProduct(p, pdes);
            response.sendRedirect("PageAdminSVL");

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
