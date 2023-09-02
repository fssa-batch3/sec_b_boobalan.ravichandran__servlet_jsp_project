<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="SO-8859-1">
<title>Add New Product</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin-top: 20px;
	color: #333;
}

form {
	max-width: 500px;
	margin: auto;
	background-color: #fff;
	padding: 30px 50px 30px 30px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: #444;
}

input[type="text"], input[type="url"], input[type="number"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

textarea {
	resize: vertical;
}

button[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	font-size: 16px;
	transition: background-color 0.3s;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<h1>Add New Product</h1>

	<form action="product/create" method="post">
		<label>Product Name:</label>
		 <input type="text" name="name"
			required="true"> 
			<label>Product Weight:</label> 
			<input
			type="text" name="product_weight" required="true">
			 <label>Product
			Category:</label> 
			<input type="number" name="product_category"
			required="true"> 
			<label>Description:</label>
		<textarea name="description" rows="4" required="true"></textarea>

		<label>Benefits:</label>
		<textarea name="benefits" rows="4" required="true"></textarea>

		<label>Application:</label>
		<textarea name="application" rows="4" required="true"></textarea>

		<label>Manufacture:</label> <input type="text" name="manufacture"
			required> <label>Price:</label> <input type="number"
			name="price" required> <label>Image URL:</label> <input
			type="url" name="image_url" required>

		<button type="submit">Submit</button>
	</form>
</body>
</html>


