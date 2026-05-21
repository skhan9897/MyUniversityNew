<%@ page import="java.util.*" %>
<%
String name = (String) request.getAttribute("name");
Integer id = (Integer) request.getAttribute("id");
String phone = (String) request.getAttribute("phone");
Double amount = (Double) request.getAttribute("amount");
String date = (String) request.getAttribute("date");

if(name == null){
    response.sendRedirect("studentDashboard.jsp");
    return;
}

String receiptNo = "REC" + System.currentTimeMillis();
%>

<!DOCTYPE html>
<html>
<head>
<title>Academic Fee Receipt</title>

<style>

/* ? BODY BACKGROUND */
body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:url('images/university.png') no-repeat center center fixed;
    background-size:cover;
}

/* ? RECEIPT BOX */
.receipt{
    width:500px;
    margin:60px auto;
    background:#fff;
    padding:25px;
    border-radius:10px;
    box-shadow:0 0 20px rgba(0,0,0,0.25);
    position:relative;
    overflow:hidden;
}

/* ? WATERMARK */
.receipt::before{
    content:"";
    background:url('images/logo.png') no-repeat center;
    background-size:170px;
    opacity:0.07;
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    pointer-events:none;
}

/* ? HEADER */
.top{
    text-align:center;
    position:relative;
    z-index:2;
}

.top img{
    width:120px;
}

.top h2{
    margin:5px 0;
    color:#222;
}

.top h4{
    margin:0;
    color:#555;
}

/* ? DETAILS */
.details{
    margin-top:15px;
    position:relative;
    z-index:2;
}

.row{
    display:flex;
    justify-content:space-between;
    padding:8px 0;
    border-bottom:1px solid #ddd;
    font-size:14px;
}

.label{
    font-weight:bold;
    color:#333;
}

.value{
    color:#444;
}

.amount{
    color:green;
    font-weight:bold;
}

/* ? BUTTONS */
.buttons{
    text-align:center;
    margin-top:20px;
}

.btn{
    padding:10px 18px;
    margin:5px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    color:white;
    font-size:14px;
}

.download{
    background:#28a745;
}

.download:hover{
    background:#218838;
}

.back{
    background:#007bff;
}

.back:hover{
    background:#0056b3;
}

/* ? PRINT FIX (MOST IMPORTANT) */
@media print {

    /* ? hide buttons */
    .buttons{
        display:none;
    }

    /* clean layout */
    .receipt{
        box-shadow:none;
        margin:0 auto;
        border-radius:0;
    }

    /* ? watermark force visible */
    .receipt::before{
        opacity:0.1 !important;
    }

    /* remove background image for clean print */
    body{
        background:#fff;
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
}

</style>
</head>

<body>

<div class="receipt">

    <div class="top">
        <img src="images/logo.png">
        <h2>Bareilly University</h2>
        <h4>Academic Fee Receipt</h4>
    </div>

    <div class="details">

        <div class="row">
            <span class="label">Receipt No:</span>
            <span class="value"><%=receiptNo%></span>
        </div>

        <div class="row">
            <span class="label">Student ID:</span>
            <span class="value"><%=id%></span>
        </div>

        <div class="row">
            <span class="label">Name:</span>
            <span class="value"><%=name%></span>
        </div>

        <div class="row">
            <span class="label">Phone:</span>
            <span class="value"><%=phone%></span>
        </div>

        <div class="row">
            <span class="label">Amount Paid:</span>
            <span class="value amount"><%=amount%></span>
        </div>

        <div class="row">
            <span class="label">Date:</span>
            <span class="value"><%=date%></span>
        </div>

    </div>

    <div class="buttons">
        <button class="btn download" onclick="window.print()">Download</button>

        <button class="btn back"
            onclick="window.location.href='studentDashboard.jsp'">
            Back to Dashboard
        </button>
    </div>

</div>

</body>
</html>