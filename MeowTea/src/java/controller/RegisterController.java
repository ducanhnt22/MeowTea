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
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        boolean checkValidation = true;
        UserDAO dao = new UserDAO();
        try {
            String userID = request.getParameter("userID");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                userError.setUserID("Duplicate UserID!");
                checkValidation = false;
            }

            if (userID.length() > 10 || userID.length() < 2) {
                userError.setUserID("User ID must between 3-9 character!");
                checkValidation = false;
            }

            if (name.length() > 50 || name.length() < 2) {
                userError.setName("Username must between 3-50 character!");
                checkValidation = false;
            }

            boolean checkEmail = email.matches("^[\\w-_.+]*[\\w-_.]@([\\w]+\\.)+[\\w]+[\\w]$");
            if (!checkEmail) {
                userError.setEmail("Wrong email format! Example email: abc@email.com!");
                checkValidation = false;
            }

            boolean checkPhone = phone.matches("^\\d{10,12}$");
            if (!checkPhone) {
                userError.setPhone("Wrong phone format! Phone must be numbers between 10-12 character!");
                checkValidation = false;
            }

            if (!confirm.equals(password)) {
                userError.setConfirm("Password and confirm password must be the same!");
                checkValidation = false;
            }

            if (checkValidation) {
                UserDTO user = new UserDTO(userID, name, phone, address, email, roleID, password);
                boolean checkInsert = dao.insert(user);
                if (checkInsert) {
                    url = SUCCCESS;
                } else {
                    userError.setError("Error!");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at RegisterController at: " + e.toString());
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
