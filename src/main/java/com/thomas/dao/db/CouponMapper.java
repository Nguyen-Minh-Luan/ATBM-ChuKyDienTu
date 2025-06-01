package com.thomas.dao.db;

import com.thomas.dao.model.Coupon;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CouponMapper implements RowMapper<Coupon> {
    @Override
    public Coupon map(ResultSet rs, StatementContext ctx) throws SQLException {
        Coupon coupon = new Coupon();
        coupon.setId(rs.getInt("id"));
        coupon.setCode(rs.getString("code"));
        coupon.setDiscountRate(rs.getDouble("discountRate"));
        coupon.setStartDate(rs.getDate("startDate").toLocalDate());
        coupon.setEndDate(rs.getDate("endDate").toLocalDate());
        coupon.setIsActive(rs.getInt("isActive"));
        return coupon;
    }
}
