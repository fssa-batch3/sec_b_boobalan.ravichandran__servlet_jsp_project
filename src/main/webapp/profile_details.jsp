<%@page import="in.fssa.fertagriboomi.model.DeliveryAddresses"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.fertagriboomi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Neuton:ital,wght@0,200;0,300;1,400&display=swap" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Profile Details</title>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/user_profile.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/footer.css">
<style>
main {
	background-color: hsl(216, 100%, 99%);
	padding-top: 2vh;
	padding-left: 11vw;
	padding-bottom: 10vh;
}

.user-profile-details {
	display: flex;
}

.address-container {
	background-color: #ffffff;
	min-height: 27vh;
	border-radius: 10px;
	padding-bottom: 30px;
	width: 25vw;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}

.address-title {
	text-align: center;
	padding: 20px 0px;
	background-color: #176047;
	color: white !important;
	box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px
		2px;
}

.user-addresses {
	margin-top: 20px;
	padding: 10px 20px 30px 20px;
	overflow-y: scroll;
	min-height: 30vh;
	max-height: 74vh;
}

.user-addresses::-webkit-scrollbar {
	display: none;
}

.single-address {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	border-radius: 3px;
	padding: 10px 20px 5px 20px;
	margin-top: 10px;
}

.home-container {
	padding: 10px 0px 5px 0;
	margin-bottom: 10px;
	display: flex;
}

.home-container h3 {
	margin-top: 3px;
}

.home-container h4 {
	margin-left: 2vw;
	background-color: rgb(206, 206, 206);
	padding: 5px 13px;
	font-size: 16px;
	color: rgb(90, 90, 90);
	border-radius: 3px;
}

.address-details {
	margin-bottom: 2px;
	font-size: 17px;
}

.address-details p {
	margin-bottom: 7px;
}

.edit-remove {
	display: flex;
	border-top: 1.5px solid rgb(179, 179, 179);
}

.edit-remove a {
	text-decoration: none;
	color: black
}

.details-mobile {
	margin-bottom: 10px;
	text-align: center;
	margin-top: 10px;
}

#address-edit {
	cursor: pointer;
	padding: 8px 55px;
	border-right: 1px solid rgb(194, 194, 194);
}

#address-remove {
	padding: 8px 30px;
	margin-left: 15px;
	cursor: pointer;
	background: transparent;
	border: none;
	font-size: 16px;
}

#address-remove:hover, #address-edit:hover {
	color: #176047;
	font-weight: bold;
}

.add-new-address {
	width: 18vw;

	border-radius: 5px;
	color: rgb(255, 255, 255);
	border: 1.5px solid rgb(173, 173, 173);
	cursor: pointer;
	margin-left: 3vw;
	margin-top: 20px;
	background-color: #176047;
}
.add-new-address a{
color: rgb(255, 255, 255);
text-decoration:none;
}
.add-new-address h3 {
padding: 12px 20px 7px 40px;
	display: flex;
	font-weight: normal;
	font-size: 15px !important;
}

.add-new-address h3 p {
	font-size: 25px;
	margin-top: -6px;
	margin-right: 10px;
}

.add-new-address h3:hover {
	font-weight: bold;
	color:#176047;
}

.add-new-address:hover {
	background-color: #ffffff;
	color:#176047;
	border: 1.5px solid #176047;
	font-weight: bold;
}
/* right side profile  */
.personal-information-container {
	background-color: #ffffff;
	margin-left: 10px;
	width: 50vw;
	border: 2px solid rgb(213, 213, 213);
	height: 68vh;
}

.personal-title {
	padding: 30px 0;
	border-bottom: 2px solid gray;
	text-align: center;
	color: rgb(88, 88, 88);
}

.personal-title h1 {
	font-size: 27px;
}

.information-container1 {
	padding: 35px 70px 35px 70px;
}

.sub-information-details {
	display: flex;
	justify-content: space-between;
	padding: 3.5vh 0px;
}

.sub-information-details p {
	font-size: 18px !important;
}

.sub-information-details h2 {
	color: rgb(88, 88, 88);
	font-size: 20px;
}

.edit-profile, .del_account {
	/* margin-left: 30vw; */
	background-color: #176047;
	padding: 10px 50px 10px 50px;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}

.del_account a, .edit-profile a {
	text-decoration: none;
	color: white;
}

.edit-profile:hover, .del_account:hover {
	background-color: #189469;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
}

.edit-delete {
	display: flex;
	justify-content: space-around;
	background-color: #176047;
	padding: 10px 0px;
	height: 11vh;
	align-items: center;
}

/* 
main{
  
   display: flex;
   justify-content: center;
  align-items: center;
   padding: 50px 0;
   
   color: rgb(255, 255, 255);
   background-color: rgba(251, 255, 247, 0.995);
} */
.create_pro {
	background-color: hsl(216, 100%, 99%);
	display: none;
}
/* order create------------ */
.create_pro button {
	margin-left: 1100px;
	padding: 10px 50px;
	font-size: 17px;
	border-radius: 5px;
	border: none;
	background-color: rgb(2, 74, 2);
	color: white;
	margin-bottom: 60px;
}

