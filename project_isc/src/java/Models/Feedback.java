/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author NTD
 */
public class Feedback {

    String email;
    String name;
    String phone;
    String title;
    String content;
    int ProductID;

    public Feedback() {
    }

    public Feedback(String email, String name, String phone, String title, String content, int ProductID) {
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.title = title;
        this.content = content;
        this.ProductID = ProductID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    @Override
    public String toString() {
        return "Feedback{" + "email=" + email + ", name=" + name + ", phone=" + phone + ", title=" + title + ", content=" + content + ", ProductID=" + ProductID + '}';
    }

}
