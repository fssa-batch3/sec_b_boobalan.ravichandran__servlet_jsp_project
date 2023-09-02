<%@page import="in.fssa.fertagriboomi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile details</title>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">

<style>
.profile-container {
	width: 60vw;
	height: 60vh;
	border-radius: 15px;
	text-align: center;
	align-items: center;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
	align-items: center;
}

.all_details_container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 4vh;
}

.name-container, .phone-container, .email-container, .password-container
	{
	display: flex;
	justify-content: space-between;
	margin: 6.5vh 8vw;
}

.title h2 {
	color: #65218a;
	margin-top: 3vh;
}

.update-btn a button {
	padding: 1.8vh 5.5vw;
	background-color: #176047;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 17px;
}

.update-btn a button:hover {
	background-color: #099f6b;
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%
	User userDetails = (User) request.getAttribute("USERDETAILS");
	%>
	<div class="all_details_container">

		<div class="profile-container">
			<div class="title">
				<h2>User Details</h2>
			</div>
			<div class="name-container">
				<h3>Name:</h3>
				<p><%=userDetails.getName()%></p>
			</div>
			<div class="phone-container">
				<h3>Phone Number:</h3>
				<p><%=userDetails.getPhoneNumber()%></p>
			</div>
			<div class="email-container">
				<h3>Email Address:</h3>
				<p><%=userDetails.getEmail()%></p>
			</div>
			<div class="password-container">
				<h3>Account Password:</h3>
				<p><%=userDetails.getPassword()%></p>
			</div>
			<div class="update-btn">
				<a href="profile/edit"><button>Update Profile</button></a>
			</div>
		</div>
	</div>
</body>
</html>