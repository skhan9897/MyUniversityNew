package com.university.controller;

import com.university.dao.StudentDAO;
import com.university.model.Student;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/generateIdCard")
public class GenerateIdCardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            StudentDAO dao = new StudentDAO();
            Student s = dao.getStudentById(id);

            request.setAttribute("student", s);

            RequestDispatcher rd = request.getRequestDispatcher("/idCard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}