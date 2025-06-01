package com.thomas.controller;

import com.thomas.dao.model.Belts;
import com.thomas.dao.model.CartItem;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "buyNowController", value = "/buyNow")
public class buyNowController extends HttpServlet {
    UploadProductService uploadProductService = new UploadProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int beltId = Integer.parseInt(request.getParameter("beltId"));
        double price = Double.parseDouble(request.getParameter("price"));
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if(cart == null) {
            cart = new HashMap<>();
        }
        Belts belt = uploadProductService.getProductById(beltId);
        CartItem item = new CartItem(belt, 1, price);
        cart.put(beltId, item);
        session.setAttribute("cart", cart);
        response.sendRedirect("/checkout");
    }
}

