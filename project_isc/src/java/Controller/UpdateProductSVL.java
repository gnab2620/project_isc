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
public class UpdateProductSVL extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int productid = Integer.parseInt(String.valueOf(request.getParameter("pid")));
            String name = request.getParameter("pname");
            String url = request.getParameter("url");
            String newurl = request.getParameter("newurl");
            if (!newurl.equals("")) {
                url = "images/imgProduct/" + newurl;
            }
            int order = Integer.parseInt(request.getParameter("order"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            BigDecimal pgia = new BigDecimal(String.valueOf(request.getParameter("pgia")));
            int psoluong = Integer.parseInt(String.valueOf(request.getParameter("psoluong")));
            String pmanhinh = request.getParameter("pmanhinh");
            String pcamsau = request.getParameter("pcamsau");
            String pcamtruoc = request.getParameter("pcamtruoc");
            String pcpu = request.getParameter("pcpu");
            String pram = request.getParameter("pram");
            String pbonhotrong = request.getParameter("pbonhotrong");
            String psim = request.getParameter("psim");
            String psanxuattai = request.getParameter("psanxuattai");
            String phedieuhanh = request.getParameter("phedieuhanh");
            String pchongnuoc = request.getParameter("pchongnuoc");

            Product p = new Product(productid, name, categoryID, pgia, psoluong, order, url);
            ProductDescription pdes = new ProductDescription(productid, pmanhinh, pcamsau, pcamtruoc, pcpu, pram, pbonhotrong, psim, psanxuattai, phedieuhanh, pchongnuoc);
            DAO dao = new DAO();
            dao.UpdateProduct(p, pdes);
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
