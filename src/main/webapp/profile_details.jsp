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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Profile Details</title>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/user_profile.css">

</head>
<body>

	<%
	String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
	%>
	<%
	if (loggedUserUniqueEmail == null) {
	%>
	<jsp:include page="/header.jsp"></jsp:include>
	<%
	} else {
	%>
	<jsp:include page="/after_login_header.jsp"></jsp:include>
	<%
	}
	%>
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
			<div class="button_container">
				<div class="update-btn">
					<a href="profile/edit"><button>Update Profile</button></a>
				</div>
				<div>
					<a class="logout" href="logout">Logout</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>