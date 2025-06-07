package com.thomas.dao.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class SignatureEntity implements Serializable {
    private int id;
    private int orderId;
    private int userId;
    private int keyVersion;
    private String signature;
    private LocalDateTime createdAt;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getKeyVersion() { return keyVersion; }
    public void setKeyVersion(int keyVersion) { this.keyVersion = keyVersion; }

    public String getSignature() { return signature; }
    public void setSignature(String signature) { this.signature = signature; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
