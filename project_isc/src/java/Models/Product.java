/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 *
 * @author NTD
 */
public class Product {

    private int productID;
    private String productName;
    private int categoryID;
    private BigDecimal unitPrice;
    private int unitsinStock;
    private int unitsOnOrder;
    private String url;

    public Product() {
    }

    public Product(int productID, String productName, int categoryID, BigDecimal unitPrice, int unitsinStock, int unitsOnOrder, String url) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.unitPrice = unitPrice;
        this.unitsinStock = unitsinStock;
        this.unitsOnOrder = unitsOnOrder;
        this.url = url;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getUnitsinStock() {
        return unitsinStock;
    }

    public void setUnitsinStock(int unitsinStock) {
        this.unitsinStock = unitsinStock;
    }

    public int getUnitsOnOrder() {
        return unitsOnOrder;
    }

    public void setUnitsOnOrder(int unitsOnOrder) {
        this.unitsOnOrder = unitsOnOrder;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", categoryID=" + categoryID + ", unitPrice=" + unitPrice + ", unitsinStock=" + unitsinStock + ", unitsOnOrder=" + unitsOnOrder + ", url=" + url + '}';
    }


    
   
}
