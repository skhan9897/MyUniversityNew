<%@ page session="true" %>

<%
if(session.getAttribute("name")==null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>ID Card</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:url('images/university.png') no-repeat center;
    background-size:cover;
}

/* CARD */
.card{
    width:330px;
    margin:60px auto;
    background:white;
    padding:20px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
}

/* PHOTO */
.photo{
    width:100px;
    height:100px;
    border-radius:50%;
    border:3px solid #007bff;
    margin:10px 0;
}

/* TEXT */
h3{
    margin:5px 0;
}

p{
    margin:6px 0;
    font-size:14px;
}

/* BUTTONS */
.buttons{
    text-align:center;
    margin-top:20px;
}

.btn{
    padding:10px 16px;
    margin:5px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    color:white;
}

.print{ background:#28a745; }
.back{ background:#007bff; }

/* ? PRINT FIX */
@media print {

    .buttons{
        display:none;   /* ? button hide */
    }

    body{
        background:white;
    }

    .card{
        box-shadow:none;
        margin:0 auto;
    }
}
</style>
</head>

<body>

<div class="card">

    <!-- LOGO -->
    <img src="<%=request.getContextPath()%>/images/logo.png" width="70">

    <h3>Bareilly University</h3>
    <h4>Student ID Card</h4>

    <!-- ? PHOTO (OLD FLOW SESSION) -->
    <img class="photo"
    <img src="images/<%=session.getAttribute("photo")%>" width="100">

    <!-- DETAILS -->
    <p><b>ID:</b> <%=session.getAttribute("id")%></p>
    <p><b>Name:</b> <%=session.getAttribute("name")%></p>
    <p><b>Email:</b> <%=session.getAttribute("email")%></p>
    <p><b>Phone:</b> <%=session.getAttribute("phone")%></p>
    <p><b>Department:</b> <%=session.getAttribute("department")%></p>

</div>

<!-- ? BUTTONS -->
<div class="buttons">
    <button class="btn print" onclick="window.print()">Download</button>

    <button class="btn back"
        onclick="window.location.href='studentDashboard.jsp'">
        Back to Dashboard
    </button>
</div>

</body>
</html>