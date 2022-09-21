/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author Admin
 */
public class UserError {

    private String UserID;
    private String name;
    private String phone;
    private String address;
    private String email;
    private String roleID;
    private String password;
    private String confirm;
    private String error;

    public UserError() {
        this.UserID = "";
        this.name = "";
        this.phone = "";
        this.address = "";
        this.email = "";
        this.roleID = "";
        this.password = "";
        this.confirm = "";
        this.error = "";
    }

    public UserError(String UserID, String name, String phone, String address, String email, String roleID, String password, String confirm, String error) {
        this.UserID = UserID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
        this.password = password;
        this.confirm = confirm;
        this.error = error;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
