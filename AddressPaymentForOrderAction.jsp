<%@ page import="java.sql.*" 
import="project.ConnectionProvider"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

 <%
 String email=session.getAttribute("email").toString();
 String address=request.getParameter("customer_address");
 String city=request.getParameter("customer_city");
 String country=request.getParameter("customer_country");
 String  phone=request.getParameter("customer_phone");
 String  amoung_payment=request.getParameter("amoung_payment");
 String  payment_method=request.getParameter("payment_method");
 String  transaction_ID="";
 transaction_ID=request.getParameter("transactionID");
try {Connection con = ConnectionProvider.getCon();
int customer_ID=0;
PreparedStatement ps=con.prepareStatement("SELECT * FROM customer WHERE email = ?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
while(rs.next()){customer_ID=rs.getInt(1);}
rs.close();ps.close();
PreparedStatement ps1 = con.prepareStatement(" INSERT INTO shipment (customer_country,customer_city,customer_address,customer_phone,customer_ID,shipment_date) VALUES(?,?,?,?,?,now());");
	ps1.setString(1,country);
	ps1.setString(2,city);
	ps1.setString(3,address);
	ps1.setString(4,phone);
	ps1.setInt(5,customer_ID);
	ps1.executeUpdate(); ps1.close();
PreparedStatement ps2 = con.prepareStatement("INSERT INTO payment (amoung_payment,payment_method,customer_ID,payment_date,deliveryDate,Due_DATE) VALUES(?,?,?,now(),DATE_ADD(payment_date,INTERVAL 10 DAY),DATE_ADD(payment_date,INTERVAL 30 DAY));");
			ps2.setString(1,amoung_payment);
			ps2.setString(2,payment_method);
			ps2.setInt(3,customer_ID);
			ps2.executeUpdate();ps2.close(); con.close();
			response.sendRedirect("billAction.jsp");}
catch(Exception e){System.out.print(e);}
 %>
 
 
 
 
 
 
 
 
 