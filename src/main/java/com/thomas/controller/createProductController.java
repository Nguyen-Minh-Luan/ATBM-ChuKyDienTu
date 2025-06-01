package com.thomas.controller;

import com.thomas.dao.model.Belts;
import com.thomas.services.UploadProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "createProductController", value = "/admin/table/belts/createProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class createProductController extends HttpServlet {
    private static final String ULOAD_DIR = "uploads";
    private static final String UPLOAD_DIR_SERVER = "C:\\Users\\huynh\\OneDrive\\Desktop\\Nhom38-BanThatLung\\src\\main\\webapp\\uploads";
    private static final UploadProductService uploadProductService = new UploadProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String beltIdParam = request.getParameter("id");
        if (beltIdParam != null) {
            int beltId = Integer.parseInt(beltIdParam);
            Belts belts = uploadProductService.getProductById(beltId);
            List<String> image = uploadProductService.getProductImages(beltId);
            String[] tagsArray = uploadProductService.getTags(beltId);
            if (belts != null) {
                request.setAttribute("product", belts);
                int count = 0;
                for (String s : image) {
                    request.setAttribute("image" + count, s);
                    count++;
                }
                String tags = String.join(" ", tagsArray);
                request.setAttribute("tags", tags);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/table/belts");
                return;
            }
        }
        request.getRequestDispatcher("/frontend/AdminPage/createProductPage/createProductPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;
        int productId = 0;
        if (request.getParameter("beltId") != null && !request.getParameter("beltId").isEmpty()) {
            productId = Integer.parseInt(request.getParameter("beltId"));
        }
        String message = request.getParameter("message").trim();
        String productName = request.getParameter("beltName");
        String[] tags = request.getParameter("tags").split(" ");
        String releaseDateString = request.getParameter("releaseDate");
        LocalDate releaseDate = LocalDate.parse(releaseDateString, formatter);
        String gender = request.getParameter("gender");
        double price = Double.parseDouble(request.getParameter("price"));
        System.out.println(price);
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        int stockQuantity = Integer.parseInt(request.getParameter("quantity"));
        int isDeleted = Integer.parseInt(request.getParameter("isDeleted"));
        String material = request.getParameter("material");

        if (message.equals("create")) {
            uploadProductService.saveProduct(productName, tags, discountPercent, releaseDate, gender, price, stockQuantity, material, isDeleted);
        } else if (message.equals("update")) {
            productId = Integer.parseInt(request.getParameter("beltId"));
            uploadProductService.updateProduct(productId, productName, tags, discountPercent, releaseDate, gender, price, stockQuantity, material, isDeleted);
        }
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + ULOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        handleFileUpload(request, productName, uploadPath, message, uploadProductService, productId);
        response.sendRedirect(request.getContextPath() + "/admin/table/belts");
    }

    private void handleFileUpload(HttpServletRequest request, String productName, String uploadPath, String message, UploadProductService uploadProductService, int productId) throws ServletException, IOException {
        try {
            int count = 0;
            List<String> extraImages = new ArrayList<>();
            List<String> descImages = new ArrayList<>();
            String mainImage = null;

            File productDirectory = new File(uploadPath + File.separator + productName);
            if (!productDirectory.exists()) {
                productDirectory.mkdirs();
            }
            File serverDirectory = new File(UPLOAD_DIR_SERVER + File.separator + productName);
            if (!serverDirectory.exists()) {
                serverDirectory.mkdirs();
            }
            for (Part part : request.getParts()) {
                String fieldName = part.getName();
                String fileName = extractedFile(part);

                if (fileName != null && !fileName.isEmpty() && part.getSize() > 0) {
                    String uniqueFileName = productName + "_" + count + "_" + System.currentTimeMillis() + getFileExtension(fileName);
                    String filePath = productDirectory.getAbsolutePath() + File.separator + uniqueFileName;
                    count++;

                    part.write(filePath);
                    part.write(serverDirectory + File.separator + uniqueFileName);
                    if (count == 1) {
                        mainImage = File.separator + ULOAD_DIR + File.separator + productName + File.separator + uniqueFileName;
                    } else {
                        extraImages.add(File.separator + ULOAD_DIR + File.separator + productName + File.separator + uniqueFileName);
                    }
                }
            }

            if (mainImage != null) {
                if ("create".equals(message)) {
                    int beltId = uploadProductService.getLatestProductId();
                    uploadProductService.saveImagePath(beltId, mainImage, extraImages);
                } else if ("update".equals(message)) {
                    uploadProductService.updateImagePath(productId, mainImage, extraImages);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error handling file upload", e);
        }
    }

    private String extractedFile(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    private String getFileExtension(String filename) {
        return filename.substring(filename.lastIndexOf("."));
    }
}