.create_pro button:hover {
	background-color: rgb(7, 146, 7);
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px
		6px 6px;
}

/* edit profile poppup */
.edit-profile-details {
	position: fixed;
	background-color: #000000a4;
	width: 100vw;
	height: 100%;
	top: 0px;
	visibility: hidden;
	z-index: 5;
}

.fulledit {
	background-color: #ffffff;
	width: 30vw;
	height: 44vw;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	position: absolute;
	top: 13%;
	border-radius: 5px;
	left: 35%;
}

/* popPup message shown */
.edit-profile-details.open-message {
	visibility: visible;
}

.exit-icon img {
	margin-left: 26.5vw;
	width: 35px;
	height: 35px;
	margin-top: 1.8vh;
	padding: 10px;
}

.exit-icon img:hover {
	background-color: rgb(191, 191, 191);
	border-radius: 20px;
}

.edit-title {
	text-align: center;
	margin-top: 5px;
	margin-bottom: 20px;
}

.edit-details-container {
	padding: 30px 50px 50px 80px;
}

.edit-details-container label {
	display: block;
	margin-top: 30px;
	font-weight: bold;
}

.user-personal-details input, .user-personal-details select {
	width: 90%;
	caret-color: black;
	padding: 8px 10px;
	margin-top: 10px;
	font-size: 16px;
	border: 1.5px solid rgb(184, 184, 184);
}

.user-personal-details input:focus, .user-personal-details select:focus
	{
	outline: none;
}

#edit-gender option {
	padding: 10px 0px;
}

/* save button in edit profile page */
.user-details-save {
	text-align: center;
}

.user-details-save button {
	width: 75%;
	padding: 14px 0;
	font-size: 17px;
	border-radius: 3px;
	background-color: #176047;
	border: none;
	color: white !important;
}

.user-details-save button:hover {
	background-color: #0a9161;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
}

.password-container-class input[type="password"], .password-container-class input[type="text"] {

	margin-bottom: 20px;
}
.password-toggle{
cursor:pointer;
border:1px solid black;
padding:5px 20px;
}
input[type="email"]{
background-color: rgb(213, 213, 213);
}

/* -------==============/ @media start/=-============---------------- */
@media screen and (max-width:400px) {
	.form1 {
		display: block;
		box-shadow: none;
		width: 100vw;
	}
	main {
		margin: 0;
	}
	.wrapper {
		width: 8rem;
		height: 8rem;
		position: relative;
		border: 2px solid gray;
		margin-left: 100px;
	}
	.my_file {
		position: absolute;
		width: 100%;
		padding: 20px 50px;
	}
	.my_file::before {
		font-size: 25px;
	}
	.my_file::after {
		content: 'Update';
		font-size: 10px;
		top: 40px;
		margin-left: -5px;
	}
	/* ---------===============/profile background/------============ */
	.details1 {
		background-color: rgb(247, 240, 217);
		padding: 20px 20px 20px 30px;
		width: 100vw;
		color: black;
		margin-top: 0px;
	}
	.details1 h2 {
		margin-top: 15px;
		margin-left: 105px;
		font-size: 15px;
	}
	.details1 p {
		margin-left: .3rem;
	}
	.details1 label {
		font-size: 14px;
		display: inline-block;
		margin-left: 40px;
	}
	input:focus-visible {
		outline: none;
	}
	#dobb {
		padding: 5px 20px;
		border-radius: 3px;
		border-bottom: none;
		border-bottom: 1px solid black;
		font-size: 12px;
	}
	label {
		display: block;
		font-size: 16px;
	}
	.details h2 {
		font-size: 18px;
		margin-left: 0px;
		margin-bottom: 30px;
	}
	.details {
		background: none;
		background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
		padding: 20px 10px 30px 20px;
		width: 100vw;
	}
	#full_name, #gender, #email, #mobile, #paswo, #street, #city, #state,
		#district {
		margin-left: 0;
		font-size: 15px;
		padding: 5px 20px;
		height: 4vh;
		width: 88vw;
		margin-bottom: 30px;
		border: 1.5px solid gray;
		outline: gray;
		margin-top: 10px;
		background-color: rgb(255, 248, 239);
		border-radius: 3px;
	}
	.button {
		margin-top: 30px;
	}
	.button button {
		padding: 5px 30px 5px 30px;
		margin-right: 20px;
		font-size: 13px;
		background-color: rgb(5, 83, 33);
		border-radius: 3px;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	.button button:hover {
		background-color: rgb(3, 140, 53);
		color:rgb(5, 83, 33);
		box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;
	}
	footer {
		display: none;
	}
}
</style>
</head>

