package com.thomas.services;

import com.thomas.dao.UserDao;
import com.thomas.dao.model.User;

public class TokenService {
    UserDao userDao;

    public TokenService() {
        this.userDao = new UserDao();
    }

    public boolean updatePasswordByToken(String token, String password) {
        boolean isDone = userDao.setPasswordByToken(token, password);
        return isDone;
    }

    public boolean verifyToken(String token) {
        return userDao.verifyToken(token);
    }

    public boolean saveResetToken(String toEmail, String token) {
       return userDao.saveResetToken(toEmail, token);
    }

    public boolean activeUser(String token) {
        return userDao.activeByToken(token);
    }
}
