package com.thomas.dao.model;

import java.io.Serializable;
import java.time.LocalDate;

public class PublicKeyEntity implements Serializable {
    int id;
    int userId;
    int keyVersion;
    String publicKey;
    LocalDate createdAt;
    int isActive;

    public PublicKeyEntity() {
    }

    public PublicKeyEntity(int id, int userId, int keyVersion, String publicKey, LocalDate createdAt, int isActive) {
        this.id = id;
        this.userId = userId;
        this.keyVersion = keyVersion;
        this.publicKey = publicKey;
        this.createdAt = createdAt;
        this.isActive = isActive;
    }

    public int getId() { return id; }

    public int getUserId() { return userId; }

    public int getKeyVersion() { return keyVersion; }

    public String getPublicKey() { return publicKey; }

    public LocalDate getCreateAt() { return createdAt; }

    public int getIsActive() { return isActive; }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setKeyVersion(int keyVersion) {
        this.keyVersion = keyVersion;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }
}
