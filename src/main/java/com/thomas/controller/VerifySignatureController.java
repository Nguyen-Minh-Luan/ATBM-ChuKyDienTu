package com.thomas.controller;

import com.thomas.dao.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.security.*;
import java.security.spec.X509EncodedKeySpec;
import java.net.URLEncoder;
import java.util.Base64;

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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");


        String hashValue = request.getParameter("hashValue");
        String signatureBase64 = request.getParameter("signature");

        String message;
        boolean isVerified = false;

        try {
            PublicKey publicKey = getPublicKeyFromBase64(USER_PUBLIC_KEY_BASE64);
            isVerified = verifyText(hashValue, signatureBase64, publicKey);

            if (isVerified) {
                message = "✅ Xác minh chữ ký thành công! Đơn hàng đang được xử lý.";
            } else {
                message = "❌ Xác minh chữ ký thất bại! Vui lòng kiểm tra lại thông tin.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "❌ Lỗi xác minh chữ ký: " + e.getMessage();
        }

        if (isVerified) {
            request.setAttribute("paymentMethod", request.getParameter("paymentMethod"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/frontend/cartPage/checkoutPage/autoOrderForward.jsp");
            dispatcher.forward(request, response);
        } else {
            String encodedMsg = URLEncoder.encode(message, "UTF-8");
            response.sendRedirect(request.getContextPath() + "/checkout?error=" + encodedMsg);
        }
    }
}
