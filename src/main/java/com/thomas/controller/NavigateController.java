package com.thomas.controller;

import com.thomas.dao.model.Belts;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "allProductController", value = "/navigate")
public class NavigateController extends HttpServlet {
    UploadProductService uploadProductService = new UploadProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String type = request.getParameter("type");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String sort = request.getParameter("descPrice");
        List<Belts> beltsList;
        List<Belts> sortedList = null;
        if (type.equals("all")) {
            String title = "Sản Phẩm";
            String mainImage = "/assets/images/allProduct.png";
            String bigTitle = "Tất cả Sản Phẩm";
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
//            request.setAttribute("type", type);
            session.setAttribute("type", type);
            request.setAttribute("mainImage", mainImage);
            List<Belts> listBelt = uploadProductService.getAllProductsForDisplay();
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("men")) {
            String title = "Nam";
            String bigTitle = "Thắt Lưng Nam";
            String mainImage = "assets/images/banner/z6088271164003_2200fec21842ecda09fe85ab32825a86.jpg";
            request.setAttribute("mainImage", mainImage);
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
            request.setAttribute("type", type);
            request.setAttribute("mainImage", mainImage);
            List<Belts> listBelt = uploadProductService.getMaleOrFemaleAndMaterialProducts("M", "all");
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("women")) {
            String title = "Nữ";
            String bigTitle = "Thắt Lưng Nữ";
            String mainImage = "assets/images/banner/z6088271164002_95c694291ffaeb61697b3ab7fdaf8065.png";
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
            request.setAttribute("type", type);
            request.setAttribute("mainImage", mainImage);
            List<Belts> listBelt = uploadProductService.getMaleOrFemaleAndMaterialProducts("N", "all");
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("menLeather")) {
            String title = "Nam";
            String bigTitle = "Thắt Lưng Da Nam";
            String mainImage = "assets/images/banner/z6088271164003_2200fec21842ecda09fe85ab32825a86.jpg";
            request.setAttribute("mainImage", mainImage);
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
            request.setAttribute("type", type);
            List<Belts> listBelt = uploadProductService.getMaleOrFemaleAndMaterialProducts("M", "da");
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            request.setAttribute("listBelt", listBelt);
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("menCanvas")) {
            String title = "Nam Canvas";
            String bigTitle = "Thắt lưng Canvas Nam";
            String mainImage = "assets/images/banner/z6088271164003_2200fec21842ecda09fe85ab32825a86.jpg";
            request.setAttribute("mainImage", mainImage);
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
            request.setAttribute("type", type);
            List<Belts> listBelt = uploadProductService.getMaleOrFemaleAndMaterialProducts("M", "canvas");
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            request.setAttribute("listBelt", listBelt);
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("womenLeather")) {
            String title = "Nữ Leather";
            String bigTitle = "Thắt lưng Da Nữ";
            String mainImage = "assets/images/banner/z6088271164002_95c694291ffaeb61697b3ab7fdaf8065.png";
            request.setAttribute("mainImage", mainImage);
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
            request.setAttribute("type", type);
            List<Belts> listBelt = uploadProductService.getMaleOrFemaleAndMaterialProducts("N", "da");
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            request.setAttribute("listBelt", listBelt);
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("womenCanvas")) {
            String title = "Nữ Canvas";
            String bigTitle = "Thắt lưng Canvas Nữ";
            String mainImage = "assets/images/banner/z6088271164002_95c694291ffaeb61697b3ab7fdaf8065.png";
            request.setAttribute("mainImage", mainImage);
            request.setAttribute("title", title);
            request.setAttribute("bigTitle", bigTitle);
            request.setAttribute("type", type);
            List<Belts> listBelt = uploadProductService.getMaleOrFemaleAndMaterialProducts("N", "canvas");
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }
        if (type.equals("collection")) {
            beltsList = uploadProductService.getCollection();
            request.setAttribute("beltsList", beltsList);
            request.getRequestDispatcher("/frontend/collectionPage/collectionsPage.jsp").forward(request, response);
        }
        if (type.equals("collectionSection")) {
            String collectionName = request.getParameter("collectionName");
            beltsList = uploadProductService.getProductInCollection(collectionName);
            request.setAttribute("collectionList", beltsList);
            if (collectionName.equalsIgnoreCase("VICTOR")) {
                request.getRequestDispatcher("frontend/collectionPage/collectionSection/VICTOR.jsp").forward(request, response);
            }
            if (collectionName.equalsIgnoreCase("EMO")) {
                request.getRequestDispatcher("frontend/collectionPage/collectionSection/EMO.jsp").forward(request, response);
            }
        }
        if (type.equals("onsale")) {
            String title = "Nữ Canvas";
            String bigTitle = "Sản Phẩm Giảm Giá";
            String mainImage = "assets/images/homepage/z6088271163993_ca5603db38e0ae9d411375a3aeb3ef65.jpg";
            List<Belts> listBelt = uploadProductService.getDiscountProductsForDisplay();
            if (minPrice != null && maxPrice != null) {
                listBelt = uploadProductService.filterProduct(listBelt, Double.parseDouble(minPrice), Double.parseDouble(maxPrice));
            }
            if (sort != null) {
                sortedList = uploadProductService.getSortedListBelts(sort, listBelt);
                for (int i = 0; i < sortedList.size(); i++) {
                    for (int j = 0; j < listBelt.size(); j++) {
                        if (sortedList.get(i).getName().equals(listBelt.get(j).getName())) {
                            sortedList.get(i).setMainImage(listBelt.get(j).getMainImage());
                        }
                    }
                }
            }
            if (sortedList != null) {
                request.setAttribute("listBelt", sortedList);

            } else {
                request.setAttribute("listBelt", listBelt);
            }
            pagingforPage(request, listBelt);
            request.getRequestDispatcher("/frontend/allProduct/allProduct1.jsp").forward(request, response);
        }


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