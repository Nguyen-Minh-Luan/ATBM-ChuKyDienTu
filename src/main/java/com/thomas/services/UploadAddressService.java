package com.thomas.services;

import com.thomas.dao.AddressDao;
import com.thomas.dao.model.Address;
import com.thomas.dao.model.OrderDetails;

import java.util.List;

public class UploadAddressService {
    AddressDao addressDao;

    public UploadAddressService() {
        this.addressDao = new AddressDao();
    }

    public List<Address> getAddressList(int userId) {
        return addressDao.getAllAddressByUserId(userId);
    }

    public boolean deleteAddress(int addressId) {
        return addressDao.deleteAddress(addressId);
    }

    public boolean addAddress(Address address) {
        return addressDao.addAddress(address);
    }

    public boolean updateAddress(int addressId, String addressStreet, String addressCity) {
        Address address = addressDao.getAddress(addressId);
        address.setAddressStreet(addressStreet);
        address.setAddressCity(addressCity);
        return addressDao.updateAddress(address);
    }

    public boolean setIsUseAddress(int addressId, int userId) {
        Address address = addressDao.getAddress(addressId);
        boolean setUnUse = addressDao.setAllunUse(userId);
        return addressDao.setIsUse(addressId, userId) && setUnUse;
    }

    public Address setIsUseAddressDisplay(int addressId, int userId) {
        boolean setUnUse = addressDao.setAllunUse(userId);
        addressDao.setIsUse(addressId, userId);
        return addressDao.getAddress(addressId);
    }

    public void setUserName(Address ad) {
        if (ad != null) {
            String userName = addressDao.getUserName(ad.getId(), ad.getUserId());
            ad.setUserName(userName);
        }
    }

    public void setPhoneNumber(Address ad) {
        if (ad != null) {
            long phoneNumber = addressDao.getPhoneNumber(ad.getId(), ad.getUserId());
            ad.setPhoneNumber(phoneNumber);
        }
    }

    public void createAddress(int userId, String addressCity, String addressStreet) {
        Address address = new Address();
        address.setUserId(userId);
        address.setAddressCity(addressCity);
        address.setAddressStreet(addressStreet);
        address.setIsUse(0);
        if (!addressDao.checkAddress(address)) {
            addressDao.addAddress(address);
        }
    }

    public Address getLatestAddress(int userId, String addressCity, String addressStreet) {
        return addressDao.getLatestAddress(userId, addressCity, addressStreet);
    }

    public Address getAddressByUserId(int userId) {
        return addressDao.getAddressByUserId(userId);
    }
}
