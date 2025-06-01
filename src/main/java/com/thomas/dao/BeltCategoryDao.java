package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.BeltCategory;
import com.thomas.dao.model.Category;

import java.util.List;

public class BeltCategoryDao {
    public boolean createBeltCategory(int productId, int categoryId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO beltCategory(beltId,categoryId) VALUES(:beltId,:categoryId)";
            return h.createUpdate(sql).bind("beltId", productId).bind("categoryId", categoryId).execute() > 0;
        });
    }

    public BeltCategory getBeltCategory(int beltId, int categoryId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM beltCategory WHERE beltId = :beltId AND categoryId = :categoryId";
            return h.createQuery(sql).bind("beltId", beltId).bind("categoryId", categoryId).mapToBean(BeltCategory.class).findFirst().orElse(null);
        });
    }

    public List<Category> getCategoriesByBeltIdAndCategoryId(int beltId) {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = " SELECT c.name FROM categories c JOIN beltCategory bc ON c.id = bc.categoryId WHERE bc.beltId = :beltId";
            return handle.createQuery(sql)
                    .bind("beltId", beltId)
                    .mapToBean(Category.class)
                    .list();
        });
    }

}
