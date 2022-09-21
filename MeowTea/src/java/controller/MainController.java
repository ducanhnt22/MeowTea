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

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String VIEW_PRODUCT = "View";
    private static final String VIEW_PRODUCT_CONTROLLER = "ViewProductController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";
    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_CONTROLLER = "viewCart.jsp";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String VIEW_USER = "ViewUser";
    private static final String VIEW_USER_CONTROLLER = "ViewUserController";
    private static final String SEARCH_USER = "search";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String UPDATE_USER = "Update";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";
    private static final String DELETE_USER = "Delete";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";
    private static final String VIEW_PRODUCT_MANAGEMENT = "ViewProductManager";
    private static final String VIEW_PRODUCT_MANAGEMENT_CONTROLLER = "ViewProductManagerController";
    private static final String SEARCH_PRODUCT_MANAGEMENT = "SearchProduct";
    private static final String SEARCH_PRODUCT_MANAGEMENT_CONTROLLER = "SearchProductManagerController";
    private static final String UPDATE_PRODUCT_MANAGEMENT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_MANAGEMENT_CONTROLLER = "UpdateProductManagerController";
    private static final String DELETE_PRODUCT_MANAGEMENT = "DeleteProduct";
    private static final String DELETE_PRODUCT_MANAGEMENT_CONTROLLER = "DeleteProductManagerController";
    private static final String CHECKOUT = "CheckOut";
    private static final String CHECKOUT_CONTROLLER = "checkout.jsp";
    private static final String PURCHASE = "Purchase";
    private static final String PURCHASE_CONTROLLER = "PurchaseController";
    private static final String LOGIN_GOOGLE = "GoogleLogin";
    private static final String LOGIN_GOOGLE_CONTROLLER = "GoogleLoginHandler";
    private static final String ADD_PRODUCT_MANAGER = "AddProduct";
    private static final String ADD_PRODUCT_MANAGER_CONTROLLER = "AddProductManagerController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (VIEW_PRODUCT.equals(action)) {
                url = VIEW_PRODUCT_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            } else if (VIEW_USER.equals(action)) {
                url = VIEW_USER_CONTROLLER;
            } else if (UPDATE_USER.equals(action)) {
                url = UPDATE_USER_CONTROLLER;
            } else if (DELETE_USER.equals(action)) {
                url = DELETE_USER_CONTROLLER;
            } else if (VIEW_PRODUCT_MANAGEMENT.equals(action)) {
                url = VIEW_PRODUCT_MANAGEMENT_CONTROLLER;
            } else if (SEARCH_PRODUCT_MANAGEMENT.equals(action)) {
                url = SEARCH_PRODUCT_MANAGEMENT_CONTROLLER;
            } else if (UPDATE_PRODUCT_MANAGEMENT.equals(action)) {
                url = UPDATE_PRODUCT_MANAGEMENT_CONTROLLER;
            } else if (DELETE_PRODUCT_MANAGEMENT.equals(action)) {
                url = DELETE_PRODUCT_MANAGEMENT_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (PURCHASE.equals(action)) {
                url = PURCHASE_CONTROLLER;
            } else if (LOGIN_GOOGLE.equals(action)) {
                url = LOGIN_GOOGLE_CONTROLLER;
            } else if (ADD_PRODUCT_MANAGER.equals(action)) {
                url = ADD_PRODUCT_MANAGER_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
