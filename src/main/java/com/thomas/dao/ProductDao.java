package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.Belts;
import com.thomas.dao.model.Collection;
import com.thomas.dao.model.CollectionDetails;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    public boolean createProduct(Belts belts) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO belts ( name, releaseDate, gender, price,stockQuantity ,materialBelt,isDeleted,discountPercent) VALUES (:productName,:releaseDate,:gender,:price,:stockQuantity,:material,:isDeleted,:discountPercent)";
            return h.createUpdate(sql).bind("productName", belts.getName())
                    .bind("releaseDate", belts.getReleaseDate())
                    .bind("gender", belts.getGender())
                    .bind("price", belts.getPrice())
                    .bind("stockQuantity", belts.getStockQuantity())
                    .bind("material", belts.getMaterialBelt())
                    .bind("isDeleted", belts.getIsDeleted())
                    .bind("discountPercent", belts.getDiscountPercent())
                    .execute() > 0;
        });
    }

    public String[] getTags(int beltId) {
        return JDBIConnect.get().withHandle(handle -> {
            // Execute the query to fetch category names
            List<String> categories = handle.createQuery(
                            "SELECT c.name " +
                                    "FROM beltCategory bc " +
                                    "JOIN categories c ON bc.categoryId = c.id " +
                                    "WHERE bc.beltId = :beltId"
                    )
                    .bind("beltId", beltId)
                    .mapTo(String.class)
                    .list();

            // Convert the list to an array and return
            return categories.toArray(new String[0]);
        });
    }


    public List<String> getProductImages(int beltId) {
        return JDBIConnect.get().withHandle(handle ->
                handle.createQuery(
                                "SELECT imagePath FROM imageEntry WHERE beltId = :beltId AND imageType IN ('main', 'extra')")
                        .bind("beltId", beltId)
                        .mapTo(String.class)
                        .list()
        );
    }


    public void saveDesc(int beltId, String desc) {
        JDBIConnect.get().withHandle(h -> {
            String sql = "UPDATE belts SET description = :desc WHERE id = :beltId";
            return h.createUpdate(sql)
                    .bind("beltId", beltId)
                    .bind("desc", desc)
                    .execute() > 0;
        });
    }


    public Belts getProduct(int id) {
        String sql = "SELECT * FROM belts WHERE id = :id ORDER BY id DESC";
        return JDBIConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .map((rs, ctx) -> {
                            Belts belts = new Belts();
                            belts.setId(rs.getInt("id"));
                            belts.setName(rs.getString("name"));
                            belts.setDescription(rs.getString("description"));
                            belts.setPrice(rs.getDouble("price"));
                            belts.setGender(rs.getString("gender"));
                            belts.setStockQuantity(rs.getInt("stockQuantity"));
                            belts.setReleaseDate(rs.getDate("releaseDate").toLocalDate());
                            belts.setCreateDate(rs.getDate("createdAt").toLocalDate());
                            belts.setUpdatedDate(rs.getDate("updatedAt").toLocalDate());
                            belts.setIsDeleted(rs.getInt("isDeleted"));
                            belts.setDiscountPercent(rs.getDouble("discountPercent"));
                            belts.setMaterialBelt(rs.getString("materialBelt"));
                            return belts;
                        })
                        .one()
        );
    }


    public List<Belts> getAllProducts() {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT * FROM belts WHERE isDeleted=0 ORDER BY id DESC";
            List<Belts> belts = new ArrayList<>();
            try (Handle h = handle) {
                h.execute(sql);
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
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
                    belt.setIsDeleted(rs.getInt("isDeleted"));
                    belts.add(belt);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return belts;
        });
    }

    public Belts findById(int id) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM belts WHERE id = :id";
            return h.createQuery(sql).bind("id", id).mapToBean(Belts.class).findFirst().orElse(null);
        });
    }

    public boolean updateProduct(Belts belts) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "UPDATE belts SET name = :productName, " +
                    "releaseDate = :releaseDate, " +
                    "gender = :gender, " +
                    "price = :price, " +
                    "stockQuantity = :stockQuantity, " +
                    "materialBelt = :material, " +
                    "isDeleted = :isDeleted, " +
                    "discountPercent = :discountPercent " +
                    "WHERE id = :id";

            return h.createUpdate(sql)
                    .bind("productName", belts.getName())
                    .bind("releaseDate", belts.getReleaseDate())
                    .bind("gender", belts.getGender())
                    .bind("price", belts.getPrice())
                    .bind("stockQuantity", belts.getStockQuantity())
                    .bind("material", belts.getMaterialBelt())
                    .bind("id", belts.getId())
                    .bind("isDeleted", belts.getIsDeleted())
                    .bind("discountPercent", belts.getDiscountPercent())
                    .execute() > 0;
        });
    }

    public boolean deleteProductById(int id) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "DELETE FROM belts WHERE id = :id";
            return h.createUpdate(sql).bind("id", id).execute() > 0;
        });
    }

    public void saveImage(int beltId, String imageType, String imagePath) {
        JDBIConnect.get().useHandle(handle -> {
            String sql = "INSERT INTO imageEntry (beltId, imageType, imagePath) " +
                    "VALUES (:beltId, :imageType, :imagePath)";
            handle.createUpdate(sql)
                    .bind("beltId", beltId)
                    .bind("imageType", imageType)  // 'main', 'extra', or 'description'
                    .bind("imagePath", imagePath)
                    .execute();
        });
    }


    public int updateImage(int beltId, String imageType) {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = " DELETE FROM imageEntry WHERE beltId = :beltId AND imageType = :imageType";
            return handle.createUpdate(sql)
                    .bind("beltId", beltId)
                    .bind("imageType", imageType)
                    .execute();
        });
    }


    public int getLatestProductId() {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT id FROM belts ORDER BY id DESC LIMIT 1";
            return h.createQuery(sql).mapTo(Integer.class).findFirst().orElse(0);
        });
    }

    public List<String> getDescImage(int beltId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT imagePath from imageEntry where beltId = :beltId AND imageType = 'description'";
            return h.createQuery(sql).bind("beltId", beltId).mapTo(String.class).list();
        });
    }

    public List<Belts> getRandomBelts() {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT * FROM belts ORDER BY RAND() LIMIT 4";
            List<Belts> belts = new ArrayList<>();
            try (Handle h = handle) {
                h.execute(sql);
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
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
                    belt.setIsDeleted(rs.getInt("isDeleted"));
                    belts.add(belt);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return belts;
        });
    }

    public void saveBeltView(int beltId) {
        JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO beltViews (beltId, viewDate, viewCount)" +
                    "VALUES (:beltId, CURDATE(), 1)" +
                    "ON DUPLICATE KEY UPDATE viewCount = viewCount + 1;";
            return h.createUpdate(sql).bind("beltId", beltId).execute() > 0;
        });
    }

    public List<Belts> getBeltsByViewCount() {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.* FROM belts b " +
                    "JOIN beltViews bv ON b.id = bv.beltId " +
                    "ORDER BY bv.viewCount DESC " +
                    "LIMIT 4";

            List<Belts> beltsList = new ArrayList<>();
            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
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
                    beltsList.add(belt);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }

    public List<Belts> getNewArrivalProductsHotSelling() {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT " +
                    "    b.id, " +
                    "    b.name, " +
                    "    b.price, " +
                    "    b.createdAt, " +
                    "    b.materialBelt, " +
                    "    SUM(od.quantity) AS totalQuantitySold " +
                    "FROM " +
                    "    orderDetails od " +
                    "JOIN " +
                    "    orders o ON od.orderId = o.id " +
                    "JOIN " +
                    "    belts b ON od.beltId = b.id " +
                    "WHERE " +
                    "    o.isDeleted = 0 AND b.stockQuantity > 0 AND b.isDeleted = 0 " +
                    "GROUP BY " +
                    "    b.id, b.name, b.price, b.createdAt, b.materialBelt " +
                    "ORDER BY " +
                    "    totalQuantitySold DESC, b.createdAt DESC";

            return handle.createQuery(sql)
                    .map((rs, ctx) -> {
                        Belts belt = new Belts();
                        belt.setId(rs.getInt("id"));
                        belt.setName(rs.getString("name"));
                        belt.setPrice(rs.getDouble("price"));
                        belt.setCreateDate(rs.getDate("createdAt").toLocalDate());
                        belt.setMaterialBelt(rs.getString("materialBelt"));
                        belt.setTotalQuantity(rs.getInt("totalQuantitySold"));
                        return belt;
                    })
                    .list();
        });
    }

    public List<Belts> getNewArrivals() {
        List<Belts> beltsList = new ArrayList<>();
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.id,b.name,b.price, b.releaseDate,i.imagePath, od.quantity " +
                    "FROM belts b " +
                    "INNER JOIN imageEntry i " +
                    "ON b.id = i.beltId " +
                    "INNER JOIN orderdetails od " +
                    "ON b.id = od.beltId " +
                    "WHERE b.isDeleted = 0 " +
                    "ORDER BY YEAR(b.releaseDate) " +
                    "DESC ";

            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
                    Belts belt = new Belts();

                    belt.setId(rs.getInt("id"));
                    belt.setName(rs.getString("name"));
                    belt.setPrice(rs.getDouble("price"));
                    belt.setReleaseDate(rs.getDate("releaseDate").toLocalDate());
                    belt.setMainImage(rs.getString("imagePath"));
                    belt.setTotalQuantity(rs.getInt("quantity"));
                    beltsList.add(belt);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }


    public List<Belts> getHotSellingProducts() {
        List<Belts> beltsList = new ArrayList<>();
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.id, b.name, b.price, " +
                    "(SELECT i.imagePath FROM imageentry i WHERE i.beltId = b.id and i.imageType = 'main') AS imagePath, " +
                    "b.createdAt, " +
                    "SUM(od.quantity) AS totalQuantitySold " +
                    "FROM orderDetails od " +
                    "JOIN orders o ON od.orderId = o.id " +
                    "JOIN belts b ON od.beltId = b.id " +
                    "WHERE o.isDeleted = 0 AND b.stockQuantity > 0 AND b.isDeleted = 0 " +
                    "GROUP BY b.id, b.name, b.price, b.createdAt " +
                    "ORDER BY totalQuantitySold DESC;";

            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
                    Belts belt = new Belts();
                    belt.setId(rs.getInt("id"));
                    belt.setName(rs.getString("name"));
                    belt.setCreateDate(rs.getDate("createdAt").toLocalDate());
                    belt.setTotalQuantity(rs.getInt("totalQuantitySold"));
                    beltsList.add(belt);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }

    public boolean isUserPurchased(int beltId, int userId) {
        String sql = "SELECT EXISTS ( SELECT 1 FROM orders o INNER JOIN orderDetails od ON o.id = od.orderId WHERE o.userID = :userId AND od.beltId = :beltId)";
        return JDBIConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .bind("beltId", beltId)
                        .mapTo(Boolean.class)
                        .one()
        );
    }



    public Map<Integer, Belts> getAllProductForDisplay() {
        Map<Integer, Belts> beltsList = new HashMap<>();
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.id, b.name, b.description, b.price, b.gender, b.discountPercent, b.releaseDate , b.materialBelt, i.imagePath " +
                    "FROM belts b " +
                    "INNER JOIN imageentry i " +
                    "ON b.id = i.beltId " +
                    "WHERE b.isDeleted = 0 and i.imageType = 'main' ";
            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
                    Belts belt = new Belts();
                    belt.setId(rs.getInt("id"));
                    belt.setName(rs.getString("name"));
                    belt.setPrice(rs.getDouble("price"));
                    belt.setGender(rs.getString("gender"));
                    belt.setDiscountPercent(rs.getDouble("discountPercent"));
                    belt.setReleaseDate(rs.getDate("releaseDate").toLocalDate());
                    belt.setMaterialBelt(rs.getString("materialBelt"));
                    belt.setMainImage(rs.getString("imagePath"));
                    beltsList.put(belt.getId(), belt);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }


    public List<Belts> getBestSellerProducts() {
        List<Belts> beltsList = new ArrayList<>();
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT i.imagePath, b.id, b.name, b.price, b.gender , b.materialBelt , od.quantity " +
                    "FROM belts b " +
                    "INNER JOIN imageentry i " +
                    "ON b.id = i.beltId " +
                    "INNER JOIN orderdetails od " +
                    "ON b.id = od.beltId " +
                    "INNER JOIN orders o " +
                    "ON od.orderId = o.id " +
                    "WHERE b.isDeleted = 0 AND o.isDeleted = 0 " +
                    "ORDER BY od.quantity DESC ";
            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
                    Belts belt = new Belts();
                    belt.setMainImage(rs.getString("imagePath"));
                    belt.setId(rs.getInt("id"));
                    belt.setName(rs.getString("name"));
                    belt.setPrice(rs.getDouble("price"));
                    belt.setGender(rs.getString("gender"));
                    belt.setMaterialBelt(rs.getString("materialBelt"));
                    belt.setTotalQuantity(rs.getInt("quantity"));
                    beltsList.add(belt);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }

    public List<String> getImageProductDetail(int beltId) {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT imagePath from imageEntry where beltId = :beltId";
            return handle.createQuery(sql).bind("beltId", beltId).mapTo(String.class).list();
        });
    }

    public List<Belts> getBeltsByViewCountHomePage() {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.* FROM belts b " +
                    "JOIN beltViews bv ON b.id = bv.beltId " +
                    "ORDER BY bv.viewCount DESC ";

            List<Belts> beltsList = new ArrayList<>();
            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
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
                    beltsList.add(belt);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }

    public List<Collection> getAllCollections() {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM collections";
            return h.createQuery(sql).mapToBean(Collection.class).list();
        });
    }

    public Boolean createCollection(Collection collection) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO collections (collectionName,createdAt) VALUES (:collectionName,:createdAt)";
            return h.createUpdate(sql).bind("collectionName", collection.getCollectionName()).bind("createdAt", collection.getCreateAt()).execute() > 0;
        });
    }

    public List<Belts> findAllBeltByCollectionId(String collectionId) {
        String sql = "SELECT b.* FROM belts b JOIN collections c ON b.id=c.beltId WHERE c.id=:collectionId";
        return JDBIConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("collectionId", collectionId)
                        .map((rs, ctx) -> {
                            Belts belts = new Belts();
                            belts.setId(rs.getInt("id"));
                            belts.setName(rs.getString("name"));
                            belts.setDescription(rs.getString("description"));
                            belts.setPrice(rs.getDouble("price"));
                            belts.setGender(rs.getString("gender"));
                            belts.setStockQuantity(rs.getInt("stockQuantity"));
                            belts.setReleaseDate(rs.getDate("releaseDate").toLocalDate());
                            belts.setCreateDate(rs.getDate("createdAt").toLocalDate());
                            belts.setUpdatedDate(rs.getDate("updatedAt").toLocalDate());
                            belts.setIsDeleted(rs.getInt("isDeleted"));
                            belts.setDiscountPercent(rs.getDouble("discountPercent"));
                            belts.setMaterialBelt(rs.getString("materialBelt"));
                            return belts;
                        })
                        .list()
        );
    }

    public List<Belts> findAllCollectionDetailsByCollectionId(String collectionId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT b.* FROM belts b JOIN collectiondetails cd ON b.id = cd.beltId JOIN collections c ON c.id = cd.collectionId WHERE c.id = :collectionId";
            return h.createQuery(sql)
                    .bind("collectionId", collectionId)
                    .mapToBean(Belts.class)
                    .list();
        });
    }

    public Collection getCollectionById(int collectionId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM collections WHERE id = :collectionId";
            return h.createQuery(sql).bind("collectionId", collectionId).mapToBean(Collection.class).findFirst().orElse(null);
        });
    }

    public void saveCollectionItem(CollectionDetails cd) {
        JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO collectiondetails (beltId,createdAt,collectionId) VALUES (:beltId,:createdAt,:collectionId)";
            return h.createUpdate(sql).bind("beltId", cd.getBeltId())
                    .bind("createdAt", cd.getCreatedAt())
                    .bind("collectionId", cd.getCollectionId())
                    .execute();
        });
    }

    public void deleteCollectionDetails(String orderItemId) {
        JDBIConnect.get().withHandle(h -> {
            String sql = "Delete from collectiondetails where id = :orderItemId";
            return h.createUpdate(sql).bind("orderItemId", orderItemId).execute();
        });
    }


    //    public List<Belts> getCollectionProduct{
