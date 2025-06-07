package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.PublicKeyEntity;

import java.time.LocalDate;
import java.util.List;

public class PublicKeyDao {


    public int insertPublicKey(int id, int userId , int keyVersion, String publicKey, LocalDate date, int is_Active) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO public_keys(id,user_id,key_version,public_key,created_at,is_active)\n" +
                    "VALUES (:id, :userId, :keyVersion, :publicKey,:date ,:is_Active)";
            return h.createUpdate(sql)
                    .bind("id", id)
                    .bind("userId", userId)
                    .bind("keyVersion", keyVersion)
                    .bind("publicKey", publicKey)
                    .bind("date", date)
                    .bind("is_Active", is_Active)
                    .execute();
        });
    }

    public List<PublicKeyEntity> getAllKeysByUserId(int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM public_keys WHERE user_id = :userId ORDER BY key_version DESC";
            return h.createQuery(sql)
                    .bind("userId", userId)
                    .map((rs, ctx) -> {
                        PublicKeyEntity key = new PublicKeyEntity();
                        key.setId(rs.getInt("id"));
                        key.setUserId(rs.getInt("user_id"));
                        key.setKeyVersion(rs.getInt("key_version"));
                        key.setPublicKey(rs.getString("public_key"));
                        key.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime().toLocalDate());
                        key.setIsActive(rs.getInt("is_active"));
                        return key;
                    })
                    .list();
        });
    }

}
