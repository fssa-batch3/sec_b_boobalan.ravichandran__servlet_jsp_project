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
	margin-bottom:5vh;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: #444;
}

input[type="text"], input[type="url"], input[type="number"], textarea, select {
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
	width: 104%;
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
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
}
</style>
</head>
<body>
	<h1>Add New Product</h1>

	<form action="create" method="post">
		<label>Product Name:</label>
		 <input type="text" name="name"
			required="true"> 
			<label>Product Weight:</label> 
			<input
			type="text" name="product_weight" required="true">
			 <label for="product_category">Product Category:</label>
<select name="product_category" id="product_category" required="true">
    <option value="1">DHANUKA</option>
    <option value="2">DOW AGRO SCIENCE</option>
    <option value="3">TATA RALLIS</option>
    <option value="4">ADAMA</option>
    <option value="5">BAYER</option>
    <option value="6">ARIES AGRO</option>
    <option value="7">INFOIL</option>
    <option value="8">RINUJA</option>
    <option value="9">BIO INSECTICIDES</option>
    <option value="10">BIO FUNGICIDES</option>
    <option value="11">BIO NEMATICIDES</option>
    <option value="12">BIO VIRCIDES</option>
    <option value="13">MAJOR NURIENTS</option>
    <option value="14">SECONDARY NURIENTS</option>
    <option value="15">GROWTH PROMOTERS</option>
    <option value="16">GROWTH RETARDANTS</option>
    <option value="17">ORGANIC FERTILIZERS</option>
    <option value="18">BIO FERTILIZERS</option>
    <option value="19">ANTI STRESSING AGENTS</option>
    <option value="20">MICRO NUTRIENTS</option>
</select>

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


