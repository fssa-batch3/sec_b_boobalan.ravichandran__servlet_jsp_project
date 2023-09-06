<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.fertagriboomi.service.ProductService"%>

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

<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/header.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>home page</title>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">

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


	<div class="product">
		<div class="offers">
			<a href="products?category_id=18"> <img
				src="https://iili.io/J9T9eN2.jpg" alt="offers" class="offers11">
				<h2 class="off">Bio Fertilizers</h2>
			</a>
		</div>
		<div class="offers">
			<a href="products?category_id=9"> <img
				src="https://iili.io/J9TH9UJ.jpg" alt="Pesticides products"
				class="offers11">
				<h2 class="off1">Insecticides</h2>
			</a>
		</div>
		<div class="offers">
			<a href="products?category_id=10"> <img
				src="https://iili.io/J9THzJf.jpg" alt="Fungicides" class="offers11">
				<h2 class="off2">Fungicides</h2>
			</a>
		</div>
		<div class="offers">
			<a href="products?category_id=15"> <img
				src="https://iili.io/J9THafe.jpg" alt="Growth Promoters"
				class="offers11">
				<h2 class="off3">Growth Promoters</h2>
			</a>
		</div>
		<div class="offers">
			<a href="products?category_id=11"> <img
				src="https://iili.io/J9THi1n.png" alt="Herbicides" class="offers11">
				<h2 class="off4">Nematicides</h2>
			</a>
		</div>
	</div>

	<div class="slideshow-container">

		<!-- Full-width images with number and caption text -->
		<div class="mySlides fade">

			<img src="https://iili.io/J9zoS71.jpg" style="width: 100%"
				alt="advertisement">

		</div>

		<div class="mySlides fade">

			<img src="https://iili.io/J9zIgp9.png" style="width: 100%"
				alt="advertisement">

		</div>

		<div class="mySlides fade">

			<img src="https://iili.io/J9zIyTF.jpg" style="width: 100%"
				alt="advertisement">

		</div>

		<div class="mySlides fade">

			<img src="https://iili.io/J9zTvna.png" style="width: 100%"
				alt="advertisement">

		</div>
		<div class="mySlides fade">

			<img src="https://iili.io/J9zGBfI.jpg" style="width: 100%"
				alt="advertisement">

		</div>
		<div class="mySlides fade">

			<img src="https://iili.io/J9zRfYQ.webp" style="width: 100%"
				alt="advertisement">

		</div>

		<!-- Next and previous buttons -->
		<a class="prev" onclick="minusSlides(-1)">&#9668;</a> <a class="next"
			onclick="plusSlides(1)">&#9658;</a>
	</div>
	<br>
	<!-- The dots/circles -->
	<div class="spin_roller">
		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span> <span class="dot"
				onclick="currentSlide(4)"></span> <span class="dot"
				onclick="currentSlide(5)"></span> <span class="dot"
				onclick="currentSlide(6)"></span>
		</div>
	</div>


	<h1>List of Products</h1>
	<br>

	<%
	List<Product> productList = (List<Product>) request.getAttribute("PRODUCTLIST");
	%>

	<table>
		<tr>
			<th>Name</th>
			<th>Application</th>
			<th>Benefits</th>
			<th>Description</th>
			<th>Image</th>
			<th>Pages</th>
			<th>Price</th>
			<th>Status</th>
		</tr>

		<%
		for (Product product : productList) {
		%>
		<tr>
			<td><%=product.getName()%></td>
			<td><%=product.getApplication()%></td>
			<td><%=product.getBenefits()%></td>


			<td><%=product.getDescription()%></td>
			<td><img src="<%=product.getImageURL()%>"
				alt="<%=product.getName()%> Image" width="130" height="130"></td>
			<td><a href="product/details?product_id=<%=product.getId()%>">Details</a>
				<a href="product/edit?product_id=<%=product.getId()%>">Update</a> <a
				href="product/delete?product_id=<%=product.getId()%>">Delete</a></td>
			<td><%=product.getPrice()%></td>
			<td><%=product.isActive()%></td>
		</tr>
		<%
		}
		%>
	</table>


	<button class="create_btn">
		<a href="product/new">Create</a>
	</button>

	<script>

	let slideIndex = 0;
	let timeoutID;
	let isTransitioning = false;
	function showSlides(n = 1) {
	  let i;
	  const slides = document.getElementsByClassName("mySlides");
	  const dots = document.getElementsByClassName("dot");
	  slideIndex += n;
	  if (slideIndex > slides.length) {
	    slideIndex = 1;
	  }
	  if (slideIndex < 1) {
	    slideIndex = slides.length;
	  }
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex - 1].style.display = "block";
	  dots[slideIndex - 1].className += " active";
	  isTransitioning = false;
	  timeoutID = setTimeout(showSlides, 3500); // Change slide every 2.5 seconds
	}

	showSlides();

	function plusSlides(n) {
	  if (!isTransitioning) {
	    isTransitioning = true;
	    clearTimeout(timeoutID); // Cancel any scheduled transitions
	    showSlides(n);
	  }
	}

	function minusSlides(n) {
	  if (!isTransitioning) {
	    isTransitioning = true;
	    clearTimeout(timeoutID); // Cancel any scheduled transitions
	    showSlides(n);
	  }
	}

	function currentSlide(n) {
	  if (!isTransitioning) {
	    isTransitioning = true;
	    clearTimeout(timeoutID); // Cancel any scheduled transitions
	    showSlides(n - slideIndex);
	  }
	}
	</script>
</body>
</html>

