package com.thomas.dao.model;

import java.math.BigDecimal;

public class CartItem {
    private Belts belt;
    private int quantity;
    private double price;

    public CartItem(Belts belt, int quantity, double price) {
        this.belt = belt;
        this.quantity = quantity;
        this.price = price;
    }

    public Belts getBelt() {
        return belt;
    }

    public void setBelt(Belts belt) {
        this.belt = belt;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
