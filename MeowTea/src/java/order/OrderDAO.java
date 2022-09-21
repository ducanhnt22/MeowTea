/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import user.UserDTO;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String INSERT = "INSERT INTO tblOrder(userID, date) VALUES (?,?)";

    public void addOrder(UserDTO user, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            ptm = conn.prepareStatement(INSERT);
            ptm.setString(1, user.getUserID());
            ptm.setString(2, date);
        } catch (Exception e) {
        }
    }
}
