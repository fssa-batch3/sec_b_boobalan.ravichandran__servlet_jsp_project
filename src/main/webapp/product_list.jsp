<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<title>Insert title here</title>
<style>
a div.product_cart {
	border: 3px sold black;
	padding: 20px 30px 20px 15px;
	margin: 50px 30px;
	width: 20vw;
	border: 1px solid rgb(183, 183, 183);
	justify-content: center;
	text-align: center;
	min-height: 48vh;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}

.product_cart img {
	width: 18vw;
	height: 32vh;
}

.price_container {
margin-top: 2.35vw;
	display: flex;
	margin-left: 4.4vw;
}

.price_container h3 {
	color: #e11e55;
}

.price_container p {
	
	margin-left: .6vw;
	font-size: 19px;
	color: #779e61;
}

a {
	text-decoration: none;
}

.product_container {
	padding: 5vh 5vw 5vh 5vw;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-around;
	margin-top: 4vh;
}
</style>
</head>

<body>
	<%@ include file="/header.jsp"%>
	<%
	List<Product> productList = (List<Product>) request.getAttribute("CATEGORYPRODUCTS");
	%>
	<div class="product_container">
		<%
		for (Product product : productList) {
		%>
		<a href="product/details?product_id=<%=product.getId()%>">
			<div class="product_cart">
				<div>
					<img src="<%=product.getImageURL()%>" alt="<%=product.getName()%>">
				</div>
				<div>
					<div>
						<h3><%=product.getName()%></h3>
					</div>
					<div class="price_container">
						<h3>Price: &#8377;</h3>
						<p><%=product.getPrice()%></p>
					</div>
				</div>
			</div>
		</a>
		<%
		}
		%>
	</div>


</body>
</html>