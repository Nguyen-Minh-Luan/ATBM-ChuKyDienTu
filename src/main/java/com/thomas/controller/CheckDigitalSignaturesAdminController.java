package com.thomas.controller;

import com.thomas.dao.model.*;
import com.thomas.services.KeyService;
import com.thomas.services.SignatureService;
import com.thomas.services.UploadOrderDetailService;
import com.thomas.services.UploadOrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "checkDigitalSignatureApi", value = "/api/check-digital-signatures")
public class CheckDigitalSignaturesAdminController extends HttpServlet {
    private final UploadOrderService uploadOrderService = new UploadOrderService();
    private final UploadOrderDetailService uploadOrderDetailService = new UploadOrderDetailService();
    private final SignatureService digitalSignatureService = new SignatureService();
    private final KeyService keyService = new KeyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String orderIdParam = request.getParameter("orderId");
            System.out.println("oid:" +  orderIdParam);
            if (orderIdParam == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"message\": \"Thiếu orderId\"}");
                return;
            }

            int orderId = Integer.parseInt(orderIdParam);

            Order order = uploadOrderService.getOrderById(orderId);
            if (order == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"message\": \"Không tìm thấy đơn hàng\"}");
                return;
            }

            List<OrderDetails> orderDetails = uploadOrderDetailService.getAllOrderDetails(orderId);

            StringBuilder sb = new StringBuilder();
            sb.append(orderId);
            if (order.getUserId() != 0) {
                sb.append(order.getUserId()).append("|");
            }
            sb.append(1);
            sb.append(order.getAddressesId());
            sb.append("orderDate=").append(order.getOrderDate()).append("|")
                    .append("grandTotal=").append(order.getOrderTotal()).append("|");

            assert orderDetails != null;
            for (OrderDetails detail : orderDetails) {
                sb.append(detail.getId());
                sb.append(orderId);
                sb.append(detail.getPrice()).append("|");
                sb.append(detail.getBeltId()).append("|");
                sb.append(detail.getQuantity()).append("|");
            }
            String hash= "";
            try {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hashBytes = digest.digest(sb.toString().getBytes(StandardCharsets.UTF_8));
                hash = Base64.getEncoder().encodeToString(hashBytes);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Hashing error");
                return;
            }
            System.out.println("hash: "+hash);
            boolean verified = checkDigitalSignature(orderId, order.getUserId(), hash);
            System.out.println("verified: "+verified);
            String json = String.format("{\"orderId\": %d, \"verified\": %s}", orderId, verified);
            response.getWriter().write(json);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"message\": \"orderId không hợp lệ\"}");
        } catch (Exception e) {
            e.printStackTrace();  // Xem kỹ trong log
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\": \"Lỗi máy chủ nội bộ\"}");
        }
    }

    public boolean checkDigitalSignature(int id, int userId, String hash) {
        try {
            SignatureEntity signatureRecord = digitalSignatureService.getSignatureByOrder(id);
            if (signatureRecord == null) return false;

            int keyVersion = signatureRecord.getKeyVersion();
            PublicKeyEntity publicKeyRecord = keyService.getPublicKeyByVersionAndUserId(userId, keyVersion);
            if (publicKeyRecord == null) return false;

            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyRecord.getPublicKey());
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyFactory.generatePublic(new X509EncodedKeySpec(publicKeyBytes));

            Signature signature = Signature.getInstance("SHA512withRSA");
            signature.initVerify(publicKey);
            signature.update(hash.getBytes(StandardCharsets.UTF_8));
            System.out.println("userId: "+userId + "keyVer: "+keyVersion);
            System.out.println("sig: " + signatureRecord.getSignature());
            byte[] signatureBytes = Base64.getDecoder().decode(signatureRecord.getSignature());
            return signature.verify(signatureBytes);
        } catch (Exception e) {
            e.printStackTrace();  // Cực kỳ quan trọng để debug
            return false;
        }
    }
}
