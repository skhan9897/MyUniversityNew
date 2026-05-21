<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
String email = (String) session.getAttribute("email");

if(email == null){
    response.sendRedirect("loginStudent.jsp");
    return;
}

String name="", phone="", dept="", photo="default.jpg";
int studentId = 0;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/Bareilly_University","root","1234");

    // student data
    PreparedStatement ps1 = con.prepareStatement("SELECT * FROM students WHERE email=?");
    ps1.setString(1,email);
    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
        studentId = rs1.getInt("id");
        name = rs1.getString("name");
        phone = rs1.getString("phone");
        dept = rs1.getString("department");
        photo = rs1.getString("photo");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>View Fees</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:url("images/university.png") no-repeat center;
    background-size:cover;
}

/* CARD */
.card{
    width:800px;
    margin:50px auto;
    background:rgba(255,255,255,0.95);
    padding:25px;
    border-radius:15px;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
}

/* HEADER */
.header{
    text-align:center;
}

.photo{
    width:100px;
    height:100px;
    border-radius:50%;
    border:3px solid #2196f3;
    object-fit:cover;
}

/* DETAILS */
.details{
    margin-top:15px;
    text-align:left;
}

.details p{
    margin:5px 0;
}

/* TABLE */
table{
    width:100%;
    margin-top:20px;
    border-collapse:collapse;
}

th{
    background:#2196f3;
    color:white;
    padding:10px;
}

td{
    padding:10px;
    text-align:center;
}

tr:nth-child(even){
    background:#f2f2f2;
}
</style>

</head>

<body>

<div class="card">

    <div class="header">
        <img src="images/<%=session.getAttribute("photo")%>" width="100">
        <h2><%=name%></h2>
    </div>

    <div class="details">
        <p><b>Email:</b> <%=email%></p>
        <p><b>Phone:</b> <%=phone%></p>
        <p><b>Department:</b> <%=dept%></p>
    </div>

    <h3>Fees Payment History</h3>

    <table border="1">
        <tr>
            <th>Receipt ID</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Time</th>
        </tr>

<%
    // fees history
    PreparedStatement ps2 = con.prepareStatement(
        "SELECT * FROM fees WHERE student_id=? ORDER BY payment_date DESC");
    ps2.setInt(1, studentId);

    ResultSet rs2 = ps2.executeQuery();

    while(rs2.next()){
%>

        <tr>
            <td><%=rs2.getInt("id")%></td>
            <td><%=rs2.getDouble("amount")%></td>
            <td><%=rs2.getTimestamp("payment_date").toLocalDateTime().toLocalDate()%></td>
            <td><%=rs2.getTimestamp("payment_date").toLocalDateTime().toLocalTime()%></td>
        </tr>

<%
    }
}catch(Exception e){
    out.println(e);
}
%>

    </table>

</div>

</body>
</html>