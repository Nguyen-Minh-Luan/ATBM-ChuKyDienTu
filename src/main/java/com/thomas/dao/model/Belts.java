package com.thomas.dao.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class Belts implements Serializable {
    private int id;
    private String name;
    private String description;
    private double price;
    private String gender;
    private int stockQuantity;
    private LocalDate releaseDate;
    private LocalDate createdDate;
    private LocalDate updatedDate;
    private int isDeleted;
    private double discountPercent;
    private String materialBelt;
    private List<String> image;
    private int totalQuantity;
    private List<Category> categories;
    private String mainImage;
    private LocalDate viewDate;
    private int viewCount;
    private String collectionOf;

    public Belts() {

    }

    public Belts(int id, String name, String description, double price, String gender, int stockQuantity, LocalDate releaseDate, LocalDate createdDate, LocalDate updatedDate, int isDeleted, double discountPercent, String materialBelt, String mainImage, LocalDate viewDate, int viewCount, String collectionOf) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.gender = gender;
        this.stockQuantity = stockQuantity;
        this.releaseDate = releaseDate;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.isDeleted = isDeleted;
        this.discountPercent = discountPercent;
        this.materialBelt = materialBelt;
        this.mainImage = mainImage;
        this.viewDate = viewDate;
        this.viewCount = viewCount;
        this.collectionOf = collectionOf;
    }

    public void setTag(List<Category> allCategoriesById) {
        this.categories = allCategoriesById;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createdDate = createDate;
    }

    public LocalDate getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(LocalDate updateDate) {
        this.updatedDate = updateDate;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getMaterialBelt() {
        return materialBelt;
    }

    public void setMaterialBelt(String materialBelt) {
        this.materialBelt = materialBelt;
    }

    public String getFormattedCreateDate() {
        return createdDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public String getFormattedReleaseDate() {
        return releaseDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public String getFormattedUpdateDate() {
        return updatedDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public List<String> getImage() {
        return image;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public void setImage(List<String> image) {
        this.image = image;
    }

    public String getMainImage() {return mainImage;}

    public void setMainImage(String mainImage) {this.mainImage = mainImage;}

    public LocalDate getViewDate() {return viewDate;}

    public void setViewDate(LocalDate viewDate) {this.viewDate = viewDate;}

    public int getViewCount() {return viewCount;}

    public void setViewCount(int viewCount) {this.viewCount = viewCount;}

    public String getCollectionOf() {return collectionOf;}

    public void setCollectionOf(String collectionOf) {this.collectionOf = collectionOf;}
}
