package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.PublicKeyEntity;

import java.time.LocalDate;
import java.util.List;

public class PublicKeyDao {


    public int insertPublicKey(int userId, String publicKey, LocalDate date, int is_Active) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO public_keys(user_id,public_key,created_at,is_active)\n" +
                    "VALUES (:userId, :publicKey,:date ,:is_Active)";
            return h.createUpdate(sql)
                    .bind("userId", userId)
                    .bind("publicKey", publicKey)
                    .bind("date", date)
                    .bind("is_Active", is_Active)
                    .execute();
        });
    }
    public int updateIsActive(int userId, int is_Active) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "UPDATE public_keys SET is_active = :isActive WHERE user_id = :userId";
            return h.createUpdate(sql)
                    .bind("isActive", is_Active)
                    .bind("userId", userId)
                    .execute();
        });
    }
    public int getKeyVersionActivated(int userId) {
        return JDBIConnect.get().withHandle(h -> {
            return h.createQuery("SELECT key_version FROM public_keys WHERE user_id = :userId AND is_active = 1 ORDER BY key_version DESC LIMIT 1")
                    .bind("userId", userId)
                    .mapTo(Integer.class)
                    .findFirst()
                    .orElse(0);
        });
    }
    public PublicKeyEntity getPublicKeyByVersionAndUserId(int userId, int keyVersion) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM public_keys WHERE user_id = :userId AND key_version = :keyVersion LIMIT 1";
            return h.createQuery(sql)
                    .bind("userId", userId)
                    .bind("keyVersion", keyVersion)
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
                    .findOne()
                    .orElse(null);
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
