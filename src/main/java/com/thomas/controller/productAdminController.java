package com.thomas.controller;

import com.thomas.dao.model.Belts;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "productAdminController", value = "/admin/table/belts")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class productAdminController extends HttpServlet {
    private static final String ULOAD_DIR = "uploads";
    private static final UploadProductService uploadProductService = new UploadProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Belts> beltList = uploadProductService.getProducts();
        request.setAttribute("beltList", beltList);
        request.getRequestDispatcher("/frontend/AdminPage/allProduct/allProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        if (message.equals("delete")) {
            int beltId = Integer.parseInt(request.getParameter("beltId"));
            uploadProductService.deleteProduct(beltId);
            response.sendRedirect(request.getContextPath() + "/admin/table/belts");
            return;
        }


        response.sendRedirect("/admin/table/belts/createProduct");
    }
}
