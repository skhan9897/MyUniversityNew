<%@page import="java.sql.*"%>

<%
String email = (String) session.getAttribute("studentEmail");

if(email == null){

    response.sendRedirect("loginStudent.jsp");
    return;
}

String name="";
String phone="";
String dept="";
String photo="default.jpeg";

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/Bareilly_University",
    "root",
    "1234");

    PreparedStatement ps =
    con.prepareStatement(
    "SELECT * FROM students WHERE email=?");

    ps.setString(1,email);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){

        name = rs.getString("name");
        phone = rs.getString("phone");
        dept = rs.getString("department");
        photo = rs.getString("photo");
    }

}catch(Exception e){

    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>

<style>
body{
    margin:0;
    font-family: 'Segoe UI';
    background:url('images/university.png') no-repeat center center fixed;
    background-size:cover;
}

/* ? NAVBAR */
.navbar{
    background: rgba(0,0,0,0.8);
    padding: 12px;
    text-align:center;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin:0 15px;
    font-size:16px;
    position:relative;
}

.navbar a::after{
    content:"";
    width:0;
    height:2px;
    background:#00c6ff;
    position:absolute;
    left:0;
    bottom:-5px;
    transition:0.3s;
}

.navbar a:hover::after{
    width:100%;
}

/* ? CARD */
.card{
    width:800px;
    margin:60px auto;
    background:rgba(255,255,255,0.95);
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 25px rgba(0,0,0,0.4);
    position:relative;
}

/* WATERMARK */
.card::before{
    content:"";
    background:url('images/logo.png') no-repeat center;
    background-size:250px;
    opacity:0.05;
    position:absolute;
    width:100%;
    height:100%;
    top:0;
    left:0;
}

/* CONTENT */
.content{
    position:relative;
    z-index:2;
}

/* PROFILE */
.profile{
    text-align:center;
}

.profile img{
    width:120px;
    height:120px;
    border-radius:50%;
    border:4px solid #00c6ff;
}

/* TABLE */
table{
    width:100%;
    margin-top:20px;
    border-collapse:collapse;
}

td{
    padding:12px;
    border-bottom:1px solid #ddd;
    font-size:16px;
}

td:first-child{
    font-weight:bold;
    color:#333;
}

/* BUTTONS */
.buttons{
    text-align:center;
    margin-top:25px;
}

.btn{
    padding:10px 18px;
    margin:5px;
    border:none;
    border-radius:6px;
    color:white;
    cursor:pointer;
}

.view{ background:#17a2b8; }
.id{ background:#28a745; }
.pay{ background:#ffc107; color:black;}
.logout{ background:#dc3545; }

.btn:hover{
    opacity:0.85;
}

</style>
</head>

<body>

<!-- ? NAVBAR -->
<div class="buttons">

    <a href="viewFees.jsp" class="btn blue">
        View Fees
    </a>

    <a href="idCard.jsp" class="btn green">
        ID Card
    </a>

    <a href="payFees.jsp" class="btn yellow">
        Pay Fees
    </a>

    <a href="StudentLogoutServlet" class="btn red">
        Logout
    </a>

</div>

<!-- ? DASHBOARD CARD -->
<div class="card">
<div class="content">

    <div class="profile">
       <img src="uploads/<%=photo%>"
     class="profile-photo">
        <h2>Student Dashboard</h2>
    </div>

    <!-- ? TABLE -->
    <table>
        <tr><td>Name</td><td><%=name%></td></tr>
        <tr><td>Email</td><td><%=email%></td></tr>
        <tr><td>Phone</td><td><%=phone%></td></tr>
        <tr><td>Department</td><td><%=dept%></td></tr>
       
    </table>

    <!-- ? BUTTONS -->
    <div class="buttons">
        <a href="viewFees.jsp">View Fees</a>

<a href="idCard.jsp">ID Card</a>

<a href="payFees.jsp">Pay Fees</a>

<a href="StudentLogoutServlet">Logout</a>
    </div>

</div>
</div>

</body>
</html>