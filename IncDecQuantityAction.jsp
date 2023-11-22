<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String customer_email=session.getAttribute("email").toString();
String product_ID=request.getParameter("product_ID");
String incdec=request.getParameter("quantity_cart");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
int customer_ID=0;
try{

Connection con=ConnectionProvider.getCon();


PreparedStatement ps1 = con.prepareStatement("SELECT * FROM customer WHERE email=?");
ps1.setString(1, customer_email);
ResultSet rs = ps1.executeQuery();

while(rs.next()){

	customer_ID=rs.getInt(1);

}

if (rs != null) {
    try {
        rs.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
	



PreparedStatement ps3 = con.prepareStatement("SELECT * FROM product INNER JOIN cart ON product.product_ID=cart.product_ID INNER JOIN customer ON customer.customer_ID=cart.customer_ID WHERE customer.customer_ID=? AND product.product_ID=? AND cart.customer_ID=? AND cart.product_ID=?");
ps3.setInt(1, customer_ID);
ps3.setString(2, product_ID);
ps3.setInt(3, customer_ID);
ps3.setString(4, product_ID);
ResultSet rs3 = ps3.executeQuery();


		while (rs3.next()){
			
			
	price=rs3.getInt(2);
	total=rs3.getInt(13);
	quantity=rs3.getInt(12);
	
	
}

		if (rs3 != null) {
		    try {
		        rs3.close();
		    } catch (SQLException e) {
		    	System.out.print(e);
		    }
		}
			


if (quantity==1 && incdec.equals("decrease")){
	
	response.sendRedirect("myCart.jsp?msg=notPossible");
}
else if (quantity !=1 && incdec.equals("decreased")){
	
	total=total - price;
	quantity=quantity-1;

	PreparedStatement ps = con.prepareStatement( "UPDATE cart INNER JOIN customer INNER JOIN product ON cart.product_ID = product.product_ID and customer.customer_ID = cart.customer_ID SET cart.total_price_cart = ?, cart.quantity_cart = ? WHERE cart.customer_ID = ? AND cart.product_ID = ?");
	ps.setDouble(1, total);
	ps.setInt(2, quantity);
	ps.setInt(3, customer_ID);
	ps.setString(4, product_ID);

 ps.executeUpdate();

 if (ps != null) {
	    try {
	        ps.close();
	    } catch (SQLException e) {
	    	System.out.print(e);
	    }
	}
		
	
	
	
	
	
	response.sendRedirect("myCart.jsp?msg=decreased");  
	
}
	
else{	total=total + price;
	quantity=quantity+1;
	
	

	PreparedStatement ps4 = con.prepareStatement("UPDATE cart INNER JOIN customer ON customer.customer_ID = cart.customer_ID INNER JOIN product ON cart.product_ID = product.product_ID SET cart.total_price_cart=?, cart.quantity_cart=? WHERE cart.customer_ID=? AND cart.product_ID=?");
	ps4.setInt(1, total);
	ps4.setInt(2, quantity);
	ps4.setInt(3, customer_ID);
	ps4.setString(4, product_ID);
	ps4.executeUpdate();
	
	if (ps4 != null) {
	    try {
	        ps4.close();
	    } catch (SQLException e) {
	    	System.out.print(e);
	    }
	}
	if (con != null) {
		try {
		      con.close();
		  } catch (SQLException e) {
		  	System.out.print(e);
		  }
	}
		
	
	
	
	
	response.sendRedirect("myCart.jsp?msg=increased");  
	
	
	
}
	
}

catch(Exception e)  {
System.out.print(e);

} 	



%>