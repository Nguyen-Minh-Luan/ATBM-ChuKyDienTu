package com.thomas.services;

import com.thomas.dao.PublicKeyDao;
import com.thomas.dao.UserDao;
import com.thomas.dao.model.PublicKeyEntity;
import com.thomas.dao.model.User;
import jakarta.servlet.ServletContext;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

public class KeyService {
    PublicKeyDao pbdao;
    UserDao udao;
    PublicKey pk;
    PrivateKey pv;
    byte[] salt ;

    public KeyService() {
        this.pbdao = new PublicKeyDao();
        this.udao = new UserDao();
    }

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
    public String keyToBase64(byte[] key) {
        return Base64.getEncoder().encodeToString(key);
    }

    public SecretKey base64ToKeyAES(String base64Key) {
        byte[] keyBytes = Base64.getDecoder().decode(base64Key);
        return new SecretKeySpec(keyBytes, "AES");
    }

    public String encryptText(String plainText, byte[] keyBytes) throws Exception {
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");

        cipher.init(Cipher.ENCRYPT_MODE, keySpec);

        byte[] encrypted = cipher.doFinal(plainText.getBytes("UTF-8"));
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public File privateKeyFile(String privateKey, String salt,int userId , int version, ServletContext servletContext) {

        String realPath = servletContext.getRealPath("/assets/key/");
        System.out.println("Path để ghi file: " + realPath);
        File file = new File(realPath, "privateKey" + userId +"V"+ version + ".txt");


        try {
            file.getParentFile().mkdirs(); // Tạo thư mục nếu chưa có

            // Sử dụng BufferedOutputStream để tăng hiệu năng
            try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file))) {
                String content = salt + "\n" + privateKey;
                bos.write(content.getBytes("UTF-8")); // Ghi bằng UTF-8
                bos.flush(); // Đảm bảo ghi hết vào file
            }

            return file;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }


    public File publicKeyFile(String publicKey,int userId, int version,ServletContext servletContext) {
        String realPath = servletContext.getRealPath("/assets/key/");
        System.out.println("Path để ghi file: " + realPath);
        File file = new File(realPath, "publicKey"+ userId +"V"+ version + ".txt");

        File dir = new File(realPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file))) {
            bos.write(publicKey.getBytes(StandardCharsets.UTF_8));
            bos.flush();
        } catch (IOException e) {
            e.printStackTrace();
            return null; // hoặc throw exception nếu muốn
        }

        return file;
    }
    public PublicKeyEntity getPublicKeyByVersionAndUserId(int userId, int keyVersion) {
        return pbdao.getPublicKeyByVersionAndUserId(userId, keyVersion);
    }

    public int insertPublicKey(int userId, String publicKey, LocalDate date, int is_Active) {
        return pbdao.insertPublicKey(userId, publicKey, date, is_Active);
    }
    public int updateIsActive(int userId, int  isActive) {
        return pbdao.updateIsActive(userId,isActive);
    }

    public List<PublicKeyEntity> getAllPublicKeysByUserId(int userId) {
        return pbdao.getAllKeysByUserId(userId);
    }

    public Optional<PublicKeyEntity> getKeyActive(int userId) {
        List<PublicKeyEntity> keys = getAllPublicKeysByUserId(userId);
        return keys.stream()
                .filter(k -> k.getIsActive() == 1) // lọc theo isActive = 1
                .max(Comparator.comparingInt(PublicKeyEntity::getKeyVersion)); // lấy keyVersion lớn nhất
    }
    public User findUserByEmail(String email){
        return udao.findUserEmail(email);
    }
    public int getKeyVersionActivated(int userId) {
        return pbdao.getKeyVersionActivated(userId);
    }
    public String getPasswordById(int userId) {return udao.getPasswordById(userId);}
    public User getUserByToken(String token){return udao.getUserByToken(token);}
    public static void main(String[] args) throws NoSuchAlgorithmException {
    }

}
