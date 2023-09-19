<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap"
	rel="stylesheet">
<title>Product details</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lora', serif;
}

.container {
	max-width: 800px;
	margin: 2vh auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: #333;
}

.product-details {
	margin-top: 20px;
}

.product-details label {
	font-weight: bold;
	font-size: 23px;
}

.product-details p {
	margin: 10px 0;
	font-size: 18px;
}

.product-image {
	text-align: center;
	margin-top: 20px;
}

.product-image img {
	max-width: 100%;
	height: auto;
}

.pro_details {
	display: flex;
	justify-content:space-between;
}

.container-product {
	margin: 5vh 5vw;
}
.pro_details p{
margin-left:4vw;
}

.description_details{
width:60vw;
min-height:20vw;
padding:2.5vh 3vw;
margin: 2.5vh auto;
border-radius: 10px;
box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}
.description_details h3{
margin: 1vh 0;
font-size:23px;
}
.description_details p{
font-size:17.7px;
}
.update_delete{
display: flex;
	justify-content:space-around;
	width:60vw;
	border-radius: 10px;
	
	padding:2vh 3vw;
	margin: 2vh auto;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;

}
.update_delete a{
text-decoration:none;
padding: 1.5vh 3vw;
 background-color: rgb(4, 98, 67);
    color:white;
    border-radius: 10px;
}
.update_delete a:hover{
   background-color: rgb(25, 140, 102);
   box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}
</style>
</head>
<body>
	<jsp:include page="/admin_header.jsp"></jsp:include>
	<%
	Product product = (Product) request.getAttribute("PRODUCT_DETAILS");
	%>
	<div class="container">
		<h1>Product Details</h1>
		<div class="product-details">

			<div class="product-image">
				<img src="<%=product.getImageURL()%>" alt="Product Image">
			</div>
			<div class="container-product">
				<div class="pro_details">
					<label>Name:</label>
					<p><%=product.getName()%></p>
				</div>
				<div class="pro_details">
					<label>Product Weight:</label>
					<p><%=product.getProductWeight()%></p>
				</div>
			
				<div class="pro_details">
					<label>Manufacture:</label>
					<p><%=product.getManufacture()%></p>
				</div>
				<div class="pro_details">
					<label>Price:</label>
					<p><%=product.getPrice()%></p>
				</div>
				<div class="pro_details">
					<label>Discount:</label>
					<p><%=product.getDiscount()%></p>
				</div>
			</div>
		</div>
		
	
	</div>
	
		<div class="description_details">
		<h3>Description</h3>
		<p><%=product.getDescription()%></p>
		</div>
		<div class="description_details">
		<h3>Application</h3>
		<p><%=product.getApplication()%></p>
		</div>
		<div class="description_details">
		<h3>Benifits</h3>
		<p><%=product.getBenefits()%></p>
		</div>
		
		<div class="update_delete">
		<a href="product/edit?product_id=<%=product.getId()%>">Update</a> 
		 <a href="product/delete?product_id=<%=product.getId()%>">Delete</a>
		</div>
</body>
</html>