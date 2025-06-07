package com.thomas.controller;

import com.thomas.dao.model.PublicKeyEntity;
import com.thomas.dao.model.User;
import com.thomas.services.KeyService;
import com.thomas.services.SignatureService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.security.*;
import java.security.spec.X509EncodedKeySpec;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.Optional;

@WebServlet(name = "verifySignatureController", value = "/verifySignature")
public class VerifySignatureController extends HttpServlet {


    private PublicKey getPublicKeyFromBase64(String base64PublicKey) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(base64PublicKey);
        X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(spec);
    }

    private boolean verifyText(String hashValue, String signature, PublicKey publicKey)
            throws NoSuchAlgorithmException, InvalidKeyException, SignatureException {
        Signature s = Signature.getInstance("SHA512withRSA");
        s.initVerify(publicKey);
        s.update(hashValue.getBytes());
        return s.verify(Base64.getDecoder().decode(signature));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        KeyService keyService = new KeyService();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");


        String hashValue = request.getParameter("hashValue");
        String signatureBase64 = request.getParameter("signature");

        String message;
        boolean isVerified = false;
        int keyVer = 1;
        Optional<PublicKeyEntity> latestKeyOpt = keyService.getKeyActive(user.getId());

        try {
            if (latestKeyOpt.isPresent()) {
                String publicKeyBase64 = latestKeyOpt.get().getPublicKey();
                PublicKey publicKey = getPublicKeyFromBase64(publicKeyBase64);
                keyVer = latestKeyOpt.get().getKeyVersion();
                isVerified = verifyText(hashValue, signatureBase64, publicKey);

                if (isVerified) {
                    message = "✅ Xác minh chữ ký thành công! Đơn hàng đang được xử lý.";
                } else {
                    message = "❌ Xác minh chữ ký thất bại! Vui lòng kiểm tra lại thông tin.";
                }
            } else {
                message = "❌ Không tìm thấy public key hợp lệ của người dùng.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "❌ Lỗi xác minh chữ ký: " + e.getMessage();
        }

        if (isVerified) {
            request.setAttribute("sign", signatureBase64);
            request.setAttribute("keyVer", keyVer);
            request.setAttribute("hash", hashValue);
            request.setAttribute("paymentMethod", request.getParameter("paymentMethod"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/frontend/cartPage/checkoutPage/autoOrderForward.jsp");
            dispatcher.forward(request, response);
        } else {
            String encodedMsg = URLEncoder.encode(message, "UTF-8");
            response.sendRedirect(request.getContextPath() + "/checkout?error=" + encodedMsg);
        }
    }
}