package com.thomas.controller;

import com.thomas.dao.model.CartItem;
import com.thomas.dao.model.Belts;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartController", value = "/Cart")
public class CartController extends HttpServlet {
    UploadProductService uploadProductService = new UploadProductService();
    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    DecimalFormat formatter = new DecimalFormat("#,###.000", symbols);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        symbols.setGroupingSeparator(',');
        symbols.setDecimalSeparator('.');
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        List<Belts> suggestionBelts = uploadProductService.getRandomBelts();
        for (Belts b : suggestionBelts) {
            b.setImage(uploadProductService.getProductImages(b.getId()));
        }
        if (cart == null) {
            cart = new HashMap<Integer, CartItem>();
            session.setAttribute("cart", cart);
        }

        int cartSize = cart.size();
        double totalPrice = 0;
        double shipmentPrice = 0;

        for (CartItem cartItem : cart.values()) {
            totalPrice += cartItem.getPrice() * cartItem.getQuantity();
            shipmentPrice += cartItem.getQuantity() * 15.000;
        }
        String formattedShipmentPrice = formatter.format(shipmentPrice).replace(",", ".");
        double grandTotal = totalPrice + shipmentPrice;

        if (cart.isEmpty()) {
            grandTotal = 0;
        }

        if (request.getParameter("message") != null) {
            String message = request.getParameter("message");
            if (message.equals("getCartSize")) {
                response.setContentType("text/plain; charset=UTF-8");
                response.getWriter().write(String.valueOf(cart.size()));
                return;
            }
        }

        request.setAttribute("suggestionBelts", suggestionBelts);
        request.setAttribute("formattedShipmentPrice", formattedShipmentPrice);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("cartSize", cartSize);
        request.setAttribute("cart", cart);

        request.getRequestDispatcher("/frontend/cartPage/cartPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        symbols.setGroupingSeparator(',');
        symbols.setDecimalSeparator('.');
        String message = request.getParameter("message");
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(message)) {
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int beltId = Integer.parseInt(request.getParameter("beltId"));
            Belts belt = uploadProductService.getProductById(beltId);
            belt.setImage(uploadProductService.getProductImages(beltId));
            belt.setTag(uploadProductService.getAllCategoriesById(beltId));

            CartItem item = cart.get(beltId);
            if (item == null) {
                item = new CartItem(belt, quantity, price);
                cart.put(beltId, item);
            } else {
                item.setQuantity(item.getQuantity() + quantity);
            }
        } else if ("remove".equals(message)) {
            int beltId = Integer.parseInt(request.getParameter("beltId"));
            if (cart.remove(beltId) != null) {
                session.setAttribute("cart", cart);
                int cartSize = cart.size();
                double totalPrice = 0;
                double shipmentPrice = 0;

                for (CartItem cartItem : cart.values()) {
                    totalPrice += cartItem.getPrice() * cartItem.getQuantity();
                    shipmentPrice += cartItem.getQuantity() * 15.000;
                }

                double grandTotal = totalPrice + shipmentPrice;
                if (cart.isEmpty()) {
                    grandTotal = 0;
                }
                String formattedShipmentPrice = formatter.format(shipmentPrice).replace(",", ".");
                String formattedGrandTotal = formatter.format(grandTotal).replace(",", ".");
                String formattedTotalPrice = formatter.format(totalPrice).replace(",", ".");

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.write("{");
                    out.write("\"totalPrice\": \"" + formattedTotalPrice + "\",");
                    out.write("\"shipmentPrice\": \"" + formattedShipmentPrice + "\",");
                    out.write("\"grandTotal\": \"" + formattedGrandTotal + "\",");
                    out.write("\"cartSize\": " + cartSize);
                    out.write("}");
                }

                response.setStatus(200);

            } else {
                response.setStatus(400);
            }
        } else if ("update".equals(message)) {
            int beltId = Integer.parseInt(request.getParameter("beltId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            CartItem cartItem = cart.get(beltId);

            if (cartItem != null) {
                cartItem.setQuantity(quantity);
                session.setAttribute("cart", cart);

                int cartSize = cart.size();
                double totalPrice = 0;
                double shipmentPrice = 0;

                for (CartItem item : cart.values()) {
                    totalPrice += item.getPrice() * item.getQuantity();
                    shipmentPrice += item.getQuantity() * 15.000;
                }

                double grandTotal = totalPrice + shipmentPrice;
                if (cart.isEmpty()) {
                    grandTotal = 0;
                }
                String formattedShipmentPrice = formatter.format(shipmentPrice).replace(",", ".");
                String formattedGrandTotal = formatter.format(grandTotal).replace(",", ".");
                String formattedTotalPrice = formatter.format(totalPrice).replace(",", ".");

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.write("{");
                    out.write("\"totalPrice\": \"" + formattedTotalPrice + "\",");
                    out.write("\"shipmentPrice\": \"" + formattedShipmentPrice + "\",");
                    out.write("\"grandTotal\": \"" + formattedGrandTotal + "\",");
                    out.write("\"cartSize\": " + cartSize);
                    out.write("}");
                }
                response.setStatus(200);
            } else {
                response.setStatus(400);
            }
        } else {
            response.setStatus(400);
        }
    }

}

