package com.thomas.services;

import com.thomas.dao.PaymentMethodDao;
import com.thomas.dao.model.PaymentMethod;

import java.util.List;

public class UploadPaymentMethod {
    PaymentMethodDao paymentMethodDao;

    public UploadPaymentMethod() {
        paymentMethodDao = new PaymentMethodDao();
    }

    public List<PaymentMethod> getPaymentMethods() {
        return paymentMethodDao.getPaymentMethods();
    }

    public int getPaymentMethodId(String paymentMethod) {
        return paymentMethodDao.getPaymentMethodId(paymentMethod);
    }
}
