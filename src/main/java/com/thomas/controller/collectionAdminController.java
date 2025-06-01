package com.thomas.controller;

import com.thomas.dao.model.Collection;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "collectionAdminController", value = "/admin/table/collections")
public class collectionAdminController extends HttpServlet {
    UploadProductService uploadProductService = new UploadProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Collection> collections = uploadProductService.getCollections();
        request.setAttribute("collections", collections);
        request.getRequestDispatcher("/frontend/AdminPage/allCollection/allCollection.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        if (message.equals("create")) {
            String name = request.getParameter("collectionName");
            uploadProductService.createCollection(name);
        } else if (message.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("orderId"));
            uploadProductService.deleteCollections(id);
        }
        response.sendRedirect("/admin/table/collections");
    }
}

