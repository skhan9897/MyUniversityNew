<%@ page session="true" %>

<%
String email = (String) session.getAttribute("email");
if(email == null){
    response.sendRedirect("loginStudent.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Pay Fees</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:url("images/university.png") no-repeat center;
    background-size:cover;
}

/* OVERLAY FIX (IMPORTANT) */
.overlay{
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.3);
    top:0;
    left:0;
    z-index:0;
}

/* BOX */
.box{
    position:relative;
    z-index:10;   /* ? THIS FIXES CLICK ISSUE */
    width:380px;
    margin:120px auto;
    padding:30px;
    background:white;
    border-radius:15px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

/* LOGO */
.logo{
    width:60px;
}

/* INPUT */
input{
    width:90%;
    padding:12px;
    margin:15px 0;
    border-radius:6px;
    border:1px solid #ccc;
    font-size:15px;
}

/* BUTTON */
button{
    width:95%;
    padding:12px;
    border:none;
    border-radius:6px;
    background:linear-gradient(45deg,#00c853,#64dd17);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform:scale(1.05);
    background:linear-gradient(45deg,#00b248,#4caf50);
}

/* BACK BUTTON */
.back{
    margin-top:10px;
    display:inline-block;
    text-decoration:none;
    color:#333;
}
</style>

</head>

<body>

<div class="overlay"></div>

<div class="box">

    <img src="images/logo.png" class="logo">
    <h2>Pay Fees</h2>

    <!-- ? FORM FIX -->
    <form action="payFees" method="post">

        <input type="number" name="amount" placeholder="Enter Amount" required>

        <!-- ? BUTTON FIX -->
        <button type="submit">Pay Now</button>

    </form>

    <a href="studentDashboard.jsp" class="back">Back</a>

</div>

</body>
</html>