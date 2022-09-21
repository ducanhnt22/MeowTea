/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author Admin
 */
public class ProductError {

    private String productID;
    private String pName;
    private int pPrice;
    private int quantity;
    private String categoryID;
    private String images;
    private String error;

    public ProductError() {
        this.productID = "";
        this.pName = "";
        this.pPrice = 0;
        this.quantity = 0;
        this.categoryID = "";
        this.images = "";
        this.error = "";
    }

    public ProductError(String productID, String pName, int pPrice, int quantity, String categoryID, String images, String error) {
        this.productID = productID;
        this.pName = pName;
        this.pPrice = pPrice;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.images = images;
        this.error = error;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
