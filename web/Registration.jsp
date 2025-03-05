<!DOCTYPE html>
<%@ page import="MVC.MyCon" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link rel="stylesheet" href="Registration.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script type="text/javascript">
    function show() {
        var fname = document.getElementById("fname").value;
        var lname = document.getElementById("lname").value;
        var email = document.getElementById("email").value;
        var mobile = document.getElementById("mobile").value;
        var pass = document.getElementById("pass").value;

        if (fname == "") {
            alert("Please fill First Name");
            document.getElementById("fname").focus();
            return false;
        }

        if (lname == "") {
            alert("Please fill Last Name");
            document.getElementById("lname").focus();
            return false;
        }

        if (email == "") {
            alert("Please fill Email");
            document.getElementById("email").focus();
            return false;
        }

        if (mobile == "") {
            alert("Please fill Phone Number");
            document.getElementById("mobile").focus();
            return false;
        }
        if (isNaN(mobile)) {
            alert("Please fill only numbers");
            document.getElementById("contact").focus();
            return false;

        }
        if (mobile.length !== 10) {
            alert("Must contain 10 Numbers");
            document.getElementById("contact").focus();
            return false;
        }
        if (pass == "") {
            alert("Please create Password");
            return false;
        }
    }
    </script>
</head>
<body>
    <div class="wrapper">
        <form action="Registration.jsp" method="get" onsubmit="return show()">
            <h1>Student Registration</h1>

            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="First Name" name="fname" id="fname" required>
                    <i class='bx bx-user'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="Last Name" name="lname" id="lname" required>
                    <i class='bx bxs-user-detail'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="email" placeholder="Email" name="email" id="email" required>
                    <i class='bx bx-envelope'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="tel" placeholder="Phone Number" name="mobile" id="mobile" required>
                    <i class='bx bxs-phone'></i>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="password" placeholder="Password" name="pass" id="pass" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>
            </div>
            <label>
                <input type="checkbox" required> I hereby declare that the above information provided is true.
            </label>
            <br>
            <br>
            <div class="button">
                <input type="submit" value="Sign Up" name="s" onsubmit="return show()">
            </div>
            <%
                if (request.getParameter("s") != null) {
                    try {
                        String fname = request.getParameter("fname");
                        String lname = request.getParameter("lname");
                        String email = request.getParameter("email");
                        String contact = request.getParameter("mobile");
                        String pass = request.getParameter("pass");
                        Connection con = MyCon.getConnection();
                        PreparedStatement ps = con.prepareStatement("INSERT INTO student_register VALUES (?, ?, ?, ?, ?)");
                        ps.setString(1, fname);
                        ps.setString(2, lname);
                        ps.setString(3, email);
                        ps.setString(4, contact);
                        ps.setString(5, pass);
                        int i = ps.executeUpdate();
                        if (i > 0) {
                            out.println("<center><h2>Your account has been created successfully!<br><a href='login.jsp' style='color: #50A0BB; text-decoration: none;'>Sign In</a></h2></center>");
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                        out.println("<center><h2>There was an error creating your account. Please try again later.</h2></center>");
                    }
                }
            %>
        </form>
    </div>
</body>
</html>
