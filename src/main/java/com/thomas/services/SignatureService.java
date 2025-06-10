package com.thomas.services;

import com.thomas.dao.SignatureDao;
import com.thomas.dao.model.SignatureEntity;

import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.List;

public class SignatureService {

    private final SignatureDao signatureDao = new SignatureDao();

    public int saveSignature(int orderId, int userId, int keyVersion, String signatureBase64) {
        SignatureEntity entity = new SignatureEntity();
        entity.setOrderId(orderId);
        entity.setUserId(userId);
        entity.setKeyVersion(keyVersion);
        entity.setSignature(signatureBase64);
        return signatureDao.insertSignature(entity);
    }

    public SignatureEntity getSignatureByOrder(int orderId) {
        return signatureDao.getSignatureByOrderId(orderId);
    }
}
