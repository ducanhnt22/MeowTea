/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.Cart;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author Admin
 */
public class AddController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "viewProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String img = request.getParameter("images");
            String name = request.getParameter("pName");
            String productID = request.getParameter("productID");
            int price = Integer.parseInt(request.getParameter("pPrice"));
            String categoryName = request.getParameter("pCategoryName");
            int quantity = Integer.parseInt(request.getParameter("cQuantity"));
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> viewProduct = dao.ViewProduct();
            if (viewProduct.size() > 0) {
                request.setAttribute("VIEW_PRODUCT", viewProduct);
            }
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                ProductDTO product = new ProductDTO(img, name, productID, price, categoryName, quantity);
                if (cart == null) {
                    cart = new Cart();
                }
                cart.add(product);
                session.setAttribute("CART", cart);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at Add Controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
