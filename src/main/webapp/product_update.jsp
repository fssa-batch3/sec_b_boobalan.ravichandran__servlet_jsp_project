<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    h1 {
        text-align: center;
        padding: 20px;
        background-color: #333;
        color: white;
    }
    form {
        max-width: 500px;
        margin: 0 auto;
        padding: 40px 40px;
        background-color: white;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    label {
        font-weight: bold;
    }
    input[type="text"],
    input[type="url"],
    textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    button[type="submit"] {
        background-color: #333;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 3px;
        cursor: pointer;
    }
</style>
</head>
<body>

<%  Product product = (Product) request.getAttribute("product");   %>


	<h1>Update Product</h1>
	<form action="update" method="post">
	
		<input type="hidden" name="id" value="<%= product.getId() %>" />

       <label for="name">Product Name:</label>
		<input type="text"  name="name" value="<%=  product.getName() %>"  readonly>
		<br>
		<label for="name">Product Manufacture Company:</label>
		<input type="text"  name="name" value="<%=  product.getManufacture() %>"  readonly>
		<br>
		<label for="productWeight">Product Weight:</label>
		<input type="text"  name="product_weight" value="<%=  product.getProductWeight() %>"  required>
		<br>

		<label for="description">Description:</label><br>
		<textarea  name="description" rows="4" required><%=  product.getDescription() %></textarea>
		<br>
		<label for="benefits">Benefits:</label><br>
		<textarea name="benefits" rows="4" required> <%=  product.getBenefits()%></textarea>
		<br>
		<label for="application">Application:</label><br>
		<textarea  name="application" rows="4" required> <%=  product.getApplication() %></textarea>
		<br>

		<label for="imageURL">Product Image</label>
		<input type="url" id="imageURL" name="image_url" value="<%=  product.getImageURL() %>"required><br>

		<button type="submit">Submit</button>
	</form>

</body>
</html>
