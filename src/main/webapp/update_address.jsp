<%@page import="in.fssa.fertagriboomi.model.DeliveryAddresses"%>
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
<title>edit address</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lora', serif;
}

main {
	display: flex;
	justify-content: center;
	align-content: center;
	padding-top: 1.2vw;
}

form {
	background-color: white;
	padding: 30px 50px 50px 50px;
	border-radius: 5px;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}

.address-title {
	padding-bottom: 20px;
	text-align: center;
}

.add-address-details label {
	display: block;
	margin-bottom: 05px;
	margin-top: 20px;
	font-weight: bold;
}

.add-address-details input, .add-address-details select {
	padding: 8px 10px;
	width: 30vw;
	font-size: 16px;
	border: 1.5px solid rgb(178, 178, 178);
}

.pincode-details input {
	padding: 8px 10px;
	width: 14vw;
	font-size: 16px;
	border: 1.5px solid rgb(178, 178, 178);
}

.zipcode {
	margin-right: 1.7vw;
}

.save-cancel-container button , #exit-this-page{
	padding: 9px 80px;
	width: 100%;
	display: block;
	margin-top: 20px;
	font-size: 16px;
	background-color: rgb(1, 65, 1);
	border: none;
	color: white !important;
	border-radius: 5px;
	text-align:center;
	text-decoration:none;
}

.save-cancel-container button:hover , #exit-this-page:hover{
	background-color: rgb(2, 121, 2);
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px
		6px 6px;
}

.add-address-details input:focus {
	outline: none;
}

.pincode-state-container {
	display: flex;
}
</style>
</head>

