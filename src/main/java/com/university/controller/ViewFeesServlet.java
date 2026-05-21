package com.university.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.university.dao.FeesDAO;
import com.university.model.Fees;

@WebServlet("/viewFees")
public class ViewFeesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FeesDAO dao = new FeesDAO();

        List<Fees> list = dao.getAllFees();

        request.setAttribute("feesList", list);

        request.getRequestDispatcher("viewFees.jsp").forward(request, response);
    }
}