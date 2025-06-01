package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.Address;

import java.util.List;

public class AddressDao {
    public AddressDao() {

    }

    public List<Address> getAllAddressByUserId(int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "select * from addresses where userId=:id";
            return h.createQuery(sql).bind("id", userId).mapToBean(Address.class).list();
        });
    }

    public boolean updateAddress(Address address) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "UPDATE addresses SET addressCity=:addressCity, addressStreet=:addressStreet WHERE id=:id";
            return h.createUpdate(sql).bind("addressCity", address.getAddressCity()).bind("addressStreet", address.getAddressStreet()).bind("id", address.getId()).execute() > 0;
        });
    }

    public boolean deleteAddress(int id) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "delete from addresses where id=:id";
            return h.createUpdate(sql).bind("id", id).execute() > 0;
        });
    }

    public boolean addAddress(Address address) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO addresses (userId,addressCity,addressStreet,isUse,isDeleted) VALUES (:userId,:addressCity,:addressStreet,:isUse,:isDeleted)";
            return h.createUpdate(sql)
                    .bind("userId", address.getUserId())
                    .bind("addressCity", address.getAddressCity())
                    .bind("addressStreet", address.getAddressStreet())
                    .bind("isUse", address.getIsUse())
                    .bind("isDeleted", address.getIsDeleted()).execute() > 0;
        });
    }

    public Address getAddress(int addressId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "select * from addresses where id=:id";
            return h.createQuery(sql).bind("id", addressId).mapToBean(Address.class).findFirst().orElse(null);
        });
    }

    public boolean setAllunUse(int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "UPDATE addresses SET isUse = 0 WHERE userId = :userId";
            return h.createUpdate(sql).bind("userId", userId).execute() > 0;
        });
    }

    public boolean setIsUse(int addressId, int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "UPDATE addresses SET isUse = 1 WHERE userId = :userId AND id = :addressId ";
            return h.createUpdate(sql).bind("userId", userId).bind("addressId", addressId).execute() > 0;
        });
    }

    public String getUserName(int addressId, int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT u.name " +
                    "FROM addresses ad " +
                    "JOIN users u ON u.id = ad.userId " +
                    "WHERE u.id = :userId AND ad.id = :addressId";
            return h.createQuery(sql).bind("userId", userId).bind("addressId", addressId).mapTo(String.class).findFirst().orElse(null);
        });
    }

    public long getPhoneNumber(int addressId, int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT u.phoneNumber " +
                    "FROM addresses ad " +
                    "JOIN users u ON u.id = ad.userId " +
                    "WHERE u.id = :userId AND ad.id = :addressId";
            return h.createQuery(sql).bind("userId", userId).bind("addressId", addressId).mapTo(long.class).findFirst().orElse(null);
        });
    }

    public boolean checkAddress(Address address) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM addresses WHERE addressCity = :addressCity AND userId = :userId AND addressStreet = :addressStreet";
            return h.createQuery(sql).bind("userId", address.getUserId())
                    .bind("addressCity", address.getAddressCity())
                    .bind("addressStreet", address.getAddressStreet())
                    .mapToBean(Address.class).findFirst().orElse(null) != null;
        });
    }

    public Address getAddressByUserId(int userId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM addresses WHERE userId = :userId AND isUse = 1";
            return h.createQuery(sql).bind("userId", userId)
                    .mapToBean(Address.class).findFirst().orElse(null);
        });
    }

    public Address getLatestAddress(int userId, String addressCity, String addressStreet) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM addresses WHERE userId = :userId AND addressCity = :addressCity AND addressStreet = :addressStreet";

            return h.createQuery(sql)
                    .bind("userId", userId)
                    .bind("addressCity", addressCity)
                    .bind("addressStreet", addressStreet)
                    .mapToBean(Address.class)
                    .findFirst()
                    .orElse(null);
        });
    }

}
