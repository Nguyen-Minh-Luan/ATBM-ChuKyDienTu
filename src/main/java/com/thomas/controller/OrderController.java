package com.thomas.controller;

import com.thomas.dao.model.*;
import com.thomas.services.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.Optional;

@WebServlet(name = "OrderController", value = "/Order")
public class OrderController extends HttpServlet {
    UploadAddressService uploadAddressService = new UploadAddressService();
    UploadOrderService uploadOrderService = new UploadOrderService();
    UploadPaymentMethod uploadPaymentMethod = new UploadPaymentMethod();
    UploadOrderDetailService uploadOrderDetailService = new UploadOrderDetailService();
    SignatureService signatureService = new SignatureService();
    KeyService keyService = new KeyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        Coupon cp = (Coupon) session.getAttribute("appliedCoupon");
        User user = (User) session.getAttribute("auth");
        int userId = user.getId();
        String signature = request.getParameter("sign");
        Optional<PublicKeyEntity> latestKeyOpt = keyService.getKeyActive(user.getId());
        int keyVer;
        if (latestKeyOpt.isPresent()) {
            keyVer = latestKeyOpt.get().getKeyVersion();
            Address address = uploadAddressService.getAddressByUserId(userId);
            String paymentMethod = request.getParameter("paymentMethod");
            int paymentMethodId = uploadPaymentMethod.getPaymentMethodId(paymentMethod);
            double totalPrice = 0, shippingCost = 0;
            for (CartItem cartItem : cart.values()) {
                totalPrice += cartItem.getPrice() * cartItem.getQuantity();
                shippingCost = cartItem.getQuantity() * 15.000;
            }
            double discountRate = cp == null ? 0 : cp.getDiscountRate();
            double discountAmount = totalPrice * (discountRate / 100);
            double grandTotal = totalPrice + shippingCost + discountAmount;
            if (uploadOrderService.createOrder(userId, paymentMethodId, address.getId(), LocalDate.now(), grandTotal, "Đang xử lý", 0)) {
                Order order = uploadOrderService.getLatestOrder();
                for (CartItem cartItem : cart.values()) {
                    uploadOrderDetailService.createOrderDetail(order.getId(), cartItem.getPrice(), cartItem.getBelt().getId(), cartItem.getQuantity());
                }
                signatureService.saveSignature(order.getId(), userId, keyVer, signature);

                response.sendRedirect("/confirmSuccess?messageRedirect=orderDetailSuccess");
            }
        }
    }
}

