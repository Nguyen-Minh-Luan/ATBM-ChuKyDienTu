package com.thomas.services;

import java.security.*;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class VerifyOrderSignatureService {
    public PublicKey getPublicKeyFromBase64(String base64PublicKey) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(base64PublicKey);
        X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(spec);
    }

    public boolean verifyText(String hashValue, String signature, PublicKey publicKey)
            throws NoSuchAlgorithmException, InvalidKeyException, SignatureException {
        Signature s = Signature.getInstance("SHA512withRSA");
        s.initVerify(publicKey);
        s.update(hashValue.getBytes());
        return s.verify(Base64.getDecoder().decode(signature));
    }
}
