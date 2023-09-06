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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Product List</title>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">

<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/product_list.css">

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
	List<Product> productList = (List<Product>) request.getAttribute("CATEGORYPRODUCTS");
	%>



	<div class="insecticide">

		<div class="offers1">
			<%
			if (productList != null && !productList.isEmpty()) {
				for (Product product : productList) {
			%>
			<div class="today" data-id="product_unique_id">
				<a href="product/details?product_id=<%=product.getId()%>"> <img
					src="<%=product.getImageURL()%>" alt="<%=product.getName()%>">
					<p><%=product.getName()%></p>
					<div class="star"></div>
					<div class="pricecontain">
						<div class="price">
							<h3>Special Price:</h3>
							<%
							int newPrice = product.getPrice() - 270;
							%>

							<h4>
								&#8377;
								<%=newPrice%></h4>
						</div>

					</div>
					<div class="div_save"></div>
				</a>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

</body>
</html>