package com.thomas.dao.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class Order implements Serializable {
    private int id;
    private int userId;
    private int paymentMethodId;
    private int addressesId;
    private LocalDate orderDate;
    private double orderTotal;
    private String orderStatus;
    private int isDeleted;
    private String userName;
    private String paymentMethod;
    private String addresse;
    private List<OrderDetails> orderDetails;
    private LocalDate shippingDate;

    public Order() {

    }

    public Order(int id, int userId, LocalDate orderDate, double orderTotal, String orderStatus, int isDeleted, int addressesId) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.orderTotal = orderTotal;
        this.orderStatus = orderStatus;
        this.isDeleted = isDeleted;
        this.addressesId = addressesId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
        setShippingDate();
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getAddresse() {
        return addresse;
    }

    public void setAddresse(String addresse) {
        this.addresse = addresse;
    }

    public int getAddressesId() {
        return addressesId;
    }

    public void setAddressesId(int addressId) {
        this.addressesId = addressId;
    }

    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public String getShippingDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-M-yyyy");
        return this.shippingDate.format(formatter);
    }

    public void setShippingDate() {
        if (this.orderDate != null) {
            this.shippingDate = this.orderDate.plusDays(7);
        } else {
            throw new IllegalStateException("Ngày đặt hàng phải được set trước đã");
        }
    }
}
