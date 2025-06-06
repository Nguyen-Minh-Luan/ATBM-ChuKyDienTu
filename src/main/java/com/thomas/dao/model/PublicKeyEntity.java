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
}
