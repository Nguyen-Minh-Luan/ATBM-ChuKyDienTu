package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.Favorite;
import com.thomas.dao.model.Belts;

import java.util.List;

public class FavoriteDao {

    public List<Belts> getAllFavoriteBelts(int userId) {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.*" +
                    "FROM beltfavorites bf " +
                    "JOIN belts b ON bf.beltId = b.id " +
                    "JOIN favorites f ON bf.favoriteId = f.id " +
                    "WHERE f.userId = :userId AND b.isDeleted=0";

            return handle.createQuery(sql)
                    .bind("userId", userId)
                    .map((rs, ctx) -> {
                        Belts belt = new Belts();
                        belt.setId(rs.getInt("id"));
                        belt.setName(rs.getString("name"));
                        belt.setDescription(rs.getString("description"));
                        belt.setPrice(rs.getDouble("price"));
                        belt.setGender(rs.getString("gender"));
                        belt.setStockQuantity(rs.getInt("stockQuantity"));
                        belt.setReleaseDate(rs.getDate("releaseDate").toLocalDate());
                        belt.setCreateDate(rs.getDate("createdAt").toLocalDate());
                        belt.setUpdatedDate(rs.getDate("updatedAt").toLocalDate());
                        belt.setIsDeleted(rs.getInt("isDeleted"));
                        belt.setDiscountPercent(rs.getDouble("discountPercent"));
                        belt.setMaterialBelt(rs.getString("materialBelt"));
                        return belt;
                    })
                    .list();
        });
    }

    public boolean addFavoriteByUserId(int userId, int beltId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO favorites (userId,beltId) VALUES (:userId,:beltId)";
            return h.createUpdate(sql).bind("userId", userId).bind("beltId", beltId).execute() > 0;
        });
    }

    public boolean addFavoriteByUserIdManyToMany(Favorite favorite) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO beltFavorites (beltId,favoriteId) VALUES (:beltId,:favoriteId)";
            return h.createUpdate(sql).bind("beltId", favorite.getBeltId()).bind("favoriteId", favorite.getId()).execute() > 0;
        });
    }

    public boolean removeFavoriteBelt(int userId, int beltId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "DELETE FROM favorites WHERE userId = :userId AND beltId = :beltId";
            return h.createUpdate(sql)
                    .bind("userId", userId)
                    .bind("beltId", beltId)
                    .execute() > 0;
        });
    }

    public Favorite getLatestFavorite(int userId, int beltId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM favorites WHERE userId=:userId AND beltId=:beltId ORDER BY id DESC LIMIT 1";
            return h.createQuery(sql).bind("userId", userId).bind("beltId", beltId).mapToBean(Favorite.class).findFirst().orElse(null);
        });
    }
}
