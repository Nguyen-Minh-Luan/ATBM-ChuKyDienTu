package com.thomas.controller;

import com.thomas.dao.model.Belts;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "searchController", value = "/search")
public class searchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UploadProductService uploadProductService = new UploadProductService();
        String mainImage = "assets/images/Gray Minimalist New Collection Banner (1) 1.jpg";
        String keyword = request.getParameter("keyword");
        request.setAttribute("keyword", keyword);
        List<Belts> beltsList = uploadProductService.searchProduct(keyword);
        int totalProduct = beltsList.size();
        String message = "";
        request.setAttribute("beltsList", beltsList);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("mainImage", mainImage);
        if (beltsList.size() == 0 || beltsList == null) {
            request.getRequestDispatcher("frontend/allProduct/notFound.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}