/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.math.BigDecimal;

/**
 *
 * @author NTD
 */
public class OrderDetails {

    int orderID;
    int ProductID;
    int quantity;
    BigDecimal amount;
    String urlPRD;

    public OrderDetails() {
    }

    public OrderDetails(int orderID, int ProductID, int quantity, BigDecimal amount,String urlPRD) {
        this.orderID = orderID;
        this.ProductID = ProductID;
        this.quantity = quantity;
        this.amount = amount;
        this.urlPRD = urlPRD;
    }

    public String getUrlPRD() {
        return urlPRD;
    }

    public void setUrlPRD(String urlPRD) {
        this.urlPRD = urlPRD;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

}
