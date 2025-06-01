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

@WebServlet(name = "filterController", value = "/filter")
public class filterController extends HttpServlet {
    //khi bấm submit thì nó sẽ trả về type rồi dựa vào đó để lấy ra list cần dùng
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UploadProductService uploadProductService = new UploadProductService();

        String type = session.getAttribute("type").toString();
        request.setAttribute("type", type);
        double min = Double.parseDouble(request.getParameter("minPrice"));
        double max = Double.parseDouble(request.getParameter("maxPrice"));
        String mainImage = "/assets/images/allProduct.png";
        List<Belts> filteredList = new ArrayList<>();
        if (type.equalsIgnoreCase("all")) {
            filteredList = uploadProductService.getAllProductsForDisplay();
        }
        if (type.equalsIgnoreCase("men")) {
            filteredList = uploadProductService.getMaleOrFemaleAndMaterialProducts("M", "all");
        }
        if (type.equalsIgnoreCase("women")) {
            filteredList = uploadProductService.getMaleOrFemaleAndMaterialProducts("F", "all");
        }
        if (type.equalsIgnoreCase("menLeather")) {
            filteredList = uploadProductService.getMaleOrFemaleAndMaterialProducts("M", "da");
        }
        if (type.equalsIgnoreCase("menCanvas")) {
            filteredList = uploadProductService.getMaleOrFemaleAndMaterialProducts("M", "canvas");
        }
        if (type.equalsIgnoreCase("womenLeather")) {
            filteredList = uploadProductService.getMaleOrFemaleAndMaterialProducts("F", "da");
        }
        if (type.equalsIgnoreCase("menCanvas")) {
            filteredList = uploadProductService.getMaleOrFemaleAndMaterialProducts("F", "canvas");
        }
        request.setAttribute("mainImage", mainImage);
        pagingforPage(request, uploadProductService.filterProduct(filteredList, min, max));
        request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    public void pagingforPage(HttpServletRequest request, List<Belts> beltsList) {
        HttpSession session = request.getSession();
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.trim().isEmpty()) {
            try {
                currentPage = Math.max(1, Integer.parseInt(pageParam.trim()));
            } catch (NumberFormatException e) {
                Logger.getLogger(getClass().getName()).warning("Invalid page parameter: " + pageParam);
            }
        }

        int totalProduct = beltsList.size();
        int itemPerPage = 12;
        int totalPages = totalProduct / itemPerPage;
        if (totalProduct % itemPerPage != 0) {
            totalPages += 1;
        }
        currentPage = Math.min(currentPage, totalPages);
        int startIndex = (currentPage - 1) * itemPerPage; // lấy sản phẩm tiếp theo trong danh sách
        int endIndex = Math.min(startIndex + itemPerPage, totalProduct);
        List<Belts> beltsForPage = startIndex < totalProduct // tạo ra 1 list mới để chứa những sản phẩm kế tiếp trong trang hiện tại
                ? beltsList.subList(startIndex, endIndex)
                : new ArrayList<>();

        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        session.setAttribute("beltsList", beltsForPage);
    }
}