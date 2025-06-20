package com.thomas.controller;

import com.thomas.dao.model.Order;
import com.thomas.dao.model.OrderDetails;
import com.thomas.dao.model.SignatureEntity;
import com.thomas.services.SignatureService;
import com.thomas.services.UploadOrderDetailService;
import com.thomas.services.UploadOrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

@WebServlet(name = "GetOrderHashServlet", urlPatterns = {"/GetOrderHash"})
public class GetOrderHashServlet extends HttpServlet {
    UploadOrderService uploadOrderService = new UploadOrderService();
    UploadOrderDetailService uploadOrderDetailService = new UploadOrderDetailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            System.out.println(orderId);
            Order order = uploadOrderService.getOrderById(orderId);
            System.out.println(order.toString());
            if (order == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
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
            System.out.println("get: " + sb.toString());
            String hash = "";
            try {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hashBytes = digest.digest(sb.toString().getBytes(StandardCharsets.UTF_8));
                hash = Base64.getEncoder().encodeToString(hashBytes);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(hash);
            response.setContentType("text/plain");
            response.getWriter().write(hash);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error: " + e.getMessage());
        }
    }


}
