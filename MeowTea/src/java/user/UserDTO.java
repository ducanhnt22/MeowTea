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
public class UserDTO {

    private String UserID;
    private String fullName;
    private String phone;
    private String address;
    private String email;
    private String roleID;
    private String roleName;
    private String password;

    public UserDTO() {
        this.UserID = "";
        this.fullName = "";
        this.phone = "";
        this.address = "";
        this.email = "";
        this.roleID = "";
        this.roleName = "";
        this.password = "";
    }

    public UserDTO(String UserID, String fullName, String phone, String address, String email, String password, String roleID, String roleName) {
        this.UserID = UserID;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
        this.roleName = roleName;
        this.password = password;
    }

    public UserDTO(String UserID, String fullName, String phone, String address, String email, String roleID, String password) {
        this.UserID = UserID;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
        this.password = password;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "UserID=" + UserID + ", fullName=" + fullName + ", phone=" + phone + ", address=" + address + ", email=" + email + ", roleID=" + roleID + ", roleName=" + roleName + ", password=" + password + '}';
    }

}