<body>


	<jsp:include page="/header.jsp"></jsp:include>
	
	<%
	User userDetails = (User) request.getAttribute("USERDETAILS");
	List<DeliveryAddresses> addressList = (List<DeliveryAddresses>) request.getAttribute("ADDRESS_LIST");
	%>

	<main>
		<div class="user-profile-details">
			<div class="address-container">
               <div>
               <div>
               <a href=""><img src=" ">My Orders</a>
               </div>
               <div>
                <a href="">Logout</a>
               </div>
               </div>
				<div class="address-title">
					<h2>Manage Addresses</h2>
				</div>
				<div class="user-addresses">
					<%
					if (addressList != null) {
						for (DeliveryAddresses address : addressList) {
					%>
					<div class="single-address">
						<div class="home-container">
							<h3><%=address.getAddressTitle()%></h3>
							<h4><%=address.getPersonName()%></h4>
						</div>
						<div class="address-details">
							<p><%=address.getStreetName()%></p>
						</div>
						<div class="address-details">
							<p><%=address.getLocation()%></p>
						</div>
						<div class="address-details">
							<p><%=address.getCity()%>
								-
								<%=address.getPincode()%></p>
						</div>
						<div class="address-details">
							<p><%=address.getState()%></p>
						</div>
						<div class="address-details details-mobile">
							<p>
								Mobile Number -
								<%=address.getMobileNumber()%></p>
						</div>
						<div class="edit-remove">
							<a
								href="<%=request.getContextPath()%>/profile_details/edit_address?address_id=<%=address.getId()%> ">
								<p id="address-edit">EDIT</p>
							</a>
							<a href="<%=request.getContextPath()%>/profile_details/delete_address?address_id=<%=address.getId()%> "><button id="address-remove" data_set="<%=address.getId()%>">REMOVE</button></a>
						</div>
					</div>
					<%
					}
					}
					%>
					<!-- Repeat this block for each address -->
				</div>

				<div class="add-address-container">
					<div class="add-new-address">
						<a href="<%=request.getContextPath()%>/profile_details/new_address"><h3>
							<p>+</p>
							ADD A NEW ADDRESS
						</h3></a>
					</div>
				</div>

			</div>
			<div class="personal-information-container">
				<div class="personal-title">
					<h1>Personal Information</h1>
				</div>
				<div class="information-container1">
					<div class="sub-information-details">
						<h2>Name:</h2>
						<p id="full_name1">
							<%=userDetails.getName()%>
						</p>
					</div>

					<div class="sub-information-details">
						<h2>Email Address:</h2>
						<p id="email"><%=userDetails.getEmail()%></p>
					</div>
					<div class="sub-information-details">
						<h2>Account Password:</h2>
						<p id="dobb">&odot; &odot; &odot; &odot; &odot; &odot;</p>
					</div>
					<div class="sub-information-details ">
						<h2>Mobile Number:</h2>
						<p id="mobile"><%=userDetails.getPhoneNumber()%></p>
					</div>


				</div>
				<div class="edit-delete">
					<div class="edit-profile">
						<a href="#"><h3>UPDATE PROFILE</h3></a>
					</div>
					<div class="del_account">
						<a href="logout"><h3>LOGOUT</h3></a>
					</div>
				</div>

			</div>

		</div>

	</main>

	<form action="profile/update" method="post">
		<div class="edit-profile-details">
			<div class="fulledit">
				<div class="exit-icon">
					<img src="https://iili.io/J9rCD3x.png" alt="exit"
						class="close-profile-details">
				</div>
				<div class="edit-details-container">
					<div class="edit-title">
						<h2>Edit Personal Details</h2>
					</div>
					<div class="user-personal-details">
						<label for="edit-full-_name">Name</label> <input type="text"
							id="edit-full_name" maxlength="30"
							value="<%=userDetails.getName()%>" name="name" required>
					</div>
					<div class="user-personal-details">
						<label for="mobile">Phone Number:</label> <input type="text"
							id="mobile" name="phone"
							value="<%=userDetails.getPhoneNumber()%>" required
							pattern="[0-9].{9}" title="Enter 10 number only" maxlength="10">
					</div>
					<div class="user-personal-details">
						<label for="email">Email Address:</label> <input type="email"
							id="phone" name="email" value="<%=userDetails.getEmail()%>"
							readonly>
					</div>
					


				</div>
				<div class="user-details-save">
					<button id="save_data">Save</button>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script src="<%= request.getContextPath()%>/javascript/search.js"> </script>
	
	<script>

 // edit profile button click
 const editPopPupShow = document.querySelector(".edit-profile-details")
 document.querySelector(".edit-profile").addEventListener("click", () => {
   editPopPupShow.classList.add("open-message");
 });

 // close the poppup message

 document.querySelector(".close-profile-details").addEventListener("click", () => {
   editPopPupShow.classList.remove("open-message");
 });
 
 

		
    </script>

</body>
</html>