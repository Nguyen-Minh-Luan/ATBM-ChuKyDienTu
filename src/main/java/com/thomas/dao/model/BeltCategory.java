package com.thomas.dao.model;

public class BeltCategory implements java.io.Serializable {
    private int beltId;
    private int categoryId;

    public BeltCategory() {

    }

    public BeltCategory(int beltId, int categoryId) {
        this.beltId = beltId;
        this.categoryId = categoryId;
    }

    public int getBeltId() {
        return beltId;
    }

    public void setBeltId(int beltId) {
        this.beltId = beltId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
