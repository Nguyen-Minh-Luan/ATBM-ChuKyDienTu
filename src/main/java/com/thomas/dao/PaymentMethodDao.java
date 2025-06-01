package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.PaymentMethod;

import java.util.List;

public class PaymentMethodDao {
    public List<PaymentMethod> getPaymentMethods() {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "select * from paymentMethods";
            return h.createQuery(sql).mapToBean(PaymentMethod.class).list();
        });
    }

    public int getPaymentMethodId(String paymentMethod) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "select id from paymentMethods where name = :paymentMethod";
            return h.createQuery(sql).bind("paymentMethod", paymentMethod).mapTo(Integer.class).findFirst().orElse(-1);
        });
    }
}
