package com.university.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/registerStudent")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)

public class RegisterStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // TEXT DATA

            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String email = request.getParameter("email").trim();
            String phone = request.getParameter("phone");
            String password = request.getParameter("password").trim();
            String department = request.getParameter("department");
            String duration = request.getParameter("duration");
            String fees = request.getParameter("fees");

            // FILE PARTS

            Part photoPart = request.getPart("photo");
            Part aadhaarPart = request.getPart("aadhaar");
            Part marksheet10Part = request.getPart("marksheet10");
            Part marksheet12Part = request.getPart("marksheet12");

            // GENERATE UNIQUE FILE NAMES

            String photoName = generateFileName(photoPart);
            String aadhaarName = generateFileName(aadhaarPart);
            String marksheet10Name = generateFileName(marksheet10Part);
            String marksheet12Name = generateFileName(marksheet12Part);

            // UPLOAD PATH

            String uploadPath =
                    getServletContext().getRealPath("")
                    + File.separator + "uploads";

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {

                uploadDir.mkdirs();
            }

            // SAVE FILES

            photoPart.write(uploadPath + File.separator + photoName);

            aadhaarPart.write(uploadPath + File.separator + aadhaarName);

            marksheet10Part.write(uploadPath + File.separator + marksheet10Name);

            marksheet12Part.write(uploadPath + File.separator + marksheet12Name);

            // DATABASE CONNECTION

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Bareilly_University",
                    "root",
                    "1234"
            );

            // INSERT QUERY

            PreparedStatement ps = con.prepareStatement(

                "INSERT INTO students(name,age,email,phone,password,department,duration,fees,photo,aadhaar,marksheet10,marksheet12) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, password);
            ps.setString(6, department);
            ps.setString(7, duration);
            ps.setString(8, fees);

            ps.setString(9, photoName);
            ps.setString(10, aadhaarName);
            ps.setString(11, marksheet10Name);
            ps.setString(12, marksheet12Name);

            ps.executeUpdate();

            response.sendRedirect("loginStudent.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(e);
        }
    }

    // GENERATE UNIQUE FILE NAME

    private String generateFileName(Part part) {

        String originalFileName =
                Paths.get(part.getSubmittedFileName())
                .getFileName()
                .toString();

        String extension = "";

        int i = originalFileName.lastIndexOf(".");

        if (i > 0) {

            extension = originalFileName.substring(i);
        }

        return System.currentTimeMillis()
                + "_"
                + Math.round(Math.random() * 10000)
                + extension;
    }
}