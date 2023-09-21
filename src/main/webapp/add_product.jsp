<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="SO-8859-1">
<title>Add New Product</title>
<style>
/* Reset some default styles */
body, h1 {
    margin: 0;
    padding: 0;
}

/* Global styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
}

/* Center the heading */
h1 {
    text-align: center;
    margin-top: 20px;
    margin-bottom:2vh;
}

/* Form container */
form {
    max-width: 500px;
    margin: auto;
    background-color: #fff;
    padding: 30px 50px 30px 30px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 5vh;
}

/* Form labels */
label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: #444;
}

/* Form inputs and textareas */
input[type="text"],
input[type="url"],
input[type="number"],
textarea,
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

/* Make the textarea vertically resizable */
textarea {
    resize: vertical;
}

/* Form submit button */
button[type="submit"] {
    width: 31vw;
    padding: 1.5vh 3vw;
    background-color: rgb(0, 87, 81);
    color:white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

/* Button hover effect */
button[type="submit"]:hover {
   background-color: rgb(59, 150, 144);
    color:white;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}

/* Error message container */
.error_div {
    text-align: center;
}

/* Error message text */
.error_div p {
    color: #ff0e0e;
    font-size: 19px;
}
.error_div1, .error_div2, .error_div3{

color:red;
}
#myNumberInput::-webkit-inner-spin-button,
#myNumberInput::-webkit-outer-spin-button {
    -webkit-appearance: none;
    appearance: none;
    margin: 0;
}
</style>
</head>
<body>
	<h1>Add New Product</h1>
	<%
	String errorMessage = (String) request.getAttribute("ERRORDETAILS");
	%>
	<%
	if (errorMessage != null) {
	%>
	<div class="error_div">
		<p><%=errorMessage%></p>
	</div>
	<%
	}
	%>
<form action="create" method="post" id="productForm">
        <label>Product Name:</label>
        <input type="text" name="name" required="true"  autofocus>
     

        <label>Product Weight:</label>
        <input type="text" name="product_weight" id="weight"required="true">
        <div class="error_div1"></div>

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
        <div class="error_div"></div>

        <label>Description:</label>
        <textarea name="description" rows="4" required="true"></textarea>
     

        <label>Benefits:</label>
        <textarea name="benefits" rows="4" required="true"></textarea>
        

        <label>Application:</label>
        <textarea name="application" rows="4" required="true"></textarea>
        

        <label>Manufacture:</label>
        <input type="text" name="manufacture" required>
        
       <label>Stock Count:</label>
        <input type="number" id="myNumberInput" name="stock_count" required pattern="[0-9]+" min="1">

        <label>Price:</label>
        <input type="text" name="price" id="custom-number-input" required pattern="[0-9]+" min="1">
        <div class="error_div2"></div>

        <label>Discount:</label>
        <input type="text" name="discount" id="custom-discount-input" required pattern="[0-9]+" min="1">
        <div class="error_div3"></div>

        <label>Image URL:</label>
        <input type="url" name="image_url" id="custom-valid-input" required>
        <input type="hidden" id="custom-image-input">
        
        <button type="submit">Submit</button>
    </form>


	
	<script>
		document.addEventListener("input", function(e) {
			if ((e.target && e.target.id === "custom-number-input") || e.target
					&& e.target.id === "custom-discount-input") {
				e.target.value = e.target.value.replace(/\D/g, "");
			}
		});
		const weightInput = document.getElementById("weight");
		const errorMessage = document.querySelector(".error_div1");

		weightInput.addEventListener("input", () => {
		    const inputValue = weightInput.value.trim();
		    const isValidInput = /^(?!0(g|kg|gms|gm|ml|l)$)(\d+(\.\d+)?\s*(g|kg|gm|gms|ml|l))$/i.test(inputValue);

		    if (!isValidInput) {
		        errorMessage.textContent = "Please enter a valid product weight (e.g., 20 ml, 2.5kg) excluding 0g, 0kg, 0gm, 0gms, 0ml, or 0l.";
		        errorMessage.style.display = "block";
		    } else {
		        errorMessage.textContent = ""; 
		        errorMessage.style.display = "none"; 
		    }
		});

		const priceInput = document.getElementById("custom-number-input");
		const errorMessage1 = document.querySelector(".error_div2");

		priceInput.addEventListener("input", () => {
		    const inputValue = parseFloat(priceInput.value); // Convert input value to a number

		    if (inputValue < 50 || inputValue > 50000) {
		        errorMessage1.textContent = "Price should be between a minimum of 50 and a maximum of 50000.";
		        errorMessage1.style.display = "block";
		    } else {
		        errorMessage1.textContent = ""; 
		        errorMessage1.style.display = "none"; 
		    }
		});
        
		const discountInput = document.getElementById("custom-discount-input");
		const errorMessage2 = document.querySelector(".error_div3");

		discountInput.addEventListener("input", () => {
		    const inputValue1 = parseFloat(priceInput.value); 
		    const inputValue2 = parseFloat(discountInput.value); 
		    

		    if (inputValue2 < 0 || inputValue2 > Math.floor(0.90 * inputValue1))  {
		        errorMessage2.textContent = "Discount should be between 0 and a maximum of 92% of the price.";
		        errorMessage2.style.display = "block";
		    } else {
		        errorMessage2.textContent = ""; 
		        errorMessage2.style.display = "none"; 
		    }
		});
	</script>

</body>
</html>


