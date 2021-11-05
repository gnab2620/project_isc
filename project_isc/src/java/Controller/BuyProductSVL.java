/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.Account;
import Models.Product;
import Models.QuantityProductAdd;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NTD
 */
public class BuyProductSVL extends HttpServlet {

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
            out.println("<title>Servlet BuyProductSVL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyProductSVL at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Click Mua hang
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3600 * 24);
        DAO dao = new DAO();
        PrintWriter out = response.getWriter();
        //CLICK BUY IN PRODUCT
        String productid = request.getParameter("productid");
        String operator = request.getParameter("operator");
        //Check Het Hang
        boolean checkOrder = false;
        if (productid != null) {
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
            int productidParse = Integer.parseInt(productid);
            boolean checkContain = false;
            for (int i = 0; i < lstProductQuantity.size(); i++) {
                if (lstProductQuantity.get(i).getProductID().equals(productid)) {
                    int newQuantity = lstProductQuantity.get(i).getQuantity();
                    if (operator != null && operator.equals("sub")) {
                        if (newQuantity != 1) {
                            newQuantity -= 1;
                        }
                    } else {
                        if (newQuantity < (lstProductincard.get(i).getUnitsinStock() - lstProductincard.get(i).getUnitsOnOrder())) {
                            newQuantity += 1;
                        }
                    }
                    // Tinh Tien
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
        }
//        //CLICK BUY IN SHOOPINGCARD
        Cookie[] cookies = request.getCookies();
        String email = "";
        String pass = "";
        String username = "";
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("email")) {
                    email = cooky.getValue();
                }
                if (cooky.getName().equals("pass")) {
                    pass = cooky.getValue();
                }
            }
            Account ac = dao.getUser(email, pass);
            if (ac != null) {
                request.setAttribute("ac", ac);
                if (checkOrder == false) {
                    request.getRequestDispatcher("BuyProduct.jsp").forward(request, response);
                }
            } else {
                if (checkOrder == false) {
                    response.sendRedirect("Login.jsp");
                }
            }
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
        //Điền thông tĩn xác nhận mua
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String receiver = request.getParameter("reciever");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        BigDecimal money = new BigDecimal(String.valueOf(session.getAttribute("money")));

        Date date = new Date();
        SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date datesql = java.sql.Date.valueOf(fm.format(date));

        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        ArrayList<QuantityProductAdd> lstProductQuantity;
        try {
            lstProductQuantity = (ArrayList<QuantityProductAdd>) session.getAttribute("lstProductQuantity");
            dao.InsertOrder(email, receiver, phone, address, datesql, "chờ xử lý", note, money);
            for (QuantityProductAdd q : lstProductQuantity) {
                int productID = Integer.parseInt(q.getProductID());
                Product p = dao.getoneProduct(productID);
                dao.InsertOrderDetails(productID, q.getQuantity(), q.getAmount(), p.getUrl());
            }
        } catch (Exception e) {
            lstProductQuantity = null;
        }
        //Xoa session
        Enumeration<String> attributes = request.getSession().getAttributeNames();
        while (attributes.hasMoreElements()) {
            String attribute = (String) attributes.nextElement();
            session.removeAttribute(attribute);
        }
        response.sendRedirect("LoginSVL");

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
