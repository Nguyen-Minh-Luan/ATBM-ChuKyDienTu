package com.thomas.dao.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Collection implements Serializable {
    private int id;
    private String collectionName;
    private LocalDate createAt;

    public Collection() {

    }

    public Collection(int id, String collectionName, LocalDate createAt) {
        this.id = id;
        this.collectionName = collectionName;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCollectionName() {
        return collectionName;
    }

    public void setCollectionName(String collectionName) {
        this.collectionName = collectionName;
    }

    public LocalDate getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDate date) {
        this.createAt = date;
    }
}
