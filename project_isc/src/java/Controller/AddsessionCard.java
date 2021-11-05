/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.Product;
import Models.QuantityProductAdd;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NTD
 */
public class AddsessionCard extends HttpServlet {

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
            out.println("<title>Servlet Addsvl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Addsvl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3600 * 24);
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        BigDecimal moneyTotal = new BigDecimal(0);
        ArrayList<Product> lstProductincard;
        ArrayList<QuantityProductAdd> lstProductQuantity;
        try {
            lstProductincard = (ArrayList<Product>) session.getAttribute("lstProductincard");
            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
            if (lstProductQuantity == null || lstProductincard == null) {
                lstProductincard = new ArrayList<>();
                lstProductQuantity = new ArrayList<>();
            }
        } catch (Exception e) {
            lstProductincard = new ArrayList<>();
            lstProductQuantity = new ArrayList<>();
        }
        String productid = request.getParameter("productid");
        int productidParse = Integer.parseInt(productid);
        boolean checkContain = false;
        //Check het hang
        boolean checkOrder = false;
        for (int i = 0; i < lstProductQuantity.size(); i++) {
            if (lstProductQuantity.get(i).getProductID().equals(productid)) {
                int newQuantity = lstProductQuantity.get(i).getQuantity() + 1;
                BigDecimal newAmount = dao.getoneProduct(productidParse).getUnitPrice().multiply(new BigDecimal(newQuantity));
                lstProductQuantity.get(i).setQuantity(newQuantity);
                lstProductQuantity.get(i).setAmount(newAmount);
                checkContain = true;
            }
            moneyTotal = moneyTotal.add(lstProductQuantity.get(i).getAmount());
        }
        if (checkContain == false) {
            Product p = dao.getoneProduct(productidParse);
            if (p.getUnitsinStock() > p.getUnitsOnOrder()) {
                lstProductincard.add(p);
                lstProductQuantity.add(new QuantityProductAdd(productid, 1, p.getUnitPrice()));//Product =1 -> amount = price*1
                moneyTotal = moneyTotal.add(p.getUnitPrice());
            } else {
                checkOrder = true;
                out.println("<script type=\"text/javascript\">");
                out.println("alert('San Pham Da Het! Moi Quy Khach Quay Lai Sau');");
                out.println("location='LoginSVL';");
                out.println("</script>");
            }
        }
        session.setAttribute("lstProductincard", lstProductincard);
        session.setAttribute("lstProductQuantity", lstProductQuantity);
        session.setAttribute("money", moneyTotal);
        session.setAttribute("card", lstProductQuantity.size());
        if (checkOrder == false) {
            response.sendRedirect("LoginSVL");
        }
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
//        
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        HttpSession session = request.getSession();
//        session.setMaxInactiveInterval(3600 * 24);
//        PrintWriter out = response.getWriter();
//        DAO dao = new DAO();
//        BigDecimal moneyTotal = new BigDecimal(0);
//        ArrayList<Product> lstProductincard;
//        ArrayList<QuantityProductAdd> lstProductQuantity;
//        try {
//            lstProductincard = (ArrayList<Product>) session.getAttribute("lstProductincard");
//            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
//            if (lstProductQuantity == null || lstProductincard == null) {
//                lstProductincard = new ArrayList<>();
//                lstProductQuantity = new ArrayList<>();
//            }
//        } catch (Exception e) {
//            lstProductincard = new ArrayList<>();
//            lstProductQuantity = new ArrayList<>();
//        }
//        String productid = request.getParameter("productid");
//        int productidParse = Integer.parseInt(productid);
////        
//        out.println("Prdidpare" + productidParse);
//        boolean checkContain = false;
//        for (int i = 0; i < lstProductQuantity.size(); i++) {
//            if (lstProductQuantity.get(i).getProductID().equals(productid)) {
//                int newQuantity = lstProductQuantity.get(i).getQuantity() + 1;
//                BigDecimal newAmount = dao.getoneProduct(productidParse).getUnitPrice().multiply(new BigDecimal(newQuantity));
//                lstProductQuantity.get(i).setQuantity(newQuantity);
//                lstProductQuantity.get(i).setAmount(newAmount);
//                checkContain = true;
//            }
//            moneyTotal = moneyTotal.add(lstProductQuantity.get(i).getAmount());
//        }
//        if (checkContain == false) {
//            Product p = dao.getoneProduct(productidParse);
//            lstProductincard.add(p);
//            lstProductQuantity.add(new QuantityProductAdd(productid, 1, p.getUnitPrice()));//Product =1 -> amount = price*1
//            moneyTotal = moneyTotal.add(p.getUnitPrice());
//        }
//        request.setAttribute("productid", productid);
//        session.setAttribute("lstProductincard", lstProductincard);
//        session.setAttribute("lstProductQuantity", lstProductQuantity);
//        session.setAttribute("money", moneyTotal);
//        session.setAttribute("card", lstProductQuantity.size());
//        request.getRequestDispatcher("InforproductSVL").forward(request, response);
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
