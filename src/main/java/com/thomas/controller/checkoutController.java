package com.thomas.controller;

import com.thomas.dao.model.*;
import com.thomas.services.UploadAddressService;
import com.thomas.services.UploadPaymentMethod;
import com.thomas.services.UploadUserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Base64;
import java.util.List;
import java.util.Map;


@WebServlet(name = "checkoutController", value = "/checkout")
public class checkoutController extends HttpServlet {
    UploadUserService uploadUserService = new UploadUserService();
    UploadAddressService uploadAddressService = new UploadAddressService();
    UploadPaymentMethod uploadPaymentMethod = new UploadPaymentMethod();
    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    DecimalFormat formatter = new DecimalFormat("#,###.000", symbols);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        symbols.setGroupingSeparator(',');
        symbols.setDecimalSeparator('.');
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        Coupon cp = (Coupon) session.getAttribute("appliedCoupon");
        User user = (User) session.getAttribute("auth");
        int cartSize = cart.size();
        double shipmentPrice = 0;
        double totalPrice = 0;
        for (CartItem cartItem : cart.values()) {
            totalPrice += cartItem.getQuantity() * cartItem.getPrice();
//            shipmentPrice += cartItem.getQuantity() * 15.000;
        }
//        double discountRate = cp == null ? 0 : cp.getDiscountRate();
//        double discountAmount = totalPrice * (discountRate / 100);
//        double grandTotal = totalPrice + shipmentPrice + discountAmount;
        List<Address> userAddresses = uploadAddressService.getAddressList(user.getId());

        List<PaymentMethod> paymentMethods = uploadPaymentMethod.getPaymentMethods();

        if (userAddresses.isEmpty()) {
            String message = "Vui lòng thêm địa chỉ ở phần thiết lập cá nhân";
            request.setAttribute("messageAddress", message);
        } else {
            request.setAttribute("userAddresses", userAddresses);
        }
        String formattedShipmentPrice = formatter.format(shipmentPrice).replace(",", ".");
//        String formattedGrandTotal = formatter.format(grandTotal).replace(",", ".");
        String formattedTotalPrice = formatter.format(totalPrice).replace(",", ".");
        request.setAttribute("paymentMethods", paymentMethods);
        request.setAttribute("cartSize", cartSize);
        request.setAttribute("shipmentPrice", formattedShipmentPrice);
//        request.setAttribute("grandTotal", formattedGrandTotal);
        request.setAttribute("totalPrice", formattedTotalPrice);

        String errorMsg = request.getParameter("error");
        if (errorMsg != null && !errorMsg.isEmpty()) {
            request.setAttribute("messageRedirect", errorMsg);
        }

        StringBuilder sb = new StringBuilder();
        if (user != null) {
            sb.append(user.getId()).append("|");
        }
        String paymentMethodIdStr = request.getParameter("paymentMethodId");

        sb.append("orderDate=").append(java.time.LocalDate.now().toString()).append("|");
        sb.append("totalPrice=").append(totalPrice).append("|");
        sb.append("shipmentPrice=").append(shipmentPrice).append("|");
//        sb.append("discountAmount=").append(discountAmount).append("|");
//        sb.append("grandTotal=").append(grandTotal).append("|");

// Lặp qua cart để thêm chi tiết từng món
        for (CartItem cartItem : cart.values()) {
            sb.append(cartItem.getBelt().getName()).append(",")
                    .append(cartItem.getQuantity()).append(",")
                    .append(cartItem.getPrice()).append(";");
        }

        String orderString = sb.toString();
        System.out.println(orderString);
        String hashValue = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(orderString.getBytes(StandardCharsets.UTF_8));
            hashValue = Base64.getEncoder().encodeToString(hash);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orderHash", hashValue);
        request.getRequestDispatcher("/frontend/cartPage/checkoutPage/checkoutPage.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

