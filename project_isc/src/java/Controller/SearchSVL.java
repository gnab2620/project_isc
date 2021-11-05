/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.Product;
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
public class SearchSVL extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchSVL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchSVL at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int type = Integer.parseInt(request.getParameter("input"));
//        String txtsearch = request.getParameter("txtsearch");
//        DAO dao = new DAO();
//        ArrayList<Product> lstoftype = new ArrayList<>();
//        ArrayList<Product> lstcontain = new ArrayList<>();
//        if (type == 0) {
//            lstoftype = dao.getAllProduct();
//        } else {
//            lstoftype = dao.getEachTypeProduct(type);
//        }
//        for (Product product : lstoftype) {
//            if (product.getProductName().toLowerCase().contains(txtsearch.toLowerCase())) {
//                lstcontain.add(product);
//            }
//        }
//        request.setAttribute("lst", lstcontain);
//        request.getRequestDispatcher("LoginSVL").forward(request, response);
        
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
        int type = Integer.parseInt(request.getParameter("input"));
        String txtsearch = request.getParameter("txtsearch");
        DAO dao = new DAO();
        ArrayList<Product> lstoftype = new ArrayList<>();
        ArrayList<Product> lstcontain = new ArrayList<>();
        if (type == 0) {
            lstoftype = dao.getAllProduct();
        } else {
            lstoftype = dao.getEachTypeProduct(type);
        }
        for (Product product : lstoftype) {
            if (product.getProductName().toLowerCase().contains(txtsearch.toLowerCase())) {
                lstcontain.add(product);
            }
        }
        request.setAttribute("type", type);
        request.setAttribute("lst", lstcontain);
        request.getRequestDispatcher("DisplayeachtypeSVL").forward(request, response);
        
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
