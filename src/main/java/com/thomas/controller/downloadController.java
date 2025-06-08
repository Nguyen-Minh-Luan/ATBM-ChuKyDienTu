package com.thomas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name = "downloadController", value = "/downloadController")
public class downloadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");             // "public", "private", or "tool"
        String versionStr = request.getParameter("version");    // ví dụ: 3
        String userIdStr = request.getParameter("userId");      // ví dụ: 5

        String fileName;
        String relativePath = "/assets/key/";

        if (type == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số 'type'");
            return;
        }

        switch (type) {
            case "public":
                if (versionStr == null || userIdStr == null) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu version hoặc userId cho public key");
                    return;
                }
                fileName = "publicKey" + userIdStr + "V" + versionStr + ".txt";
                break;

            case "private":
                if (versionStr == null || userIdStr == null) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu version hoặc userId cho private key");
                    return;
                }
                fileName = "privateKey" + userIdStr + "V" + versionStr + ".txt";
                break;


            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Loại file không hợp lệ");
                return;
        }

        // Đường dẫn thực tế tới file
        String absolutePath = getServletContext().getRealPath(relativePath + fileName);
        File file = new File(absolutePath);

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File không tồn tại: " + fileName);
            return;
        }

        // Thiết lập kiểu phản hồi tải về
        response.setContentType(getServletContext().getMimeType(fileName));
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = bis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
        if(type.equals("public")) {
            String realPath = request.getServletContext().getRealPath("/assets/key/");
            String publicKeyPath = realPath + "publicKey"+ userIdStr +"V"+ versionStr + ".txt";
            Files.delete(Path.of(publicKeyPath));
        }
        if(type.equals("private")) {
            String realPath = request.getServletContext().getRealPath("/assets/key/");
            String privateKeyPath = realPath + "privateKey"+ userIdStr +"V"+ versionStr + ".txt";
            Files.delete(Path.of(privateKeyPath));
        }
    }
}
