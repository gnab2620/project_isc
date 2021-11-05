/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.Product;
import Models.QuantityProductAdd;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NTD
 */
public class DeleteSessionPrdSVL extends HttpServlet {

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
            out.println("<title>Servlet DeleteSessionPrdSVL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteSessionPrdSVL at " + request.getContextPath() + "</h1>");
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
        //Delete product in card and back to home
        String productid = request.getParameter("productid");
        int productidParse = Integer.parseInt(productid);
        HttpSession session = request.getSession();
        ArrayList<Product> lstProductincard;
        ArrayList<QuantityProductAdd> lstProductQuantity;
        try {
            lstProductincard = (ArrayList<Product>) session.getAttribute("lstProductincard");
            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
        } catch (Exception e) {
            lstProductincard = new ArrayList<>();
            lstProductQuantity = new ArrayList<>();
        }
        BigDecimal moneyTotal = new BigDecimal(0);
        boolean checkdeleteSucces = false;
        for (int i = 0; i < lstProductQuantity.size(); i++) {
            if (lstProductQuantity.get(i).getProductID().equals(productid)) {
                lstProductQuantity.remove(i);
                lstProductincard.remove(i);
                checkdeleteSucces = true;
            }
            if (checkdeleteSucces == false) {
                moneyTotal = moneyTotal.add(lstProductQuantity.get(i).getAmount());
            } else {
                i = i - 1;
            }
            checkdeleteSucces = false;
        }
        session.setAttribute("lstProductincard", lstProductincard);
        session.setAttribute("lstProductQuantity", lstProductQuantity);
        session.setAttribute("money", moneyTotal);
        session.setAttribute("card", lstProductQuantity.size());
        response.sendRedirect("LoginSVL");
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
        //Delete product in card and back to Buyproduct.jsp
        String productid = request.getParameter("productid");
        int productidParse = Integer.parseInt(productid);
//        PrintWriter out = response.getWriter();
//        out.println(productid);
        HttpSession session = request.getSession();
        ArrayList<Product> lstProductincard;
        ArrayList<QuantityProductAdd> lstProductQuantity;
        try {
            lstProductincard = (ArrayList<Product>) session.getAttribute("lstProductincard");
            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
        } catch (Exception e) {
            lstProductincard = new ArrayList<>();
            lstProductQuantity = new ArrayList<>();
        }
        BigDecimal moneyTotal = new BigDecimal(0);
        boolean checkdeleteSucces = false;
        for (int i = 0; i < lstProductQuantity.size(); i++) {
            if (lstProductQuantity.get(i).getProductID().equals(productid)) {
                lstProductQuantity.remove(i);
                lstProductincard.remove(i);
                checkdeleteSucces = true;
            }
            if (checkdeleteSucces == false) {
                moneyTotal = moneyTotal.add(lstProductQuantity.get(i).getAmount());
            } else {
                i = i - 1;
            }
            checkdeleteSucces = false;
        }
        session.setAttribute("lstProductincard", lstProductincard);
        session.setAttribute("lstProductQuantity", lstProductQuantity);
        session.setAttribute("money", moneyTotal);
        session.setAttribute("card", lstProductQuantity.size());
        response.sendRedirect("BuyProduct.jsp");
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
