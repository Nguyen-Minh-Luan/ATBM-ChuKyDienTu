package com.thomas.dao.model;

public class Favorite {
    private int id;
    private String beltId;
    private String userId;

    public Favorite() {

    }

    public Favorite(int id, String beltId, String userId) {
        this.id = id;
        this.beltId = beltId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBeltId() {
        return beltId;
    }

    public void setBeltId(String beltId) {
        this.beltId = beltId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
