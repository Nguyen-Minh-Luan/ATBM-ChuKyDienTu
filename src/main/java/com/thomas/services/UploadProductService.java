package com.thomas.services;

import com.thomas.dao.BeltCategoryDao;
import com.thomas.dao.CategoryDao;
import com.thomas.dao.ProductDao;
import com.thomas.dao.model.*;
import com.thomas.dao.model.Collection;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.*;

public class UploadProductService {
    ProductDao productDao;
    CategoryDao categoryDao;
    BeltCategoryDao beltCategoryDao;

    public UploadProductService() {
        productDao = new ProductDao();
        categoryDao = new CategoryDao();
        beltCategoryDao = new BeltCategoryDao();
    }

    public List<Belts> getProducts() {
        return productDao.getAllProducts();
    }

    public List<String> getProductImages(int beltId) {
        return productDao.getProductImages(beltId);

    }

    public String[] getTags(int beltId) {
        return productDao.getTags(beltId);
    }

    public void saveDesc(int beltId, String description) {
        productDao.saveDesc(beltId, description);
    }

    public void saveProduct(String productName, String[] tags, double discountPercent, LocalDate releaseDate, String gender, double price, int stockQuantity, String material, int isDeleted) {

        Belts belts = new Belts();
        belts.setName(productName);
        belts.setPrice(price);
        belts.setReleaseDate(releaseDate);
        belts.setGender(gender);
        belts.setStockQuantity(stockQuantity);
        belts.setMaterialBelt(material);
        belts.setIsDeleted(isDeleted);
        belts.setDiscountPercent(discountPercent);
        boolean isCreated = productDao.createProduct(belts);
        int id = 0;
        if (isCreated) {
            id = productDao.getLatestProductId();
        }


        for (String tag : tags) {
            Category category = getOrCreateCategory(tag);
            if (category != null) {
                getOrCreateBeltCategory(id, category.getId());
            }
        }
    }

    public Category getOrCreateCategory(String tag) {
        Category category = categoryDao.getCategory(tag);
        if (category == null) {
            if (!categoryDao.createCategory(tag)) {
                throw new RuntimeException("Failed to create or retrieve category: " + tag);
            }
            category = categoryDao.getCategory(tag);
        }
        return category;
    }

    public BeltCategory getOrCreateBeltCategory(int beltId, int categoryId) {
        BeltCategory bc = beltCategoryDao.getBeltCategory(beltId, categoryId);
        if (bc == null) {
            if (!beltCategoryDao.createBeltCategory(beltId, categoryId)) {
                throw new RuntimeException("Failed to create or retrieve category: " + beltId + " " + categoryId);
            }
            bc = beltCategoryDao.getBeltCategory(beltId, categoryId);
        }
        return bc;
    }

    public Belts getProductById(int productId) {
        return productDao.getProduct(productId);
    }

    public void updateProduct(int id, String productName, String[] tags, double discountPercent, LocalDate releaseDate, String gender, double price, int stockQuantity, String material, int isDeleted) {
        Belts belts = productDao.findById(id);
        belts.setName(productName);
        belts.setPrice(price);
        belts.setReleaseDate(releaseDate);
        belts.setGender(gender);
        belts.setStockQuantity(stockQuantity);
        belts.setMaterialBelt(material);
        belts.setDiscountPercent(discountPercent);
        belts.setIsDeleted(isDeleted);
        int beltId = productDao.findById(belts.getId()).getId();
        if (beltId <= 0) {
            return;
        }

        for (String tag : tags) {
            Category category = getOrCreateCategory(tag);
            if (category != null) {
                getOrCreateBeltCategory(beltId, category.getId());
            }
        }

        productDao.updateProduct(belts);
    }

    public boolean deleteProduct(int productId) {
        return productDao.deleteProductById(productId);
    }