//        return JDBIConnect.get().withHandle(handle -> {
//            String sql = "SELECT b.id, b.name , b.price ,b.isDeleted , i.imagePath, i.imageType , c.`name` " +
//                    "FROM belts b inner join imageentry i " +
//                    "on b.id = i.beltId " +
//                    "inner join collections c " +
//                    "on b.id = c.beltId " +
//                    "where b.isDeleted = 0 AND i.imageType = 'main'";
//            return handle.ex
//        });
//    }
    public List<Belts> getCollectionProduct() {
        List<Belts> beltsList = new ArrayList<>();
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "SELECT b.id, b.name , b.price , i.imagePath , c.collectionName " +
                    "FROM belts b inner join imageentry i " +
                    "on b.id = i.beltId " +
                    "inner join collectiondetails cd " +
                    "on b.id=cd.beltId " +
                    "inner join collections c " +
                    "on c.id=cd.collectionId " +
                    "where b.isDeleted = 0 AND i.imageType = 'main'";
            try (Handle h = handle) {
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
                    Belts belt = new Belts();
                    belt.setId(rs.getInt("id"));
                    belt.setName(rs.getString("name"));
                    belt.setPrice(rs.getDouble("price"));
                    belt.setMainImage(rs.getString("imagePath"));
                    belt.setCollectionOf(rs.getString("collectionName"));
                    beltsList.add(belt);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return beltsList;
        });
    }

    public void deleteCollection(int id) {
        JDBIConnect.get().withHandle(h -> {
            String sql = "DELETE FROM collections WHERE id = :id";
            return h.createUpdate(sql).bind("id", id).execute();
        });
    }
}
