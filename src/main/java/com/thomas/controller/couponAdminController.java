package com.thomas.controller;

import com.thomas.dao.model.Coupon;
import com.thomas.dao.model.User;
import com.thomas.services.UploadCouponService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "couponAdminController", value = "/admin/table/coupons")
public class couponAdminController extends HttpServlet {
    UploadCouponService uploadCouponService = new UploadCouponService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ajaxHeader = request.getHeader("X-Requested-With");
        if ("XMLHttpRequest".equals(ajaxHeader)) {
            String message = request.getParameter("message");

            if ("update".equals(message)) {
                try {
                    int couponId = Integer.parseInt(request.getParameter("couponId"));
                    Coupon coupon = uploadCouponService.getCoupon(couponId);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    PrintWriter out = response.getWriter();
                    out.write("{");
                    out.write("\"code\": \"" + coupon.getCode() + "\",");
                    out.write("\"discountPercentage\": \"" + coupon.getDiscountRate() + "\",");
                    out.write("\"startDate\": \"" + coupon.getStartDate() + "\",");
                    out.write("\"endDate\": \"" + coupon.getEndDate() + "\",");
                    out.write("\"isActive\": \"" + coupon.getIsActive() + "\"");
                    out.write("}");
                    out.flush();
                    return;
                } catch (Exception e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID or server error.");
                    return;
                }
            }
        }
        List<Coupon> couponList = uploadCouponService.getAllCoupon();
        request.setAttribute("couponList", couponList);

        request.getRequestDispatcher("/frontend/AdminPage/allCoupon/allCoupon.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;
        String message = request.getParameter("message");
        int couponId = 0;
        if (message.equals("delete")) {
            couponId = Integer.parseInt(request.getParameter("couponId"));
            uploadCouponService.deleteCoupon(couponId);
            response.sendRedirect(request.getContextPath() + "/admin/table/coupons");
        } else {
            String startDateString = request.getParameter("startDate");
            LocalDate startDate = LocalDate.parse(startDateString, formatter);
            String endDateString = request.getParameter("endDate");
            LocalDate endDate = LocalDate.parse(endDateString, formatter);
            String couponCode = request.getParameter("couponCode");
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            int isActive = Integer.parseInt(request.getParameter("isActive"));
            if (message.equals("create")) {
                uploadCouponService.createCoupon(startDate, endDate, couponCode.toUpperCase(), discountPercentage, isActive);

            } else if (message.equals("update")) {
                couponId = Integer.parseInt(request.getParameter("couponId"));
                uploadCouponService.updateCoupon(couponId, startDate, endDate, couponCode.toUpperCase(), discountPercentage, isActive);
            }
            response.sendRedirect(request.getContextPath() + "/admin/table/coupons");
        }

    }
}

