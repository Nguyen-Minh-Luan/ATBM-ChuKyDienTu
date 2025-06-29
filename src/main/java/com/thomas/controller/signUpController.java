package com.thomas.controller;

import com.thomas.dao.model.User;
import com.thomas.services.KeyService;
import com.thomas.services.SignUpService;
import com.thomas.services.TokenService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.crypto.SecretKey;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Properties;
import java.util.UUID;

@WebServlet(name = "signUpController", value = "/signup")
public class signUpController extends HttpServlet {
    TokenService service = new TokenService();
    SignUpService signUpService = new SignUpService();
    KeyService keyService = new KeyService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("auth") == null) {
            request.getRequestDispatcher("/frontend/signInPage/signUpPage/signUp.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = null;
        String toEmail = request.getParameter("email");
        String host = "smtp.gmail.com";
        String port = "587";
        String from = "huynhminhthang246@gmail.com";
        String passwordSender = "zhfz gtpx bkbp cuuo";
        //Properties : Khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
        props.put("mail.smtp.port", port); //TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, passwordSender);
            }
        };
        //Phiên làm việc
        Session session = Session.getInstance(props, auth);
        //Gửi email
        String to = "huynhminhthang246@gmail.com";


        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String middleName = request.getParameter("middleName");
        String birthDateString = request.getParameter("birthDate");
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;
        LocalDate birthDate = LocalDate.parse(birthDateString, formatter);
        boolean isSuccess = signUpService.signUp(email, password, name, middleName, birthDate);
        User user = keyService.findUserByEmail(email);
        //Tạo một tin nhắn mới
        MimeMessage message = new MimeMessage(session);
        try {
            token = UUID.randomUUID().toString();
            String resetLink = "http://localhost:8080/confirmSuccess?token=" + token;
            String messageContent = "Vui lòng nhấn vào đường dẫn này để kích hoạt tài khoản.\n" +
                    resetLink + "\n" +
                    "Nếu bạn không yêu cầu điều này, vui lòng bỏ qua email này.";

            //Kiểu nội dung
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //Người gửi
            message.setFrom(from);
            //Ngời nhận
            message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(toEmail, false));
            // Tiêu đề email
            message.setSubject("Xác nhận email");
            //Nội dung
            message.setText(messageContent, "UTF-8");
            // Gủi email
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        boolean isSaveToken = service.saveResetToken(toEmail, token);

        if (!isSuccess && isSaveToken) {
            request.setAttribute("errorMessage", "Tài khoản đã tồn tại");
            request.getRequestDispatcher("/frontend/signInPage/signUpPage/signUp.jsp").forward(request, response);

        }

        try {
            // 1. Tạo cặp khóa RSA
            KeyPair keyPair = keyService.genKeyPair();
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
            keyService.insertPublicKey(user.getId(),keyService.keyToBase64(pk.getEncoded()),LocalDate.now(),1);
            // 5. Lấy key version mới nhất
            int keyVersion = keyService.getKeyVersionActivated(user.getId());

            // 6. Ghi ra file public/private
            File pkFile = keyService.publicKeyFile(keyService.keyToBase64(pk.getEncoded()),user.getId(),keyVersion,request.getServletContext());
            File pvFile = keyService.privateKeyFile(encryptedPV,keyService.keyToBase64(salt), user.getId(),keyVersion,request.getServletContext());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        request.getRequestDispatcher("/confirmSuccess").forward(request, response);
        response.sendRedirect("/confirmSuccess");
    }
}

