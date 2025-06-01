package com.thomas.controller;

import com.thomas.dao.model.Category;
import com.thomas.dao.model.Belts;
import com.thomas.dao.model.User;
import com.thomas.services.UploadFavoriteService;
import com.thomas.services.UploadProductService;
import com.thomas.services.UploadReviewService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "productDetailsController", value = "/productDetails")
public class productDetailsController extends HttpServlet {
    UploadProductService uploadProductService = new UploadProductService();
    UploadReviewService uploadReviewService = new UploadReviewService();
    UploadFavoriteService uploadFavoriteService = new UploadFavoriteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int beltId = Integer.parseInt(request.getParameter("beltId"));
        uploadProductService.saveBeltView(beltId);
        boolean isPurchasedBelt = false;
        if (user != null) {
            isPurchasedBelt = uploadProductService.isUserPurchased(beltId, user.getId());

        }
        Belts belt = uploadProductService.getProductById(beltId);
        belt.setPrice(belt.getPrice());
        belt.setImage(uploadProductService.getProductImages(beltId));
        List<Category> beltCategory = uploadProductService.getAllCategoriesById(beltId);
        int totalReview = uploadReviewService.getTotalReviewsCount(beltId);
        List<String> descBeltImage = uploadProductService.getAllDescImage(beltId);
        List<Belts> randomBelts = uploadProductService.getRandomBelts();
        for (Belts b : randomBelts) {
            b.setImage(uploadProductService.getProductImages(b.getId()));
        }
        List<Belts> beltViewCount = uploadProductService.getBeltByViewCount();
        for (Belts b : beltViewCount) {
            b.setImage(uploadProductService.getProductImages(b.getId()));
        }
        request.setAttribute("isPurchasedBelt", isPurchasedBelt);
        request.setAttribute("beltViewCount", beltViewCount);
        request.setAttribute("randomBelts", randomBelts);
        request.setAttribute("descBeltImage", descBeltImage);
        request.setAttribute("totalReview", totalReview);
        request.setAttribute("beltCategory", beltCategory);
        request.setAttribute("belt", belt);
        request.getRequestDispatcher("/frontend/productDetail/productDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        if (message.equals("postComment")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String content = request.getParameter("desc");
            int beltId = Integer.parseInt(request.getParameter("beltId"));
            if (uploadReviewService.createReview(rating, content, beltId, userId)) {
                response.sendRedirect("/productDetails?beltId=" + beltId);
            }
        }
    }
}

