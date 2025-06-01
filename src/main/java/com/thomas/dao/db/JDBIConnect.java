package com.thomas.dao.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import com.thomas.dao.model.Coupon;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class JDBIConnect {
    private static Jdbi jdbi;
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

    public static Jdbi get() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }

    private static void makeConnect() {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setURL(url);
        ds.setUser(DBProperties.username());
        ds.setPassword(DBProperties.password());
        try {
            ds.setUseCompression(true);
            ds.setAutoReconnect(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        jdbi = Jdbi.create(ds);
        jdbi.registerRowMapper(Coupon.class, new CouponMapper());

    }
}
