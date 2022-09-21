/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    private static final String SEARCH = "SELECT pro.productID, pro.name, pro.price, pro.quantity, cat.categoryID ,cat.categoryName, pro.images FROM tblProduct pro, tblCategory cat WHERE name like ? and pro.categoryID = cat.categoryID";
    private static final String VIEW = "SELECT pro.productID, pro.name, pro.price, pro.quantity, cat.categoryID ,cat.categoryName, pro.images FROM tblProduct pro, tblCategory cat WHERE pro.categoryID = cat.categoryID";
    private static final String UPDATE = "UPDATE tblProduct SET name = ?, price = ?, quantity = ?, categoryID = ?, images = ? WHERE productID = ?";
    private static final String DELETE = "DELETE tblProduct WHERE productID = ?";
    private static final String CHECK_DUPLICATE = "SELECT productID FROM tblProduct WHERE productID = ?";
    private static final String INSERT = "INSERT INTO tblProduct(productID, name, price, quantity, categoryID, images) VALUES(?,?,?,?,?,?)";

    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    int price = Integer.parseInt(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    String images = rs.getString("images");
                    listProduct.add(new ProductDTO(productID, name, price, quantity, categoryID, categoryName, images));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public List<ProductDTO> ViewProduct() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW);
//                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    int price = Integer.parseInt(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    String images = rs.getString("images");
                    listProduct.add(new ProductDTO(productID, name, price, quantity, categoryID, categoryName, images));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getpName());
                ptm.setString(2, Integer.toString(product.getpPrice()));
                ptm.setString(3, Integer.toString(product.getQuantity()));
                ptm.setString(4, product.getCategoryID());
                ptm.setString(5, product.getImages());
                ptm.setString(6, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getpName());
                ptm.setString(3, Integer.toString(product.getpPrice()));
                ptm.setString(4, Integer.toString(product.getQuantity()));
                ptm.setString(5, product.getCategoryID());
                ptm.setString(6, product.getImages());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

//    public static void main(String[] args) throws SQLException {
//        ProductDAO dao = new ProductDAO();
////        List<ProductDTO> list = dao.ViewProduct();
//        String a = "matcha";
//        List<ProductDTO> list = dao.getListProduct(a);
//        for (ProductDTO o : list) {
//            System.out.println(o);
//        }
//    }
}
