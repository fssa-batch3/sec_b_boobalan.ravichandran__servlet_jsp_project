
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
<link href="https://fonts.googleapis.com/css2?family=Neuton:ital,wght@0,200;0,300;1,400&display=swap" rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" href="./css/header.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>home page</title>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<style type="text/css">


*{
font-family: 'Neuton', serif;
    letter-spacing: .6px;
    word-spacing: 7px;
}
.slideshow-container {
	max-width: 85vw;
	position: relative;
	margin: auto;
	margin-top: 5vh;
}

.slideshow-container img {
	border-radius: 18px;
}

.mobile_footer {
	display: none;
}

.search-input .autocom-box {
	padding: 0px;
	max-height: 380px;
	width: 30vw;
	margin-left: 6.5vw;;
	overflow-y: auto;
	background-color: white;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3)
		0px 3px 7px -3px;
	border-radius: 0px 0px 5px 5px;
	opacity: 0;
	pointer-events: none;
	/* margin-top: -100px; */
	z-index: 1;
	position: absolute;
}

.search-input .search_bar {
	width: 35vw;
	height: 45px;
}

.search-input .search_bar .sear_btn {
	width: 80px;
}
</style>
</head>
<body>


	<jsp:include page="/header.jsp"></jsp:include>



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

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3 class="animate-charcter">All Products</h3>
			</div>
		</div>
	</div>
	<div class="offers1" id="interface">

		<%
		List<Product> productsList = (List<Product>) request.getAttribute("PRODUCTLIST");
		for (Product product : productsList) {
		%>
		<div class="today">

			<a
				href="<%=request.getContextPath()%>/product/details?product_id=<%=product.getId()%>">
				<img src="<%=product.getImageURL()%>"
				alt="<%=product.getName()%>">
				<p><%=product.getName()%></p>

				<div class="pricecontain">
					<div class="price101">
						<h3>Special Price:</h3>
						<h4>
							&#8377;<%=product.getPrice() - product.getDiscount()%></h4>
					</div>
					<div class="price11">
						<h3>Actual Price:</h3>
						<del>
							&#8377;<%=product.getPrice()%></del>
					</div>
				</div>
				<div class="div_save">
					<h3>
						You Save - &#8377;<%=product.getDiscount()%></h3>
				</div>
			</a>
		</div>

		<%
		}
		%>
	</div>

    <div class="technologies-container">
        <div class="technologies_title">
            <h2>New Technologies in Agriculture</h2>
        </div>
        <div class="new-technologies"> 
            <div class="new-technology-container">
                <img src="./assets/images/new_tech1.gif" alt="new technology">
            </div>
            <div class="new-technology-container">
                <img src="./assets/images/new_tech2.gif" alt="new technology">
            </div>
         
            <div class="new-technology-container">
                <img src="./assets/images/new_tech4.gif" alt="new technology">
            </div>
        </div>
        <div class="view-more-details">
          <a href="<%=request.getContextPath()%>/new_technologies">  <h3>View details -></h3></a>
        </div>
       </div>


	<div class="fab">
		<h1>FAB's PRIORITIES</h1>
		<div class="human">
			<div class="details">
				<img src="./assets/images/fert12.jpg" alt="Human Nutrition">
				<h2>Human Nutrition</h2>
				<hr class="trai">
				<p>Better soil and plant health means better human health. We
					promote best practices in fertilizer use to support higher crop
					yields and more nutritious food.</p>
			</div>
			<div class="details">
				<img src="./assets/images/fert13.jpg" alt="Climate Change">
				<h2>Climate Change</h2>
				<hr class="trai">
				<p>We work across the agriculture value chain to reduce
					greenhouse gas emissions and increase sequestration of carbon in
					soil.</p>
			</div>
			<div class="details">
				<img src="./assets/images/fert14.jpg" alt="Sustainable Production">
				<h2>Sustainable Production</h2>
				<hr class="trai">
				<p>Fertilizers are fundamental to agriculture and our challenge
					is to feed the world sustainably. Sustainable fertilizer production
					is key to increasing our industry’s energy efficiency and reducing
					CO2 emissions.</p>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>


	<h1>List of Products</h1>
	<br>

	<%
	List<Product> productList = (List<Product>) request.getAttribute("PRODUCTLIST");
	%>

	<table>
		<tr>
			<th>Name</th>

			<th>Description</th>
			<th>Image</th>
			<th>Pages</th>
			<th>Price</th>
			<th>discount</th>
			<th>Status</th>
		</tr>

		<%
		for (Product product : productList) {
		%>
		<tr>
			<td><%=product.getName()%></td>


			<td><%=product.getDescription()%></td>
			<td><img src="<%=product.getImageURL()%>"
				alt="<%=product.getName()%> Image" width="130" height="130"></td>
			<td><a href="product/details?product_id=<%=product.getId()%>">Details</a>
				<a href="product/edit?product_id=<%=product.getId()%>">Update</a> <a
				href="product/delete?product_id=<%=product.getId()%>">Delete</a></td>
			<td><%=product.getPrice()%></td>
			<td><%=product.getDiscount()%></td>
			<td><%=product.isActive()%></td>
		</tr>
		<%
		}
		%>
	</table>


	<button class="create_btn">
		<a href="product/new">Create</a>
	</button>

	<script src="<%=request.getContextPath()%>/javascript/search.js"> </script>
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