    public void saveImagePath(int beltId, String filePath, List<String> extraImages) {
        if (extraImages != null && !extraImages.isEmpty()) {
            // Save the main image
            productDao.saveImage(beltId, "main", filePath);

            // Save extra images
            for (String extraImage : extraImages) {
                productDao.saveImage(beltId, "extra", extraImage);
            }
        }
    }

    public void saveDescImg(int beltId, List<String> filePaths) {
        for (String descImg : filePaths) {
            productDao.saveImage(beltId, "description", descImg);
        }
    }

    public int getLatestProductId() {
        return productDao.getLatestProductId();
    }

    public void updateImagePath(int beltId, String filePath, List<String> extraImages) {
        if (extraImages != null && !extraImages.isEmpty()) {

            productDao.updateImage(beltId, "main");
            productDao.saveImage(beltId, "main", filePath);
            productDao.updateImage(beltId, "extra");
            for (String extraImage : extraImages) {
                productDao.saveImage(beltId, "extra", extraImage);
            }

        }
    }

    public List<Belts> getNewArrivalProducts() {
        List<Belts> newArrivalBelts = productDao.getAllProducts();
        for (Belts belt : newArrivalBelts) {
            belt.setImage(productDao.getProductImages(belt.getId()));

        }
        Collections.sort(newArrivalBelts, new Comparator<Belts>() {
            @Override
            public int compare(Belts o1, Belts o2) {
                return o2.getCreatedDate().compareTo(o1.getCreatedDate());
            }
        });
        return newArrivalBelts;
    }

    public List<Category> getAllCategoriesById(int beltId) {
        return beltCategoryDao.getCategoriesByBeltIdAndCategoryId(beltId);
    }

    public List<String> getAllDescImage(int beltId) {
        return productDao.getDescImage(beltId);
    }

    public List<Belts> getRandomBelts() {
        return productDao.getRandomBelts();
    }

    public void saveBeltView(int beltId) {
        productDao.saveBeltView(beltId);
    }

    public List<Belts> getBeltByViewCount() {
        return productDao.getBeltsByViewCount();
    }

    public List<Belts> getNewArrivalProductsHotSeliing() {
        return productDao.getNewArrivalProductsHotSelling();
    }

    public List<Belts> getHotSeliingProducts() {
        return productDao.getHotSellingProducts();
    }

    public int numberOfOutOfStockProducts() {
        List<Belts> allProducts = productDao.getAllProducts();
        for (Belts belt : allProducts) {
            if (belt.getStockQuantity() <= 0) {
                allProducts.add(belt);
            }
        }
        return allProducts.size();
    }

    public List<Belts> getSortedListBelts(String type, List<Belts> list) {
        if ("default".equals(type)) {
            return list;
        }
        if ("increase".equals(type)) {
            list.sort(new Comparator<Belts>() {
                @Override
                public int compare(Belts o1, Belts o2) {
                    return (int) (o1.getPrice() - o2.getPrice());
                }
            });
        }
        if ("decrease".equals(type)) {
            list.sort(new Comparator<Belts>() {
                @Override
                public int compare(Belts o1, Belts o2) {
                    return (int) (o2.getPrice() - o1.getPrice());
                }
            });
        }
        if ("bestSeller".equals(type)) {
            List<Belts> beltsList = productDao.getHotSellingProducts();
            for (Belts belt : beltsList) {
                belt.setImage(productDao.getProductImages(belt.getId()));
            }
            return beltsList;
        }
        return list;
    }

    public List<Belts> getBestSellerProduct(String type, List<Belts> list) {
        List<Belts> bestSellerList = new ArrayList<>();

        return bestSellerList;
    }

    public List<Belts> getAllProductsForDisplay() {
        List<Belts> list = new ArrayList<>();
        productDao.getAllProductForDisplay().forEach((key, value) -> {
            list.add(value);
        });
        return list;
    }

    public List<Belts> getDiscountProductsForDisplay() {
        List<Belts> list = new ArrayList<>();
        for (Belts belt : getAllProductsForDisplay()) {
            if (belt.getDiscountPercent() != 0) {
                list.add(belt);
            }
        }
        return list;
    }


