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
public class OrderModel {

    Orders order;
    OrderDetails orderDetails;

    public OrderModel() {
    }

    public OrderModel(Orders order, OrderDetails orderDetails) {
        this.order = order;
        this.orderDetails = orderDetails;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public OrderDetails getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(OrderDetails orderDetails) {
        this.orderDetails = orderDetails;
    }

}
