package com.university.dao;

import java.sql.*;
import java.util.*;
import com.university.model.Student;
import com.university.util.DBConnection;

public class StudentDAO {

    // ================= REGISTER =================
    public static boolean registerStudent(Student s) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO student(name,phone,email,password,aadhaar,department,photo,tenth_marksheet,tenth_percent,twelfth_marksheet,twelfth_percent,domicile) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, s.getName());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getPassword());
            ps.setString(5, s.getAadhaar());
            ps.setString(6, s.getDepartment());
            ps.setString(7, s.getPhoto());
            ps.setString(8, s.getTenthMarksheet());
            ps.setDouble(9, s.getTenthPercent());
            ps.setString(10, s.getTwelfthMarksheet());
            ps.setDouble(11, s.getTwelfthPercent());
            ps.setString(12, s.getDomicile());

            int i = ps.executeUpdate();

            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= LOGIN =================
    public static Student login(String email, String password) {
        Student s = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM student WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Student();

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setDepartment(rs.getString("department"));
                s.setPhone(rs.getString("phone"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    // ================= VIEW ALL =================
    public static List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM student";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student s = new Student();

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setDepartment(rs.getString("department"));
                s.setPhone(rs.getString("phone"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= DELETE =================
    public static boolean deleteStudent(int id) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM student WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= GET BY ID =================
    public static Student getStudentById(int id) {
        Student s = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM student WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Student();

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setDepartment(rs.getString("department"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    // ================= UPDATE =================
    public static boolean updateStudent(Student s) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE student SET name=?, phone=?, email=?, department=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, s.getName());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getDepartment());
            ps.setInt(5, s.getId());

            int i = ps.executeUpdate();
            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}