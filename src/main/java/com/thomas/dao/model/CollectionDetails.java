package com.thomas.dao.model;

import java.time.LocalDate;

public class CollectionDetails implements java.io.Serializable {
    private int id;
    private int beltId;
    private LocalDate createdAt;
    private int collectionId;

    public CollectionDetails() {

    }

    public CollectionDetails(int id, int beltId, LocalDate createdAt) {
        this.id = id;
        this.beltId = beltId;
        this.createdAt = createdAt;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBeltId() {
        return this.beltId;
    }

    public void setBeltId(int beltId) {
        this.beltId = beltId;
    }

    public LocalDate getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public int getCollectionId() {
        return this.collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }
}
