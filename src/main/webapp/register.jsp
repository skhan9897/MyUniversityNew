<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>Student Registration</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial;
        }

        body{

            background:url('images/university.jpeg');

            background-size:cover;
            background-position:center;

            min-height:100vh;

            display:flex;
            justify-content:center;
            align-items:center;

            padding:30px;
        }

        .container{

            width:500px;

            background:rgba(255,255,255,0.15);

            backdrop-filter:blur(10px);

            border-radius:20px;

            padding:30px;

            box-shadow:0px 0px 20px rgba(0,0,0,0.5);

            position:relative;

            overflow:hidden;
        }

        /* WATERMARK */

        .container::before{

            content:"";

            position:absolute;

            width:320px;
            height:320px;

            background:url('images/logo.png');

            background-size:contain;
            background-repeat:no-repeat;
            background-position:center;

            opacity:0.06;

            top:50%;
            left:50%;

            transform:translate(-50%,-50%);
        }

        .logo{

            width:120px;

            display:block;

            margin:auto;
            margin-bottom:10px;

            position:relative;
            z-index:2;
        }

        h2{

            text-align:center;

            color:white;

            margin-bottom:20px;

            position:relative;
            z-index:2;
        }

        form{

            position:relative;
            z-index:2;
        }

        input,
        select{

            width:100%;

            padding:12px;

            margin:10px 0;

            border:none;

            border-radius:10px;

            outline:none;

            font-size:15px;
        }

        input[type=file]{

            background:white;
        }

        label{

            color:white;

            font-weight:bold;
        }

        .password-box{

            position:relative;
        }

        .password-box span{

            position:absolute;

            right:15px;
            top:22px;

            color:blue;

            cursor:pointer;

            font-size:14px;

            font-weight:bold;
        }

        button{

            width:100%;

            padding:12px;

            border:none;

            border-radius:10px;

            background:#00b894;

            color:white;

            font-size:18px;

            cursor:pointer;

            margin-top:15px;
        }

        button:hover{

            background:#019875;
        }

    </style>

</head>

<body>

    <div class="container">

        <img src="images/logo.png" class="logo">

        <h2>Student Registration</h2>

        <form action="registerStudent"
              method="post"
              enctype="multipart/form-data">

            <!-- NAME -->

            <input type="text"
                   name="name"
                   placeholder="Full Name"
                   required>

            <!-- AGE -->

            <input type="number"
                   name="age"
                   placeholder="Age"
                   required>

            <!-- EMAIL -->

            <input type="email"
                   name="email"
                   placeholder="Email"
                   required>

            <!-- PHONE -->

            <input type="text"
                   name="phone"
                   placeholder="Phone Number"
                   required>
            
            
            
            <input type="file"
       name="photo"
       accept=".jpg,.jpeg,.png"
       required>

<input type="file"
       name="aadhaar"
       accept=".jpg,.jpeg,.png,.pdf"
       required>

<input type="file"
       name="marksheet10"
       accept=".jpg,.jpeg,.png,.pdf"
       required>

<input type="file"
       name="marksheet12"
       accept=".jpg,.jpeg,.png,.pdf"
       required>

            <!-- DEPARTMENT -->

            <select name="department"
                    id="dept"
                    onchange="setCourseDetails()"
                    required>

                <option value="">
                    Select Department
                </option>

                <option>BBA</option>

                <option>BCA</option>

                <option>B.Tech</option>

                <option>MBBS</option>

            </select>

            <!-- DURATION -->

            <select id="duration"
                    name="duration"
                    required>

                <option value="">
                    Select Duration
                </option>

            </select>

            <!-- FEES -->

            <input type="text"
                   id="fees"
                   name="fees"
                   placeholder="Total Fees"
                   readonly>

            <!-- PASSWORD -->

            <div class="password-box">

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Password"
                       required>

                <span id="toggle"
                      onclick="togglePassword()">

                    Show

                </span>

            </div>

            <!-- PHOTO -->

            <label>
                Upload Student Photo
            </label>

            <input type="file"
                   name="photo"
                   required>

            <!-- AADHAAR -->

            <label>
                Upload Aadhaar Card
            </label>

            <input type="file"
                   name="aadhaar"
                   required>

            <!-- 10th -->

            <label>
                Upload 10th Marksheet
            </label>

            <input type="file"
                   name="marksheet10"
                   required>

            <!-- 12th -->

            <label>
                Upload 12th Marksheet
            </label>

            <input type="file"
                   name="marksheet12"
                   required>

            <!-- BUTTON -->

            <button type="submit">

                Register Student

            </button>

        </form>

    </div>

    <!-- SCRIPT -->

    <script>

        function setCourseDetails(){

            let dept =
                document.getElementById("dept").value;

            let duration =
                document.getElementById("duration");

            let fees =
                document.getElementById("fees");

            duration.innerHTML =
                '<option value="">Select Duration</option>';

            if(dept === "BBA"){

                duration.innerHTML +=
                '<option>3 Years</option>';

                fees.value = "150000";
            }

            else if(dept === "BCA"){

                duration.innerHTML +=
                '<option>3 Years</option>';

                fees.value = "180000";
            }

            else if(dept === "B.Tech"){

                duration.innerHTML +=
                '<option>4 Years</option>';

                fees.value = "450000";
            }

            else if(dept === "MBBS"){

                duration.innerHTML +=
                '<option>5 Years</option>';

                fees.value = "900000";
            }

            else{

                fees.value = "";
            }
        }

        function togglePassword(){

            let pass =
                document.getElementById("password");

            let toggle =
                document.getElementById("toggle");

            if(pass.type === "password"){

                pass.type = "text";

                toggle.innerHTML = "Hide";
            }
            else{

                pass.type = "password";

                toggle.innerHTML = "Show";
            }
        }

    </script>

</body>
</html>