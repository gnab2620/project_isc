/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import Models.Account;
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
public class DisplayeachtypeSVL extends HttpServlet {

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
        int type = 0;
        try {
            type = Integer.parseInt(request.getParameter("type"));
        } catch (Exception e) {
            type = Integer.parseInt(String.valueOf(request.getAttribute("type")));
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //List contain search product
        ArrayList<Product> lstcontain = null;
        try {
            lstcontain = (ArrayList<Product>) request.getAttribute("lst");
        } catch (Exception e) {
        }
        Cookie[] cookies = request.getCookies();
        String name = "";
        String pass = "";
        DAO dao = new DAO();
        Account ac = null;
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("email")) {
                    name = cooky.getValue();
                }
                if (cooky.getName().equals("pass")) {
                    pass = cooky.getValue();
                }
            }
            ac = dao.getUser(name, pass);
        }
        if (lstcontain == null) {
            if (type == 0 || type == -1) {
                request.setAttribute("lst", dao.getAllProduct());
            } else {
                request.setAttribute("lst", dao.getEachTypeProduct(type));
            }
        } else {
            request.setAttribute("lst", lstcontain);
        }

        request.setAttribute("ac", ac);
        request.setAttribute("type", type);
        request.getRequestDispatcher("Dungtrongshop.jsp").forward(request, response);

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
