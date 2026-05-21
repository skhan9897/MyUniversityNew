package com.university.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addFees")
public class AddFeesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // FORM DATA
        String studentId = request.getParameter("studentId");
        String department = request.getParameter("department");
        String duration = request.getParameter("duration");
        String totalFees = request.getParameter("totalFees");

        try {

            // MYSQL DRIVER
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DATABASE CONNECTION
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Bareilly_University",
                    "root",
                    "1234"
            );

            // INSERT QUERY
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO fees(student_id,department,duration,total_fees) VALUES(?,?,?,?)"
            );

            // SET VALUES
            ps.setInt(1, Integer.parseInt(studentId));
            ps.setString(2, department);
            ps.setString(3, duration);
            ps.setDouble(4, Double.parseDouble(totalFees));

            // EXECUTE
            int i = ps.executeUpdate();

            if (i > 0) {

                response.sendRedirect("viewFees");

            } else {

                response.getWriter().println("Insert Failed");
            }

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("ERROR : " + e.getMessage());
        }
    }
}