package com.thomas.dao.model;

import java.io.Serializable;

public class Address implements Serializable {
    private int id;
    private int userId;
    private String addressCity;
    private String addressStreet;
    private int isUse;
    private int isDeleted;
    private String userName;
    private long phoneNumber;

    public Address() {

    }

    public Address(int id, int userId, String addressCity, String addressStreet, int isUse, int isDeleted) {
        this.id = id;
        this.userId = userId;
        this.addressCity = addressCity;
        this.addressStreet = addressStreet;
        this.isUse = isUse;
        this.isDeleted = isDeleted;

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

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }

    public String getAddressStreet() {
        return addressStreet;
    }

    public void setAddressStreet(String addressStreet) {
        this.addressStreet = addressStreet;
    }

    public int getIsUse() {
        return isUse;
    }

    public void setIsUse(int isUse) {
        this.isUse = isUse;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setPhoneNumber(long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public long getPhoneNumber() {
        return phoneNumber;
    }
}
