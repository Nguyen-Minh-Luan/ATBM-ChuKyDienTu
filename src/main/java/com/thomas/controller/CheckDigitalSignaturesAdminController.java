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

@WebServlet(name = "checkDigitalSignaturesAdminController", value = "/admin/table/check-digital-signatures")
public class CheckDigitalSignaturesAdminController extends HttpServlet {
    UploadOrderService uploadOrderService = new UploadOrderService();
    UploadOrderDetailService uploadOrderDetailService = new UploadOrderDetailService();
    private final SignatureService digitalSignatureService = new SignatureService();
    private final KeyService keyService = new KeyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int userId = user.getId();
        boolean verifyStoring = false;

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            System.out.println(orderId);
            Order order = uploadOrderService.getOrderById(orderId);
            if (order == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                return;
            }

            double totalPrice = 0;
            double shipmentPrice = 0;
            List<OrderDetails> orderDetails = uploadOrderDetailService.getAllOrderDetails(orderId);
            if (orderDetails != null) {
                for (OrderDetails detail : orderDetails) {
                    totalPrice += detail.getQuantity() * detail.getPrice();
                }
            }

            StringBuilder sb = new StringBuilder();
            if (order.getUserId() != 0) {
                sb.append(order.getUserId()).append("|");
            }
            sb.append("orderDate=").append(order.getOrderDate()).append("|")
                    .append("totalPrice=").append(totalPrice).append("|")
                    .append("shipmentPrice=").append(shipmentPrice).append("|");

            for (OrderDetails detail : orderDetails) {
                sb.append(uploadOrderDetailService.getBeltName(detail.getId())).append(",")
                        .append(detail.getQuantity()).append(",")
                        .append(detail.getPrice()).append(";");
            }

            String hash;
            try {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hashBytes = digest.digest(sb.toString().getBytes(StandardCharsets.UTF_8));
                hash = Base64.getEncoder().encodeToString(hashBytes);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Hashing error");
                return;
            }
            System.out.println(hash);
            verifyStoring = checkDigitalSignature(orderId, userId, hash);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error: " + e.getMessage());
        }
        request.setAttribute("verifyStoring", verifyStoring);

        request.getRequestDispatcher("/frontend/AdminPage/checkDigitalSignatures/allCheckDigitalSignatures.jsp")
                .forward(request, response);
    }

    public boolean checkDigitalSignature(int id, int userId, String invoiceCode) {
        try {
            SignatureEntity signatureRecord = digitalSignatureService.getSignatureByOrder(id);
            if (signatureRecord == null) {
                System.out.println("Không tìm thấy chữ ký số cho invoiceCode = " + invoiceCode);
                return false;
            }

            int keyVersion = signatureRecord.getKeyVersion();
            System.out.println("userId: " + userId + ", version: " + keyVersion);

            PublicKeyEntity publicKeyRecord = keyService.getPublicKeyByVersionAndUserId(userId, keyVersion);
            if (publicKeyRecord == null) {
                System.out.println("Không tìm thấy public key cho version = " + keyVersion);
                return false;
            }

            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyRecord.getPublicKey());
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyFactory.generatePublic(new X509EncodedKeySpec(publicKeyBytes));

            System.out.println(signatureRecord.getSignature());
            Signature signature = Signature.getInstance("SHA256withRSA");
            signature.initVerify(publicKey);

            // Giả định trường raw data lưu thông tin gốc đã được ký
            String originalData = signatureRecord.getSignature();
            signature.update(originalData.getBytes(StandardCharsets.UTF_8));

            byte[] signatureBytes = Base64.getDecoder().decode(signatureRecord.getSignature());
            boolean verified = signature.verify(signatureBytes);
            System.out.println("Kết quả xác thực chữ ký: " + verified);
            return verified;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
