package com.thomas.controller;

import com.thomas.dao.model.User;
import com.thomas.services.KeyService;
import com.thomas.services.MD5Service;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.crypto.SecretKey;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.time.LocalDate;
import java.util.Base64;

@WebServlet(name = "verifyPassword", value = "/verifyPassword")
public class verifyPasswordController extends HttpServlet {
    KeyService keyService = new KeyService();
    MD5Service md5Service = new MD5Service();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String userPassword = keyService.getPasswordById(user.getId());
        String password = request.getParameter("password");

        if(md5Service.hashPassword(password).equals(userPassword)){

            KeyPair keyPair = null;

            try {
                keyPair = keyService.genKeyPair();
                PublicKey pk = keyPair.getPublic();
                PrivateKey pv = keyPair.getPrivate();
                PrintWriter writer = response.getWriter();
                writer.println(Base64.getEncoder().encodeToString(pk.getEncoded()));
                writer.println(Base64.getEncoder().encodeToString(pv.getEncoded()));
                // 2. Sinh salt + key AES từ mật khẩu
                byte[] salt = keyService.genSalt();
                SecretKey keyAES = keyService.genKeyFromPassword(password);
                // 3. Mã hóa private key
                String encryptedPV = keyService.encryptText(keyService.keyToBase64(pv.getEncoded()),keyAES.getEncoded());
                // 4. Lưu public key mới vào DB
                keyService.updateIsActive(user.getId(),0);
                keyService.insertPublicKey(user.getId(),keyService.keyToBase64(pk.getEncoded()), LocalDate.now(),1);
                // 5. Lấy key version mới nhất
                int keyVersion = keyService.getKeyVersionActivated(user.getId());

                // 6. Ghi ra file public/private
                File pkFile = keyService.publicKeyFile(keyService.keyToBase64(pk.getEncoded()),user.getId(),keyVersion,request.getServletContext());
                File pvFile = keyService.privateKeyFile(encryptedPV,keyService.keyToBase64(salt), user.getId(),keyVersion,request.getServletContext());
                request.setAttribute("userId",user.getId());
                request.setAttribute("keyVersion",keyVersion);
                request.getRequestDispatcher("/frontend/genKeyPairPage/genKeyPairPage.jsp").forward(request, response);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }
    }
}

