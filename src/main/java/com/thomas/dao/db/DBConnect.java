package com.thomas.dao.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
    static Connection conn;
    static String url = "jdbc::mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname()+"?"+DBProperties.option();

    public static Statement getStatement() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
            }
            return conn.createStatement();
        } catch (SQLException e) {
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        }
    }
}
