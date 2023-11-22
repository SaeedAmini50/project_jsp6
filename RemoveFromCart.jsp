<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%String cart_ID=request.getParameter("cart_ID");
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("DELETE FROM cart WHERE cart_ID = ?");
	pst.setString(1, cart_ID);
	 pst.executeUpdate();
	 if (pst!= null) {
		 try { pst.close();}
	 catch (SQLException e) {System.out.print(e);}}
	 if (con != null) {try {
			      con.close(); }
	 catch (SQLException e) {System.out.print(e); }}
		response.sendRedirect("myCart.jsp?msg=removed");  }
catch(Exception e)  {System.out.print(e);}
%>