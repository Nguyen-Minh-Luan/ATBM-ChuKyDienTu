package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.SignatureEntity;

public class SignatureDao {

    public int insertSignature(SignatureEntity signature) {
        String sql = "INSERT INTO signatures (order_id, user_id, key_version, signature) " +
                "VALUES (:orderId, :userId, :keyVersion, :signature)";

        return JDBIConnect.get().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("orderId", signature.getOrderId())
                        .bind("userId", signature.getUserId())
                        .bind("keyVersion", signature.getKeyVersion())
                        .bind("signature", signature.getSignature())
                        .execute()
        );
    }

    public SignatureEntity getSignatureByOrderId(int orderId) {
        String sql = "SELECT * FROM signatures WHERE order_id = :orderId";

        return JDBIConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("orderId", orderId)
                        .mapToBean(SignatureEntity.class)
                        .findOne()
                        .orElse(null)
        );
    }
}