    // nghiêng cứu lại

//    public List<Belts> getMostPopularProducts() {
//        List<Belts> list = getAllProductsForDisplay();
//        list.sort(new Comparator<Belts>() {
//            @Override
//            public int compare(Belts o1, Belts o2) {
//                return (int) o2.getViewCount() - o1.getViewCount();
//            }
//        });
//        return list;
//    }


    public List<Belts> getNewArrivals() {
        List<Belts> list = getAllProductsForDisplay();
        list.sort(new Comparator<Belts>() {
            @Override
            public int compare(Belts o1, Belts o2) {
                return o2.getReleaseDate().compareTo(o1.getReleaseDate());
            }
        });
        return list;
    }

    public Belts getBeltById(int beltId) {
        return productDao.getAllProducts().stream().filter(belts -> belts.getId() == beltId).findFirst().get();
    }

    public boolean isUserPurchased(int beltId, int userId) {
        return productDao.isUserPurchased(beltId, userId);
    }

    public List<String> getImageProductDetail(int beltId) {
        return productDao.getImageProductDetail(beltId);
    }

    public List<Belts> getMaleOrFemaleAndMaterialProducts(String gender, String material) {
        List<Belts> list = new ArrayList<>();
        for (Belts belt : getAllProductsForDisplay()) {
            if (belt.getGender().equalsIgnoreCase(gender)) {
                if ("all".equalsIgnoreCase(material)) {
                    list.add(belt);
                } else if (belt.getMaterialBelt().equalsIgnoreCase(material)) {
                    list.add(belt);
                }

            }
        }
        return list;
    }

    public List<Belts> filterProduct(List<Belts> list, double min, double max) {
        List<Belts> filteredList = new ArrayList<>();
        for (Belts belt : list) {
            if (belt.getPrice() > min && belt.getPrice() < max) {
                filteredList.add(belt);
            }
        }
        return filteredList;
    }

    public List<Belts> searchProduct(String keyword) {
        List<Belts> list = new ArrayList<>();

        for (Belts belt : getAllProductsForDisplay()) {
            if (belt.getName().equalsIgnoreCase(keyword) || belt.getMaterialBelt().equalsIgnoreCase(keyword)) {
                list.add(belt);
            }
        }
        return list;
    }

    public List<Belts> getCollection() {
        return productDao.getCollectionProduct();
    }

    public List<Belts> getProductInCollection(String collectionName) {
        List<Belts> list = new ArrayList<>();
        for (Belts belt : productDao.getCollectionProduct()) {
            if (belt.getCollectionOf().equalsIgnoreCase(collectionName)) {
                list.add(belt);
            }
        }
        return list;
    }

    public List<Belts> getBeltByViewCountHomePage() {
        List<Belts> beltProduct = productDao.getBeltsByViewCountHomePage();
        for (Belts belt : beltProduct) {
            belt.setImage(getProductImages(belt.getId()));
        }
        return beltProduct;
    }

    public List<Collection> getCollections() {
        return productDao.getAllCollections();
    }

    public void createCollection(String name) {
        Collection collection = new Collection();
        collection.setCollectionName(name);
        collection.setCreateAt(LocalDate.now());
        productDao.createCollection(collection);
    }

    public List<Belts> findCollectionProduct(String collectionId) {
        List<Belts> allBeltCollectionDetail = productDao.findAllCollectionDetailsByCollectionId(collectionId);
        return allBeltCollectionDetail;
    }


    public Collection getCollectionById(int collectionId) {
        return productDao.getCollectionById(collectionId);
    }

    public void saveCollection(CollectionDetails cd) {
        productDao.saveCollectionItem(cd);
    }

    public void deteleCollectionDetail(String orderItemId) {
        productDao.deleteCollectionDetails(orderItemId);
    }

    public void deleteCollections(int id) {
        productDao.deleteCollection(id);
    }
}
