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
public class QuantityProductAdd {

    String ProductID;
    int Quantity;
    BigDecimal Amount;

    public QuantityProductAdd() {
    }

    public QuantityProductAdd(String ProductID, int Quantity, BigDecimal Amount) {
        this.ProductID = ProductID;
        this.Quantity = Quantity;
        this.Amount = Amount;
    }


    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public BigDecimal getAmount() {
        return Amount;
    }

    public void setAmount(BigDecimal Amount) {
        this.Amount = Amount;
    }

    @Override
    public String toString() {
        return "CountProductsession{" + "ProductID=" + ProductID + ", Amount=" + Quantity + '}';
    }

}
