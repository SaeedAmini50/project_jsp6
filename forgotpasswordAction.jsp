<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%

String email = request.getParameter("email");
String securityQuestion = request.getParameter("Security_Question");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("password");
String customerPassword2 = request.getParameter("customer_password2");
String passwordHash = "";
int check = 0;

try {
    Connection con = ConnectionProvider.getCon();

    if (newPassword.equals(customerPassword2)) {
        // Hash
        String queryHash = "SELECT SHA2(?, 256) AS password_hash";
        PreparedStatement ps1 = con.prepareStatement(queryHash);
        ps1.setString(1, newPassword);
        ResultSet rs = ps1.executeQuery();

        if (rs.next()) {
            passwordHash = rs.getString("password_hash");
        }
        
        PreparedStatement pst = con.prepareStatement("SELECT * FROM customer WHERE email=? AND Security_Question=? AND answer=?");
        pst.setString(1, email);
        pst.setString(2, securityQuestion);
        pst.setString(3, answer);
        ResultSet rs1 = pst.executeQuery();
        
        if (!rs1.next()) {
            pst = con.prepareStatement("SELECT * FROM admin WHERE email=? AND Security_Question=? AND answer=?");
            pst.setString(1, email);
            pst.setString(2, securityQuestion);
            pst.setString(3, answer);
            rs1 = pst.executeQuery();
        }
      
        while (rs1.next()) {
            check = 1;
            PreparedStatement ps2;
             ps2 = con.prepareStatement("UPDATE customer SET password=? WHERE email=?");
            ps2.setString(1, passwordHash);
            ps2.setString(2, email);
           
            
            if (ps2 != null) {
                ps2 = con.prepareStatement("UPDATE admin SET password=? WHERE email=?");
                ps2.setString(1, passwordHash);
                ps2.setString(2, email);
            
            }
           
            ps2.executeUpdate();
        }
        
        pst.close();
        ps1.close();
        rs1.close();
        con.close();

        response.sendRedirect("forgotpassword.jsp?msg=done");
    } else {
        response.sendRedirect("forgotpassword.jsp?msg=invalidPassword");
    }

    if (check == 0) {
        response.sendRedirect("forgotpassword.jsp?msg=invalid");
    }
} catch (Exception e) {
    e.printStackTrace();
}

%>