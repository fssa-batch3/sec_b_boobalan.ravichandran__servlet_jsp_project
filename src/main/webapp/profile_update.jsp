
<%@page import="in.fssa.fertagriboomi.model.User"%>
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
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/update_profile.css">
<title>Update profile details</title>
<style type="text/css">
*{
	font-family: Arial, sans-serif;
}
</style>
</head>
<body>
	<%
	User userDetail = (User) request.getAttribute("USERDETAIL");
	%>
	<h1>Update Profile Details</h1>
	<form action="update" method="post">
		<div>
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" value="<%=userDetail.getName()%>" required>
		</div>
		<div>
			<label for="email">Email Address:</label> <input type="email"
				id="phone" name="email" value="<%=userDetail.getEmail()%>" readonly>
		</div>
		<div class="form-group">
			<label for="mobile">Phone Number:</label> <input type="text"
				id="mobile" name="phone" value="<%=userDetail.getPhoneNumber()%>"
				required pattern="[0-9].{9}" title="Enter 10 number only"
				maxlength="10">
		</div>
		<div class="error"></div>
		<div>
			<label for="password">Password:</label> <input type="password"
				id="password" value="<%=userDetail.getPassword()%>" name="password"
				required> <span class="password-toggle"
				onclick="togglePasswordVisibility()">Show</span>
		</div>
		<div class="button_store">
			<button type="submit">Update</button>
			<a class="cancel-btn" href="../profile_details">Cancel</a>
		</div>
	</form>
	
	

	<script>
		function togglePasswordVisibility() {
			const passwordField = document.getElementById('password');
			const passwordToggle = document.querySelector('.password-toggle');
			if (passwordField.type === 'password') {
				passwordField.type = 'text';
				passwordToggle.textContent = 'Hide';
			} else {
				passwordField.type = 'password';
				passwordToggle.textContent = 'Show';
			}
		}
		
	
		const mobileInput = document.getElementById("mobile");
		const formGroup = document.querySelector(".form-group");
		const errorMessage = document.querySelector(".error");

		mobileInput.addEventListener("input", () => {
		    const inputValue = mobileInput.value.trim(); // remove leading/trailing whitespace
		    const isValidInput = /^[6-9]{1}[0-9]{9}$/.test(inputValue);
		   //   /^[6-9]\d{9}$/.test(inputValue) && !/^\d*(\d)\1{9}\d*$/.test(inputValue); // use regex to match the updated criteria
		    if (!isValidInput || inputValue === "") {
		      formGroup.classList.remove("valid");
		      formGroup.classList.add("invalid");
		      if (inputValue === "") {
		        errorMessage.textContent = "Please enter a mobile number.";
		      } else if (/^\d+$/.test(inputValue)) {
		        errorMessage.textContent = "Enter a valid 10-digit mobile number.";
		      } else {
		        errorMessage.textContent = "Please enter digits only.";
		      }
		      errorMessage.style.color = "red";
		    } else {
		      formGroup.classList.remove("invalid");
		      formGroup.classList.add("valid");
		      errorMessage.textContent = "";
		    }
		});
	
	</script>

</body>

</html>