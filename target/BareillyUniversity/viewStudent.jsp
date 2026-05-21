<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>View Students</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:url('images/university.png') no-repeat center;
    background-size:cover;
}

/* ? HEADER */
.header{
    text-align:center;
    color:white;
    padding:20px;
}

.header img{
    width:120px;
}

.header h2{
    margin:5px 0;
}

/* ? TABLE BOX */
.container{
    width:90%;
    margin:20px auto;
    background:rgba(255,255,255,0.95);
    padding:20px;
    border-radius:10px;
    position:relative;
}

/* ? WATERMARK */
.container::before{
    content:"";
    background:url('images/logo.png') no-repeat center;
    background-size:300px;
    opacity:0.05;
    position:absolute;
    width:100%;
    height:100%;
    top:0;
    left:0;
    pointer-events:none;
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#007bff;
    color:white;
    padding:10px;
}

td{
    padding:10px;
    text-align:center;
    border-bottom:1px solid #ccc;
}

img{
    border-radius:50%;
}

/* BUTTONS */
.btn{
    padding:5px 10px;
    border:none;
    color:white;
    cursor:pointer;
}

.edit{background:green;}
.delete{background:red;}

</style>
</head>

<body>

<!-- ? HEADER -->
<div class="header">
    <img src="images/logo.png">
    <h2>Bareilly University</h2>
    <h3>Student Details</h3>
</div>

<!-- ? TABLE -->
<div class="container">

<table>

<tr>
<th>Photo</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Department</th>
<th>Duration</th>
<th>Fees</th>
<th>Action</th>
</tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/Bareilly_University","root","1234");

    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(
    "SELECT s.*, c.duration, c.total_fee FROM students s LEFT JOIN courses c ON s.course_id=c.id");

    while(rs.next()){
%>

<tr>

<td>
<img src="images/<%=rs.getString("photo")%>" width="60" height="60">
</td>

<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("phone")%></td>
<td><%=rs.getString("department")%></td>

<td><%=rs.getInt("duration")%> Years</td>
<td><%=rs.getDouble("total_fee")%></td>

<td>
<a href="editStudent.jsp?id=<%=rs.getInt("id")%>">
<button class="btn edit">Edit</button>
</a>

<a href="deleteStudent?id=<%=rs.getInt("id")%>">
<button class="btn delete">Delete</button>
</a>
</td>

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