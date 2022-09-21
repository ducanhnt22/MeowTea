/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;
import product.ProductError;

/**
 *
 * @author Admin
 */
public class AddProductManagerController extends HttpServlet {

    private static final String ERROR = "addProduct.jsp";
    private static final String SUCCESS = "ViewProductManagerController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError error = new ProductError();
        boolean checkValidation = true;
        ProductDAO dao = new ProductDAO();
        try {
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            String image = request.getParameter("img");

            boolean checkDuplicate = dao.checkDuplicate(productID);
            if (checkDuplicate) {
                error.setProductID("Duplicate product ID!");
                checkValidation = false;
            }

            if (productID.length() > 10) {
                error.setProductID("Product ID must lower 10 character!");
                checkValidation = false;
            }

            if (name.length() > 50) {
                error.setpName("Product name must lower 50 characters!");
                checkValidation = false;
            }

            if (checkValidation) {
                ProductDTO product = new ProductDTO(productID, name, price, quantity, categoryID, image);
                boolean checkInsert = dao.insert(product);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    error.setError("Error!");
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", error);
            }

        } catch (Exception e) {
            log("Error at Add Product Manager Controller: " + e.toString());
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
