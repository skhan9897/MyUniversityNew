package com.university.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.university.util.DBConnection;

@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM student_register WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone", rs.getString("phone"));
                request.setAttribute("department", rs.getString("department"));
                request.setAttribute("tenth", rs.getString("tenth_percentage"));
                request.setAttribute("twelfth", rs.getString("twelfth_percentage"));
                request.setAttribute("photo", rs.getString("photo"));
            }

            RequestDispatcher rd = request.getRequestDispatcher("editStudent.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}