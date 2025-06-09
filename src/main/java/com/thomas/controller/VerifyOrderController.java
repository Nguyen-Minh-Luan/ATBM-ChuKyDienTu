//package com.thomas.controller;
//
//import com.thomas.dao.OrderDao;
//import com.thomas.dao.model.Order;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//
//@WebServlet("/verify-order")
//public class VerifyOrderController extends HttpServlet {
//    private final OrderDao orderDao = new OrderDao();
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String orderId = req.getParameter("orderId");
//
//        if (orderId == null || orderId.isBlank()) {
//            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            resp.getWriter().write("Missing orderId");
//            return;
//        }
//
//        Order order = orderDao.findById(orderId);
//
//        if (order != null && order.isSignatureValid()) {
//            resp.setStatus(HttpServletResponse.SC_OK);
//            resp.getWriter().write("Order signature is valid");
//        } else {
//            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//            resp.getWriter().write("Invalid signature or order not found");
//        }
//    }
//}
