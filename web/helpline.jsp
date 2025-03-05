<!DOCTYPE html>
<%@ page import="MVC.MyCon" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="helpline.css">
</head>
<body>
    <div class="container">
        <h1>Contact Us</h1>
        <form action="helpline.jsp  " method="get">
          <label for="name">Name:</label>
          <input type="text" id="name" name="name">
          <label for="phone">Contact No:</label>
            <input id="phone" maxlength="10" required="" pattern="[0-9]{10}" class="form-control" type="text" name="phone">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email">
          <label for="message">Message:</label>
          <textarea id="message" name="message"></textarea>
          <input type="submit" name="s" value="Send">
          <%
                if (request.getParameter("s") != null) {
                    try {
                        String name = request.getParameter("name");
                        String phone = request.getParameter("phone");
                        String email = request.getParameter("email");
                        String contact = request.getParameter("message");
                        Connection con = MyCon.getConnection();
                        PreparedStatement ps = con.prepareStatement("INSERT INTO contact_form VALUES (?, ?, ?, ?)");
                        ps.setString(1, name);
                        ps.setString(2, phone);
                        ps.setString(3, email);
                        ps.setString(4, contact);
                        int i = ps.executeUpdate();
                        if (i > 0) {
                            response.sendRedirect("Confirm.jsp");
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            %>
        </form>
        <br>
        <div class="#">
            <div><b>Address:-</b>  AB Road , Rajendra Nagar Indore-452012</div>
            <div>Madhya Pradesh, India</div>
            <div><b>Toll Free:-</b>: 1800156785</div>
            <div><b>Admission Enquiry:-</b> 6267991399</div>
            <div><b>Phone No:-</b>  7470575341,8827171416</div>
            <div class="d-flex"><span><b>Email id</b>:</span>
              <span class="ml-2 d-flex flex-column">
                <span><a>rnit@gmail.com</a>, <a>admission@rnit.org</a> </span>
              </span>
            </div>
          </div>
      </div>
    
</body>
</html>

