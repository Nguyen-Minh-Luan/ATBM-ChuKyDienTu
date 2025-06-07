package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;

import java.time.LocalDate;

public class PublicKeyDao {


    public int insertPublicKey(int userId, String publicKey, LocalDate date, int is_Active) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO public_keys(id,user_id,key_version,public_key,created_at,is_active)\n" +
                    "VALUES (:id, :userId, :keyVersion, :publicKey,:date ,:is_Active)";
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

}
