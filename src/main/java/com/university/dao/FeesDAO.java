package com.university.dao;

import java.sql.*;
import java.util.*;

import com.university.model.Fees;
import com.university.util.DBConnection;

public class FeesDAO {

    Connection con = null;

    public FeesDAO() {
        try {
            con = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ 1. ADD FEES
    public boolean addFees(Fees f) {

        boolean status = false;

        try {
            String sql = "INSERT INTO fees(student_id, total_fee, paid_amount) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, f.getStudentId());
            ps.setDouble(2, f.getTotalFee());
            ps.setDouble(3, f.getPaidAmount());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ✅ 2. GET ALL FEES
    public List<Fees> getAllFees() {

        List<Fees> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM fees";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Fees f = new Fees();

                f.setId(rs.getInt("id"));
                f.setStudentId(rs.getInt("student_id"));
                f.setTotalFee(rs.getDouble("total_fee"));
                f.setPaidAmount(rs.getDouble("paid_amount"));

                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ 3. GET FEES BY STUDENT ID
    public Fees getFeesByStudentId(int studentId) {

        Fees f = null;

        try {
            String sql = "SELECT * FROM fees WHERE student_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                f = new Fees();

                f.setId(rs.getInt("id"));
                f.setStudentId(rs.getInt("student_id"));
                f.setTotalFee(rs.getDouble("total_fee"));
                f.setPaidAmount(rs.getDouble("paid_amount"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // ✅ 4. UPDATE PAYMENT (Pay Fees)
    public boolean updateFees(int studentId, double paidAmount) {

        boolean status = false;

        try {
            String sql = "UPDATE fees SET paid_amount = paid_amount + ? WHERE student_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, paidAmount);
            ps.setInt(2, studentId);

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}