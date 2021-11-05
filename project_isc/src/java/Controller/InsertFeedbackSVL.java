/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NTD
 */
public class InsertFeedbackSVL extends HttpServlet {

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
            out.println("<title>Servlet InsertFeedbackSVL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertFeedbackSVL at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //FEEDBACK SHOP
        String username = request.getParameter("usernameFB");
        String emailFB = request.getParameter("emailFB");
        String phoneFB = request.getParameter("phoneFB");
        String titleFB = request.getParameter("titleFB");
        String contentFB = request.getParameter("contentFB");

        DAO dao = new DAO();
        dao.InsertFeedback(emailFB, username, phoneFB, titleFB, contentFB);
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
        //FEEDBACK A PRODUCT
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("usernameFB");
        String emailFB = request.getParameter("emailFB");
        String phoneFB = request.getParameter("phoneFB");
        String titleFB = request.getParameter("titleFB");
        String contentFB = request.getParameter("contentFB");
//        String productID1 = request.getParameter("productID");
        PrintWriter out = response.getWriter();

        int productID = Integer.parseInt(request.getParameter("productID"));
        DAO dao = new DAO();
        dao.InsertFeedbackAProduct(emailFB, username, phoneFB, titleFB, contentFB, productID);
        request.setAttribute("productid", productID);
        request.getRequestDispatcher("InforproductSVL").forward(request, response);
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
