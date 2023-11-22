
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>

  <title>صفحه سبد خرید</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
  <style>
    /* کدهای CSS در اینجا قرار می‌گیرند */
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }

    h1 {
      color: #333;
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    tbody tr:hover {
      background-color: #f9f9f9;
    }

    tfoot td {
      font-weight: bold;
    }

    .checkout {
      text-align: center;
      margin-top: 20px;
    }

    .checkout button {
      padding: 10px 20px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .product-image {
      max-width: 100px;
    }

    .right-align {
      text-align: right;
    }
  </style>
  <script>
  
  
  
    // کدهای JavaScript در اینجا قرار می‌گیرند
    function updateTotal() {
      var total = 0;
      var quantities = document.getElementsByClassName("quantity");
      var prices = document.getElementsByClassName("price");
      var totalElement = document.getElementById("total");

      for (var i = 0; i < quantities.length; i++) {
        var quantity = parseInt(quantities[i].value);
        var price = parseFloat(prices[i].textContent);
        total += quantity * price;
      }

      totalElement.textContent = total.toFixed(2) + " AF";
    }
  </script>
</head>
<body>
     <%   email=session.getAttribute("email").toString();  %> 
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){ %>
<h1>There is only one Quantity !So click on removel</h1>
<% }%>

<%if("increased".equals(msg)){ %>
<h1>Quantity Increased Successfully!</h1>
<% }%>

<%if("decreased".equals(msg)){ %>
<h1>Quantity Decreased Successfully!</h1>
<% }%>


<%if("removed".equals(msg)){ %>
<h1>Product Successfully Removed!</h1>
<% }%>
   <%
    int total=0;
    int sno=0;
    int customer_ID=0;
    try{
    	
Connection con=ConnectionProvider.getCon();

PreparedStatement ps3=con.prepareStatement("SELECT * FROM customer WHERE email = ?");

ps3.setString(1, email);
ResultSet rs3 = ps3.executeQuery();
while(rs3.next()){
	
	customer_ID=rs3.getInt(1);

}

if (rs3 != null) {
    try {
        rs3.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
if (ps3 != null) {
    try {
        ps3.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}












PreparedStatement ps1 = con.prepareStatement("SELECT SUM(total_price_cart) FROM product INNER JOIN cart INNER JOIN customer ON product.product_ID = cart.product_ID AND customer.customer_ID = cart.customer_ID WHERE customer.customer_ID = ?");
ps1.setInt(1, customer_ID);
ResultSet rs1 = ps1.executeQuery();

while (rs1.next()){
	total=rs1.getInt(1);
}


if (rs1 != null) {
      try {
          rs1.close();
      } catch (SQLException e) {
      	System.out.print(e);
 
      }
  }

  if (ps1 != null) {
      try {
          ps1.close();
      } catch (SQLException e) {
      	System.out.print(e);
      }
  }


%>

<!-- NAVIGATION -->
<nav id="navigation">
<!-- container -->
<div class="container">
<!-- responsive-nav -->
<div id="responsive-nav">
<!-- NAV -->
<ul class="main-nav nav navbar-nav">

</ul>
<!-- /NAV -->
</div>
</div>






  <h1>سبد خرید</h1>
  <table>
    <thead>
    
 
    
    
      <tr>
       <th >ترتیب انتخاب محصول</th>
       <th> تصویر محصول</th>
          <th>مشخصات محصول</th>
       
          <th>اسم محصول </th>
        <th> اسم دسته بندی</th>
         <th> تعداد</th>
        <th> قیمت محصول</th>
        <th> جمع کل</th>
         <th> حذف محصول</th>
        
      </tr>
    </thead>
    <tbody>
    <% 
    

	  PreparedStatement ps = con.prepareStatement("SELECT * FROM product INNER JOIN cart INNER JOIN customer ON product.product_ID = cart.product_ID AND customer.customer_ID = cart.customer_ID WHERE customer.customer_ID = ?");
	  ps.setInt(1, customer_ID);
	  ResultSet rs = ps.executeQuery();
	  
	  
	  while(rs.next()){
	 %>
      <tr>
     <% sno=sno+1; %> 
      <td class="right-align">  <% out.print(sno);%> </td>
        <td><img src="./img/<%=rs.getString(6) %> " alt="تصویر محصول" class="product-image"></td>
          <td name="size and attribute" class="right-align"><%=rs.getString(3)%> <br><%=rs.getString(4)%></td>
        
       
         <td name="name" class="right-align"><%=rs.getString(1)%></td>
            <td name="category" class="right-align"><%=rs.getString(10) %></td>
           <td name="quantity"><a href="IncDecQuantityAction.jsp?product_ID=<%=rs.getString(8)%>&quantity_cart=increased"><i class='fas fa-plus-circle'> </i></a> <%=rs.getString(12) %> <a href="IncDecQuantityAction.jsp?product_ID=<%=rs.getString(8)%>&quantity_cart=decreased"><i class="fas fa-minus-circle"></i></a> </td> 
        <td name="price"> <%=rs.getString(2) %></td>
        <td name="total">  <%=rs.getString(13) %></td>
        <td ><a  href="RemoveFromCart.jsp?cart_ID=<%=rs.getString(11) %>"> Remove <i class='fas fa-trash-alt'> </i> </a>  </td>
      </tr>
      <%}
	  

if (rs != null) {
    try {
        rs.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}

if (ps != null) {
    try {
        ps.close();
    } catch (SQLException e) {
    	System.out.print(e);
    }
}
if (con != null) {
    con.close();
}



	  %>
      
      
      
      
      </tbody>
    <tfoot>
      <tr>
       <td colspan="4" class="right-align"><h1>   مجموعه پول </h1></td>
        <td id="total"> <h1>  <%out.println(total); %>   </h1></td>
       
      </tr>
    </tfoot>
  </table>
  <div class="checkout">
   <% if(total>0){%>
        	<button><li ><a href="AddressPaymentForOrder.jsp"> تسویه حساب</a></li></button>
      <%   } %>
  
   
  </div>
    <% 
    
   }
    
catch(Exception e)  {
System.out.print(e);

}
 %>   
</body>
</html>
    <%@ include file="footer.jsp" %>













