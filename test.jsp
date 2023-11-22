<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
Connection con=ConnectionProvider.getCon();

    PreparedStatement ps = con.prepareStatement("SELECT * FROM order_item WHERE DATE(date_sold) = CURDATE()");
    ResultSet rs = ps.executeQuery();
%>

<div class="container">
    <div class="row">
        <% while (rs.next()) { %>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-shopping-cart fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">نام محصول: <%= rs.getString("product_name") %></p>
                    <p class="mb-2">تعداد: <%= rs.getInt("quantity_item") %></p>
                    <p class="mb-2">قیمت: <%= rs.getDouble("price_item") %></p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>