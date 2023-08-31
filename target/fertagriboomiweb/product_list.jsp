<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.fertagriboomi.service.ProductService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<style>
body {
	font-family: Arial, sans-serif;
}

h1 {
	text-align: center;
	margin-top: 20px;
	color: #E30B5D;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dddddd;
	padding: 8px;
	text-align: center;
}

th {
	 background-color: black;
	 color:#E30B5D;
	 height:60px;
	 font-size:20px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}
button{
margin:5vh 0 5vh 80vw;
height:50px;
width:150px;

background-color: black;
border: 2px solid black;

}
button a{
text-decoration:none;
font-size:20px;
color:#f60953;

}
button a:hover{
color:black;

}
button:hover{
color:black;
border: 2px solid #f60953;
background-color: white;
}

</style>
</head>
<body>
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
			<th>Staus</th>
		</tr>

		<%
		for (Product product : productList) {
		%>
		<tr>
			<td><%=product.getName()%></td>
			<td><%=product.getApplication()%></td>
			<td><%=product.getBenefits()%></td>


			<td><%=product.getDescription()%></td>
			<td><img src="<%=product.getImageURL()%>" alt="<%=product.getName()%> Image" width="130" height="130"></td>
			<td>
			<a
				href="product/details?product_id=<%=product.getId()%>">Details</a>
				<a href="product/edit?product_id=<%=product.getId()%>">Update</a>
				<a href="product/delete?product_id=<%=product.getId()%>" >Delete</a>
			</td>
			<td> <%=product.isActive() %></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<button class="create_btn"><a href="product/new">Create</a></button>
</body>
</html>