<body>
	<main>
		<%
		DeliveryAddresses addressDetails = (DeliveryAddresses) request.getAttribute("UPDATE_ADDRESS");
		if (addressDetails != null) {
		%>
		<form action="update_address" method="post">
		
			<div class="address-title">
				<h2>Add Your New Address</h2>
			</div>
			<input type="hidden" name="id" value="<%=addressDetails.getId()%>" />
			<div class="add-address-details">
				<label for="title">Address Tiltle</label> <select id="title"
					name="address_title">
					<option><%=addressDetails.getAddressTitle()%></option>
					<option value="Home">Home</option>
					<option value="Work">Work</option>
					<option value="Home">Others</option>
				</select>
			</div>
			<div class="add-address-details">
				<label for="street">Door No and Street</label> <input type="text"
					value="<%=addressDetails.getStreetName()%>" name="street_name"
					id="street" placeholder="Eg: 1/117, Kumaran Street..."
					maxlength="40">
			</div>
			<div class="add-address-details">
				<label for="local">Address(location)</label> <input type="text"
					value="<%=addressDetails.getLocation()%>" name="location"
					id="local" maxlength="30">
			</div>
			<div class="add-address-details">
				<label for="city">District/City</label> <select id="city"
					name="city">
					<option><%=addressDetails.getCity()%></option>
					<option value="Ariyalur">Ariyalur</option>
					<option value="Chengalpattu">Chengalpattu</option>
					<option value="Chennai">Chennai</option>
					<option value="Coimbatore">Coimbatore</option>
					<option value="Cuddalore">Cuddalore</option>
					<option value="Dharmapuri">Dharmapuri</option>
					<option value="Dindigul">Dindigul</option>
					<option value="Erode">Erode</option>
					<option value="Kallakurichi">Kallakurichi</option>
					<option value="Kanchipuram">Kanchipuram</option>
					<option value="Kanniyakumari">Kanniyakumari</option>
					<option value="Karur">Karur</option>
					<option value="Krishnagiri">Krishnagiri</option>
					<option value="Madurai">Madurai</option>
					<option value="Mayiladuthurai">Mayiladuthurai</option>
					<option value="Nagapattinam">Nagapattinam</option>
					<option value="Namakkal">Namakkal</option>
					<option value="Nilgiris">Nilgiris</option>
					<option value="Perambalur">Perambalur</option>
					<option value="Pudukkottai">Pudukkottai</option>
					<option value="Ramanathapuram">Ramanathapuram</option>
					<option value="Ranipet">Ranipet</option>
					<option value="Sivagangai">Sivagangai</option>
					<option value="Tenkasi">Tenkasi</option>
					<option value="Thanjavur">Thanjavur</option>
					<option value="Theni">Theni</option>
					<option value="Thoothukudi">Thoothukudi</option>
					<option value="Tiruchirappalli">Tiruchirappalli</option>
					<option value="Tirunelveli">Tirunelveli</option>
					<option value="Tirupathur">Tirupathur</option>
					<option value="Tiruppur">Tiruppur</option>
					<option value="Tiruvallur">Tiruvallur</option>
					<option value="Tiruvannamalai">Tiruvannamalai</option>
					<option value="Tiruvarur">Tiruvarur</option>
					<option value="Vellore">Vellore</option>
					<option value="Viluppuram">Viluppuram</option>
					<option value="Virudhunagar">Virudhunagar</option>
				</select>

			</div>
			<div class="add-address-details">
				<label for="name">Name</label> <input type="text"
					name="persone_name" Value="<%=addressDetails.getPersonName()%>"
					id="name">
			</div>
			<div class="pincode-state-container">
				<div class="add-address-details pincode-details zipcode">
					<label for="pincode">Pincode</label> <input type="text"
						Value="<%=addressDetails.getPincode()%>" name="pincode"
						id="pincode">
				</div>
				<div class="add-address-details pincode-details">
					<label for="state">State</label> <input type="text" name="state"
						value="Tamil Nadu" id="state" readonly>
				</div>
			</div>
			<div class="add-address-details form-group">
				<label for="mobile">Mobile Number</label> <input type="text"
					name="mobile" Value="<%=addressDetails.getMobileNumber()%>"
					id="mobile">
			</div>
			<div class="error"></div>

			<div class="save-cancel-container">
				<button type="submit" id="save-address">Save</button>
				<a href="<%= request.getContextPath()%>/profile_details" id="exit-this-page">Cancel</a>
			</div>
		</form>
		<%
		}else{
		%>
		<form action="create_address" method="post"  id="addressForm">
		
			<div class="address-title">
				<h2>Add Your New Address</h2>
			</div>
			<input type="hidden" name="id"  />
			<div class="add-address-details">
				<label for="title">Address Tiltle</label> <select id="title"
					name="address_title">
					
					<option value="Home">Home</option>
					<option value="Work">Work</option>
					<option value="Home">Others</option>
				</select>
			</div>
			<div class="add-address-details">
				<label for="street">Door No and Street</label> <input type="text"
					 name="street_name"
					id="street" placeholder="Eg: 1/117, Kumaran Street..."
					maxlength="40">
			</div>
			<div class="add-address-details">
				<label for="local">Address(location)</label> <input type="text"
					 name="location"
					id="local" maxlength="30">
			</div>
			<div class="add-address-details">
				<label for="city">District/City</label> <select id="city"
					name="city">
					
					<option value="Ariyalur">Ariyalur</option>
					<option value="Chengalpattu">Chengalpattu</option>
					<option value="Chennai">Chennai</option>
					<option value="Coimbatore">Coimbatore</option>
					<option value="Cuddalore">Cuddalore</option>
					<option value="Dharmapuri">Dharmapuri</option>
					<option value="Dindigul">Dindigul</option>
					<option value="Erode">Erode</option>
					<option value="Kallakurichi">Kallakurichi</option>
					<option value="Kanchipuram">Kanchipuram</option>
					<option value="Kanniyakumari">Kanniyakumari</option>
					<option value="Karur">Karur</option>
					<option value="Krishnagiri">Krishnagiri</option>
					<option value="Madurai">Madurai</option>
					<option value="Mayiladuthurai">Mayiladuthurai</option>
					<option value="Nagapattinam">Nagapattinam</option>
					<option value="Namakkal">Namakkal</option>
					<option value="Nilgiris">Nilgiris</option>
					<option value="Perambalur">Perambalur</option>
					<option value="Pudukkottai">Pudukkottai</option>
					<option value="Ramanathapuram">Ramanathapuram</option>
					<option value="Ranipet">Ranipet</option>
					<option value="Sivagangai">Sivagangai</option>
					<option value="Tenkasi">Tenkasi</option>
					<option value="Thanjavur">Thanjavur</option>
					<option value="Theni">Theni</option>
					<option value="Thoothukudi">Thoothukudi</option>
					<option value="Tiruchirappalli">Tiruchirappalli</option>
					<option value="Tirunelveli">Tirunelveli</option>
					<option value="Tirupathur">Tirupathur</option>
					<option value="Tiruppur">Tiruppur</option>
					<option value="Tiruvallur">Tiruvallur</option>
					<option value="Tiruvannamalai">Tiruvannamalai</option>
					<option value="Tiruvarur">Tiruvarur</option>
					<option value="Vellore">Vellore</option>
					<option value="Viluppuram">Viluppuram</option>
					<option value="Virudhunagar">Virudhunagar</option>
				</select>

			</div>
			<div class="add-address-details">
				<label for="name">Name</label> <input type="text"
					name="persone_name" 
					id="name">
			</div>
			<div class="pincode-state-container">
				<div class="add-address-details pincode-details zipcode">
					<label for="pincode">Pincode</label> <input type="text"
						name="pincode"
						id="pincode">
				</div>
				<div class="add-address-details pincode-details">
					<label for="state">State</label> <input type="text" name="state"
						value="Tamil Nadu" id="state" readonly>
				</div>
			</div>
			<div class="add-address-details form-group">
				<label for="mobile">Mobile Number</label> <input type="text"
					name="mobile" 
					id="mobile">
			</div>
			<div class="error"></div>

			<div class="save-cancel-container">
				<button type="submit" id="save-address">Save</button>
				<a href="<%= request.getContextPath()%>/profile_details" id="exit-this-page">Cancel</a>
			</div>
		</form>
		
		<%} %>
	</main>
	<script>

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
	<%if(addressDetails == null){%>
	document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("addressForm");
        form.addEventListener("submit", function(event) {
            // Check if any of the input fields are empty
            const inputs = form.querySelectorAll("input[type=text], select");
            let isValid = true;

            inputs.forEach(function(input) {
                if (input.value.trim() === "") {
                    isValid = false;
                
                }
            });

            if (!isValid) {
                // Prevent the form from submitting
                event.preventDefault();
                alert("Please fill in all required fields.");
            }
        });
    });
<%}%>
	</script>
</body>
</html>