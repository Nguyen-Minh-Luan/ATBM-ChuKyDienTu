package com.thomas.services;

import com.thomas.dao.PublicKeyDao;
import com.thomas.dao.UserDao;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.File;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.time.LocalDate;
import java.util.Base64;

public class KeyService {
    PublicKeyDao pbdao;
    UserDao udao;
    PublicKey pk;
    PrivateKey pv;
    byte[] salt ;

    public byte[] genSalt() {
        byte[] salt = new byte[16];
        new SecureRandom().nextBytes(salt);
        this.salt = salt;
        return salt;
    }
    public boolean changeSalt(String newSalt) {
        this.salt = Base64.getDecoder().decode(newSalt);
        return true;
    }
    public SecretKey genKeyFromPassword(String password) throws Exception {
        int iterationCount = 65536;
        int keyLength = 128;

        PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), this.salt, iterationCount, keyLength);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        byte[] keyBytes = keyFactory.generateSecret(spec).getEncoded();

        return new SecretKeySpec(keyBytes, "AES");
    }

    public KeyPair genKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
        generator.initialize(1024);
        return generator.generateKeyPair();
    }

    public PublicKey getPublicKeyFromBytes(byte[] keyBytes) throws Exception {
        X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        return kf.generatePublic(spec);
    }

    public PrivateKey getPrivateKeyFromBytes(byte[] keyBytes) throws Exception {
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        return kf.generatePrivate(spec);
    }


    public File privateKeyFile(){

    }

    public int insertPublicKeyService(int id, int userId , int keyVersion, String publicKey, LocalDate date, int is_Active) {

        return pbdao.insertPublicKey(id, userId, keyVersion, publicKey, date, is_Active);
    }
}
