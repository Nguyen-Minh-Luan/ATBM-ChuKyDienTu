package com.thomas.dao.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Coupon implements Serializable {
    private int id;
    private String code;
    private double discountRate;
    private LocalDate startDate;
    private LocalDate endDate;
    private int isActive;

    public Coupon() {

    }

    public Coupon(int id, String code, double discountRate, LocalDate startDate, LocalDate endDate, int isActive) {
        this.id = id;
        this.code = code;
        this.discountRate = discountRate;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(double discountRate) {
        this.discountRate = discountRate;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }
}
