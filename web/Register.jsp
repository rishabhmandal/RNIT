<!DOCTYPE html>
<%@ page import="MVC.MyCon" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMISSION ENQUIRY</title>
    <link rel="stylesheet" href="Register.css">
   <script> 
       function submitForm() 
        { 
            var fullName = document.getElementById('fullName').value; 
            var fatherName = document.getElementById('fatherName').value; 
            var mobile = document.getElementById('contact').value; 
            var email = document.getElementById('email').value; 
            var state = document.getElementById('state').value; 
            var city = document.getElementById('city').value; 
            var qualification = document.getElementById('qualification').value; 
            var preferredProgramme = document.getElementById('preferredProgramme').value; 
          
        if (fullName == "") {
            alert("Please fill First Name");
            document.getElementById("fullName").focus();
            return false;
        }

        if (fatherName == "") {
            alert("Please fill Father Name");
            document.getElementById("fatherName").focus();
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
        
        if (email == "") {
            alert("Please fill Email");
            document.getElementById("email").focus();
            return false;
        }

        if (state == "") {
            alert("Please fill First Name");
            document.getElementById("state").focus();
            return false;
        }
        
        if (city == "") {
            alert("Please fill First Name");
            document.getElementById("city").focus();
            return false;
        }
        
        if (qualification == "") {
            alert("Please fill First Name");
            document.getElementById("qualification").focus();
            return false;
        }
        
        if (preferredProgramme == "") {
            alert("Please fill First Name");
            document.getElementById("preferredProgramme").focus();
            return false;
        }
       
    } 
            </script>
</head>
<body>
    <div class="wrapper">
        <form action="Register.jsp" method="get" onsubmit="return show()">
            <h1>ADMISSION ENQUIRY</h1>

            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="Full Name" name="fullname" id="fullname" required>

                </div><br>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="Father Name" name="fathername" id="fathername" required>

                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="tel" placeholder="Contact Number" name="contact" id="contact" required>

                </div>
            </div>

            <div class="input-box">
                <div class="input-field">
                    <input type="email" placeholder="E-mail" name="email" id="email" required>

                </div>
            </div> 
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="State" name="state" id="state" required>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="City" name="city" id="city" required>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="Qualification" name="qualification" id="qualification" required>
                </div>
            </div>
            <div class="input-box">
                <div class="input-field">
                    <input type="text" placeholder="Preferred Programme" name="preferredProgramme" id="preferredProgramme" required>
                </div>
            </div>
            <label>
                <input type="checkbox" required> I hereby declare that the above information provided is true.
            </label>
            <br>
            <br><button type="submit" name="s" class="btn">Submit</button>
            <%
                if (request.getParameter("s") != null) {
                    try {
                        String fullname = request.getParameter("fullname");
                        String fathername = request.getParameter("fathername");
                        String contact = request.getParameter("contact");
                        String email = request.getParameter("email");
                        String state = request.getParameter("state");
                        String city = request.getParameter("city");
                        String qualification = request.getParameter("qualification");
                        String preferredProgramme = request.getParameter("preferredProgramme");
                        Connection con = MyCon.getConnection();
                        PreparedStatement ps = con.prepareStatement("INSERT INTO Admission_Enquiry VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                        ps.setString(1, fullname);
                        ps.setString(2, fathername);
                        ps.setString(3, contact);
                        ps.setString(4, email);
                        ps.setString(5, state);
                        ps.setString(6, city);
                        ps.setString(7, qualification);
                        ps.setString(8, preferredProgramme);
                        int i = ps.executeUpdate();
                        if (i > 0) {
                           response.sendRedirect("Confirmation.jsp");
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                        out.println("<center><h2>There was an error while submitting. Please try again later.</h2></center>");
                    }
                }
            %>
        </form>
    </div>
</body>
</html>




