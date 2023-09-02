<%@page import="in.fssa.fertagriboomi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding-top: 10vh;
	background-color: #f2f2f2;
}

h1 {
	text-align: center;
	margin-top: 30px;
}

form {
	max-width: 400px;
	margin: 0 auto;
	padding: 80px 70px 80px 60px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

form div {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="password"],input[type="text"] {
	width: 100%; /* Reduce width to make space for the show/hide button */
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 20px;
}
input[type="email"]{
  background-color: rgba(173, 173, 173, 0.571);
}
input[type="email"]:focus{
outline:none;
}
.password-toggle {
	width: 10%;
	padding: 5px 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	cursor: pointer;
	margin-top: 20px;
}

button[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 30px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	border: 1.5px solid #4CAF50;
}

button[type="submit"]:hover,.cancel-btn:hover {
	border: 1.5px solid #337135;
	background-color: #e4ffe5;
	color: black;
}
.cancel-btn{
  text-decoration: none;
  margin-left:5vw;
  background-color: #4CAF50;
	color: white;
	padding: 10px 30px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	border: 1.5px solid #4CAF50;
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
			<label for="email">Email Address:</label> <input type="email" id="phone"
				name="email" value="<%=userDetail.getEmail() %>" readonly >
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
		<div>
			<button type="submit">Update</button>
			<a  class="cancel-btn" href="../profile_details">Cancel</a>
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