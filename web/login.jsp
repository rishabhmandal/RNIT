<!DOCTYPE html>
<%@page import="MVC.MyCon"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" href="login.css">
    <link href='' rel='stylesheet'>
    <script type="text/javascript">
            
            function show()
            {
                var user=document.getElementById("username").value;
                var pass=document.getElementById("password").value;                
            if(user=="" && pass=="")
            {
            alert("Enter Username and Password");
            document.getElementById("username").focus();
            return false;
            } 
            if(user=="")
            {
            alert("Enter Username");
            document.getElementById("username").focus();
            return false;
            }   
            if(pass=="")
            {
            alert("Enter Password");
            document.getElementById("password").focus();
            return false;
            }   
            }
             
    </script>
</head>
<body>
    <div class="wrapper">
        <form action="login.jsp" method="post">
            <h1> Student Login</h1>
            <div class="input-box">
                <input type="text" name="username" placeholder="Email-id" required>
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="remember-forgot">
                <label><input type="checkbox" name="remember">Remember me</label>
                <a href="#">Forgot password?</a>
            </div>
            <button type="submit" name="s" class="btn">Login</button>
            <div class="register-link">
                <br><p>Don't Have an Account? <a href="Registration.jsp">Register</a></p>
            </div>
            <%
        if(request.getParameter("s")!=null)
        {
        try
        {
        String user,pass;
        user=request.getParameter("username");
        pass=request.getParameter("password");
        Connection con=MyCon.getConnection();
        PreparedStatement ps=con.prepareStatement("select email,pass from student_register where email=? and pass=?");
        ps.setString(1,user);
        ps.setString(2,pass);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
        session.setAttribute("sid",user);
        response.sendRedirect("Register.jsp");
        }
        else
        {
             %> <br><center><h2>Invalid Input!</h2> </center> <%
        }
        }
             catch(Exception e)
     {
      out.print(e.getMessage());
     }
             }
        %>
    
        </form>
    </div>
</body>
</html>
