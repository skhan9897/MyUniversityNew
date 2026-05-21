import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/payFees")
public class PayFeesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("email") == null){
            response.sendRedirect("loginStudent.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Connection con = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Bareilly_University","root","1234");

            // 🔥 IMPORTANT: proper column fetch
            PreparedStatement ps = con.prepareStatement(
                "SELECT id, name, phone FROM students WHERE email=?");

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            int id = 0;
            String name = "";
            String phone = "";

            if(rs.next()){
                id = rs.getInt("id");
                name = rs.getString("name");
                phone = rs.getString("phone");

                System.out.println("DEBUG -> ID: " + id);
                System.out.println("DEBUG -> Phone: " + phone);
            }

            // ❗ अगर id 0 है मतलब DB issue
            if(id == 0){
                response.getWriter().println("Student not found in DB");
                return;
            }

            // insert fees
            PreparedStatement ps2 = con.prepareStatement(
                "INSERT INTO fees(student_id, amount, payment_date) VALUES(?,?,NOW())");

            ps2.setInt(1, id);
            ps2.setDouble(2, amount);
            ps2.executeUpdate();

            // 🔥 PASS DATA (FINAL)
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("amount", amount);
            request.setAttribute("date", new java.util.Date().toString());

            RequestDispatcher rd = request.getRequestDispatcher("receipt.jsp");
            rd.forward(request, response);

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}