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
<link rel="stylesheet" href="./css/product_list.css">
<title>All products</title>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Lora', serif;
 
  }
  .today {
  margin:4vh 2.3vw;
  }
  </style>
</head>
<body>
	<jsp:include page="/admin_header.jsp"></jsp:include>
	<%
	List<Product> productList = (List<Product>) request.getAttribute("PRODUCTLIST");
	%>



	<div class="insecticide">

		<div class="offers1">
			<%
			if (productList != null && !productList.isEmpty()) {
				for (Product product : productList) {
			%>
			<div class="today" data-id="product_unique_id">
				<a href="admin_product_details?product_id=<%=product.getId()%>"> <img
					src="<%=product.getImageURL()%>" alt="<%=product.getName()%>">
					<p><%=product.getName()%></p>
					<div class="star"></div>
					<div class="pricecontain">
						<div class="price">
							<h3>Price:</h3>
							<%
							int newPrice = product.getPrice() - product.getDiscount();
							%>

							<h4>
								&#8377;
								<%=newPrice%></h4>
						</div>
						
					</div>
					
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