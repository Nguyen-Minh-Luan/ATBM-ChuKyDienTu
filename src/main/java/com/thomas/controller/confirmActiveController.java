package com.thomas.controller;

import com.thomas.dao.model.User;
import com.thomas.services.KeyService;
import com.thomas.services.TokenService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "confirmActiveController", value = "/confirmSuccess")
public class confirmActiveController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("messageRedirect");
        TokenService tokenService = new TokenService();
        KeyService keyService = new KeyService();
        String token = request.getParameter("token");
        boolean isValid = tokenService.verifyToken(token);
        boolean active = tokenService.activeUser(token);
        User user = keyService.getUserByToken(token);
        if (isValid && active) {
            request.setAttribute("active", 1);
            request.setAttribute("messageRedirect", "Liên kết kích hoặc không hợp lệ");
            request.setAttribute("keyVersion",keyService.getKeyVersionActivated(user.getId()));
            request.setAttribute("userId", user.getId());
        }
        if (message != null) {
            request.setAttribute("messageRedirect", message);
            if (message.equals("orderDetailSuccess")) {
                HttpSession session = request.getSession();
                session.removeAttribute("cart");
            }
        }
        request.getRequestDispatcher("/frontend/signInPage/confirmSuccessSignUp/confirmSuccess.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

