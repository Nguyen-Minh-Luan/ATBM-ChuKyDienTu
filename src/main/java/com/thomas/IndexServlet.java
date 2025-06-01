package com.thomas;

import com.thomas.dao.model.Belts;
import com.thomas.services.UploadProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/homePageController")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        UploadProductService uploadProductService = new UploadProductService();
        List<Belts> newArrivalsList = uploadProductService.getNewArrivals();
        List<Belts> mostPopular = uploadProductService.getBeltByViewCountHomePage();
        List<Belts> discountProduct = uploadProductService.getDiscountProductsForDisplay();
        request.setAttribute("newArrivalsList", newArrivalsList);
        request.setAttribute("mostPopularList", mostPopular);
        request.setAttribute("discountProductList", discountProduct);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}