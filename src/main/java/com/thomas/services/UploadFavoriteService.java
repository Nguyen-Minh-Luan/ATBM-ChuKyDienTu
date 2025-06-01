package com.thomas.services;

import com.thomas.dao.FavoriteDao;
import com.thomas.dao.model.Favorite;
import com.thomas.dao.model.Belts;

import java.util.List;

public class UploadFavoriteService {
    FavoriteDao favoriteDao;

    public UploadFavoriteService() {
        favoriteDao = new FavoriteDao();
    }

    public List<Belts> getFavoritesBeltByUserId(int userId) {
        return favoriteDao.getAllFavoriteBelts(userId);
    }

    public boolean addFavoriteByUserId(int userId, int beltId) {
        List<Belts> favoriteBelts = getFavoritesBeltByUserId(userId);
        for (Belts belt : favoriteBelts) {
            if (belt.getId() == beltId) {
                return false;
            }
        }
        boolean isAdded = favoriteDao.addFavoriteByUserId(userId, beltId);
        Favorite favorite = favoriteDao.getLatestFavorite(userId, beltId);
        return isAdded && favoriteDao.addFavoriteByUserIdManyToMany(favorite);
    }

    public boolean deleteFavoriteBelt(int userId, int beltId) {
        return favoriteDao.removeFavoriteBelt(userId, beltId);
    }
}
