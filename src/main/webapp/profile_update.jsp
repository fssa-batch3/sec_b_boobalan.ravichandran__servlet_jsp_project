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

<link rel="stylesheet" href="../css/update_profile.css">
<title>Update profile details</title>

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
		<div>
			<label for="phone">Phone Number:</label> <input type="tel" id="phone"
				name="phone" value="<%=userDetail.getPhoneNumber()%>" required>
		</div>
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
	</script>

</body>

</html>