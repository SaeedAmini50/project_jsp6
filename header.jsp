<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
    <%@page  import ="java.text.SimpleDateFormat"%>
<%@page  import ="java.util.Date"%>
 
<!DOCTYPE html>

<html lang="en">
<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SmartStor</title>

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css"/>
<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>
<script src="js/userjs.js"></script>
<body>





<%String email=null; %>
 <%//= email=session.getAttribute("email").toString(); %> 


 
 
 
<header>

<!-- TOP HEADER -->
<div id="top-header">
<div class="container">
<ul class="header-links pull-left">
<li><a href="#"><i class="fa fa-phone"></i> +93799644575</a></li>
<li><a href="#"><i class="fa fa-envelope-o"></i> smartstor575@email.com</a></li>
<li><a href="#location"><i class="fa fa-map-marker"  ></i>موقعیت دوکان</a></li>
</ul>
<ul class="header-links pull-right">
<% if (email != null){%>
<li><a href="#"><i class="fa fa-user-o"></i><%out.print(email); %></a></li>
<% }
else {%>
<li><a href="#"><i class="fa fa-user-o"></i><%out.print("ثبت نام نکردید"); %></a></li>
<% } %>
<li><a href="singin.jsp"><i></i>	</a></li>
<li><a href="profile_customer.jsp"><i class="fa fa-user-o"></i>پروفایل شما</a></li>
</ul>
<button id="btnEnglish">English</button>
        <button id="btnPersian">فارسی</button>
        <button id="btnPashto">پشتو</button>
</div>
</div>
<!-- /TOP HEADER -->

<!-- MAIN HEADER -->
<div id="header">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<!-- LOGO -->
<div class="col-md-3">
<div class="header-logo">
<a href="#" class="logo">
<img src="./img/logo.jpg" alt="">
</a>
</div>
</div>
<!-- /LOGO -->

<!-- SEARCH BAR -->
<div class="col-md-6">
<div class="header-search">
<form   action="search_product.jsp" method="post">
<select class="input-select" name="search_product">
<option id="name_products" >اسم محصولات</option>
<option id="TV" value="TV">تلویزیون</option>

<option id="machin" value="machin">لباسشویی</option>
</select>
<input class="input" placeholder="Search here"  name="search_product">
<button class="search-btn">Search</button>
</form>
</div>
</div>
<!-- /SEARCH BAR -->

<!-- ACCOUNT -->
<div class="col-md-3 clearfix">
<div class="header-ctn">
<!-- Wishlist -->
<div>
<a href="#">
<i class="fa fa-heart-o"></i>
<span>Your Wishlist</span>
<div class="qty">2</div>
</a>
</div>
<!-- /Wishlist -->


								<!-- Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle"   data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Your Cart</span>
										<div class="qty">3</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="./img/machin6.webp" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">لباسشویی</a></h3>
													<h4 class="product-price"><span class="qty">1x</span>AF 16000</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>

											<div class="product-widget">
												<div class="product-img">
													<img src="./img/TVV.jpg" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">تلویزیون</a></h3>
													<h4 class="product-price"><span class="qty">3x</span>AF 8000</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>
										</div>
										<div class="cart-summary">
											<small>تعداد انتخاب شده 2</small>
											<h5>کل پول : AF 38000</h5>
										</div>
										<div class="cart-btns">
											<a href="myCart.jsp"  >View Cart</a>
											<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<!-- /Cart -->


<!-- Menu Toogle -->
<div class="menu-toggle">
<a href="#">
<i class="fa fa-bars"></i>
<span>Menu</span>
</a>
</div>
<!-- /Menu Toogle -->
</div>
</div>
<!-- /ACCOUNT -->
</div>
<!-- row -->
</div>
<!-- container -->
</div>
<!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->



<!-- NAVIGATION -->
<nav id="navigation">
<!-- container -->
<div class="container">
<!-- responsive-nav -->
<div id="responsive-nav">
<!-- NAV -->
<ul class="main-nav nav navbar-nav">
<li ><a href="index.jsp">صفحه اصلی</a></li>
<li><a href="storeTV.jsp">تلویزیون</a></li>
<li><a href="storemachin.jsp ">لباسشویی</a></li>
<li><a href="product.jsp ">نمایش محصول</a></li>
<li><a href="indexAdmin.jsp ">Admin</a></li>


</ul>
<!-- /NAV -->
</div>
<!-- /responsive-nav -->
</div>
<!-- /container -->
</nav>
<!-- /NAVIGATION -->





</body>
</html>