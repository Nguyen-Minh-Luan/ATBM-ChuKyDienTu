package com.thomas.dao;

import com.thomas.dao.db.JDBIConnect;
import com.thomas.dao.model.Reviews;
import org.jdbi.v3.core.Handle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
    public List<Reviews> getReviews() {
        return JDBIConnect.get().withHandle(handle -> {
            String sql = "select * from reviews";
            List<Reviews> reviews = new ArrayList<>();
            try (Handle h = handle) {
                h.execute(sql);
                ResultSet rs = h.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {
                    Reviews review = new Reviews();
                    review.setId(rs.getInt("id"));
                    review.setBeltId(rs.getInt("beltId"));
                    review.setUserId(rs.getInt("userId"));
                    review.setContent(rs.getString("content"));
                    review.setReviewerStar(rs.getInt("ratingStar"));
                    review.setCreatedAt(rs.getDate("createdAt").toLocalDate());
                    reviews.add(review);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return reviews;
        });
    }

    public String getReviewerName(int reviewerId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT u.name FROM users u JOIN reviews r ON u.id = r.userId WHERE r.userId = :userId";

            // Thực thi câu truy vấn
            String reviewerName = h.createQuery(sql)
                    .bind("userId", reviewerId)
                    .mapTo(String.class)
                    .findFirst().orElse(null);
            return reviewerName;
        });

    }

    public Reviews getReview(int reviewId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT * FROM reviews WHERE id = :reviewId";

            return h.createQuery(sql)
                    .bind("reviewId", reviewId)
                    .map((rs, ctx) -> {
                        Reviews reviews = new Reviews();
                        reviews.setId(rs.getInt("id"));
                        reviews.setBeltId(rs.getInt("beltId"));
                        reviews.setUserId(rs.getInt("userId"));
                        reviews.setContent(rs.getString("content"));
                        reviews.setReviewerStar(rs.getInt("ratingStar"));
                        reviews.setCreatedAt(rs.getDate("createdAt").toLocalDate());
                        return reviews;
                    })
                    .findOne()
                    .orElse(null);
        });
    }


    public boolean deleteReview(int reviewId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "DELETE FROM reviews WHERE id = :reviewId";

            return h.createUpdate(sql)
                    .bind("reviewId", reviewId)
                    .execute() > 0;
        });
    }

    public String findProductNameByReviewId(int reviewId) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "SELECT b.name " +
                    "FROM belts b " +
                    "JOIN reviews r ON b.id = r.beltId " +
                    "WHERE r.id = :reviewId";

            String productName = h.createQuery(sql)
                    .bind("reviewId", reviewId)
                    .mapTo(String.class)
                    .findOne().orElse(null);

            return productName;
        });
    }

    public int getAllReviewByIdSize(int beltId) {
        String sql = "SELECT * FROM reviews WHERE beltId = ?";
        List<Reviews> reviewsList = new ArrayList<>();

        JDBIConnect.get().useHandle(handle -> {
            // Lấy Connection thô từ Handle
            try (Connection conn = handle.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, beltId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Reviews review = new Reviews();
                        review.setId(rs.getInt("id"));
                        review.setBeltId(rs.getInt("beltId"));
                        review.setUserId(rs.getInt("userId"));
                        review.setContent(rs.getString("content"));
                        review.setReviewerStar(rs.getInt("ratingStar"));
                        review.setCreatedAt(rs.getDate("createdAt").toLocalDate());
                        reviewsList.add(review);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error querying reviews", e);
            }
        });

        return reviewsList.size();
    }

    public boolean createReview(Reviews review) {
        return JDBIConnect.get().withHandle(h -> {
            String sql = "INSERT INTO reviews (beltId,userId,content,ratingStar,createdAt) VALUES (:beltId,:userId,:content,:ratingStar,:createdAt)";
            return h.createUpdate(sql)
                    .bind("beltId", review.getBeltId())
                    .bind("userId", review.getUserId())
                    .bind("content", review.getContent())
                    .bind("ratingStar", review.getReviewerStar())
                    .bind("createdAt", review.getCreatedAt()).execute() > 0;
        });
    }

    public List<Reviews> getReviewsByBeltIdPagination(int beltId, int offset, int size) {
        String sql = "SELECT * FROM reviews WHERE beltId = ? LIMIT ? OFFSET ?";
        List<Reviews> reviewsList = new ArrayList<>();

        JDBIConnect.get().useHandle(handle -> {
            // Lấy Connection thô từ Handle
            try (Connection conn = handle.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, beltId);
                stmt.setInt(2, size);
                stmt.setInt(3, offset);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Reviews review = new Reviews();
                        review.setId(rs.getInt("id"));
                        review.setBeltId(rs.getInt("beltId"));
                        review.setUserId(rs.getInt("userId"));
                        review.setContent(rs.getString("content"));
                        review.setReviewerStar(rs.getInt("ratingStar"));
                        review.setCreatedAt(rs.getDate("createdAt").toLocalDate());
                        reviewsList.add(review);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error querying reviews", e);
            }
        });

        return reviewsList;
    }
}
