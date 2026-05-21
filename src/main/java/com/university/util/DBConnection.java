package com.university.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con = null;

    public static Connection getConnection() {

        try {

            // Connection check
            if (con == null || con.isClosed()) {

                // MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // ==============================
                // RAILWAY MYSQL DETAILS
                // ==============================

                String host = "turntable.proxy.rlwy.net";
                String port = "51827";
                String database = "railway";
                String username = "root";
                String password = "SLHktmkZhUbQpHRwuyHkolYJXvKG1UvU";

                // JDBC URL
                String url =
                        "jdbc:mysql://" + host + ":" + port + "/" + database
                        + "?useSSL=false"
                        + "&allowPublicKeyRetrieval=true"
                        + "&serverTimezone=UTC";

                // Create Connection
                con = DriverManager.getConnection(url, username, password);

                System.out.println("Database Connected Successfully");
            }

        } catch (Exception e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();
        }

        return con;
    }
}