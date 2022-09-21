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
public class ProductDTO {

    private String productID;
    private String pName;
    private int pPrice;
    private int quantity;
    private String categoryID;
    private String categoryName;
    private String images;

    public ProductDTO() {
        this.productID = "";
        this.pName = "";
        this.pPrice = 0;
        this.quantity = 0;
        this.categoryID = "";
        this.images = "";
    }

    public ProductDTO(String images, String pName, String productID, int pPrice, String categoryID, int quantity) {
        this.pName = pName;
        this.productID = productID;
        this.pPrice = pPrice;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.images = images;
    }

    public ProductDTO(String productID, String pName, int pPrice, int quantity, String categoryID, String categoryName, String images) {
        this.productID = productID;
        this.pName = pName;
        this.pPrice = pPrice;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.images = images;
    }

    public ProductDTO(String productID, String pName, int pPrice, int quantity, String categoryID, String images) {
        this.productID = productID;
        this.pName = pName;
        this.pPrice = pPrice;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.images = images;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", pName=" + pName + ", pPrice=" + pPrice + ", quantity=" + quantity + ", categoryID=" + categoryID + ", images=" + images + '}';
    }

}
