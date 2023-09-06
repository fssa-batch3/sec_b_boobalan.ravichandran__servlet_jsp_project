<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/product_details.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Product Details</title>

</head>
<body>

	<%
	String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
	%>
	<%
	if (loggedUserUniqueEmail == null) {
	%>
	<jsp:include page="/header.jsp"></jsp:include>
	<%
	} else {
	%>
	<jsp:include page="/after_login_header.jsp"></jsp:include>
	<%
	}
	%>



	<%
	Product product = (Product) request.getAttribute("productDetails");
	%>
	<div class="container">
		<div class="header_details">
			<h1>Product Details</h1>
		</div>
		<div class="product-details">
			<div class="product-image">
				<img src="<%=product.getImageURL()%>" alt="<%=product.getName()%>">
			</div>
			<div class="product-info">
				<div class="product-name"><%=product.getName()%></div>
				<div class="manufacturer">
					Manufacturer:
					<%=product.getManufacture()%></div>

				<div class="manufacturer">
					Price:
					<%=product.getPrice()%></div>
				<div class="buy-button">
					<button>Buy Now</button>
				</div>
			</div>
		</div>
		<div class="details_cart">
			<div class="description">
				<h2>Description:</h2>
				<br><%=product.getDescription()%>
			</div>
			<div class="application">
				<h2>Application:</h2>
				<br><%=product.getApplication()%>
			</div>
			<div class="benefits">
				<h2>Benefits:</h2>
				<br><%=product.getBenefits()%>
			</div>

		</div>
	</div>
</body>
</html>
