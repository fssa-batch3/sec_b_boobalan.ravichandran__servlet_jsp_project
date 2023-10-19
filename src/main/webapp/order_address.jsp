<%@page import="java.util.Map"%>
<%@page import="in.fssa.fertagriboomi.model.DeliveryAddresses"%>
<%@page import="java.util.List"%>
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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Delivery address</title>
<style>
* {
	box-sizing: border-box;
	border: 0;
	margin: 0;
	font-family: 'Lora', serif;
}

main {
	padding: 5vh 10vw;
}

.fert-logo {
	background-color: #eaeaea;
	padding: 10px 50px;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	position: fixed;
	width: 100vw;
	z-index: 1;
}

.fert-logo a img {
	width: 12vw;
	height: 7vh;
}
/* delivery address h3 tag */
.address-title-head {
	margin-top: 10vh;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	padding: 15px 50px;
	width: 67vw;
	background-color: #176047;
	color: white;
}

/* address container */
.address-container {
	width: 67vw;
	padding: 30px 50px;
	margin-top: 10px;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}

.address-container-label, .user-details-container {
	display: flex;
}

.select-this-address {
	padding-top: 20px;
}

.select-this-address input {
	width: 20px;
}

.address-detail-container {
	margin-left: 3vw;
}

.user-name-address {
	font-weight: bold;
	font-size: 18px;
	min-width: 10vw;
}

.address-mobile {
	margin-left: 2vw;
	font-weight: bold;
	font-size: 18px;
	color: #176047;
}
/* add new address */
.add-new-address-div {
	margin-top: 5vh;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	padding: 15px 50px;
	width: 67vw;
	background-color: #176047;
	color: white;
	display: flex;
	font-weight: bold;
	padding-top: 25px;
	cursor: pointer;
}

.add-new-address-div:hover {
	background-color: #089360;
}

.add-new-address-div p {
	font-size: 29px;
	display: inline-block;
	margin-top: -9px;
	margin-right: 1vw;
}

.user-details-container .user-title {
	background-color: rgb(220, 220, 220) !important;
	padding: 5px 10px;
	font-size: 15px;
	border-radius: 5px;
	margin-left: 2vw;
	margin-top: -3px;
	color: rgb(122, 122, 122);
	min-width: 4vw;
}

.user-details-container {
	margin-bottom: 3vh;
}

.user-order-address {
	font-size: 17px;
}

.user-order-address span {
	font-weight: bold;
}
/* deliver here button */
#deliver-here {
	background-color: #176047;
	padding: 12px 55px;
	font-size: 16px;
	border-radius: 2px;
	color: white;
	margin-top: 3vh;
	margin-left: 3vw;
	border: 2px solid #176047;
}

#deliver-here:hover {
	background-color: #ffffff;
	color: #176047;
	border: 2px solid #176047;
	font-weight: bold;
	cursor:pointer;
}

/* edit profile poppup */
.add-new-address-class-container {
	position: fixed;
	background-color: #000000a4;
	width: 100vw;
	height: 100%;
	top: 0px;
	visibility: hidden;
	z-index: 5;
	left: 0;
}

input[type="radio"] {
	-ms-transform: scale(1.5); /* IE 9 */
	-webkit-transform: scale(1.5); /* Chrome, Safari, Opera */
	transform: scale(1.5);
}

.add-new-address-class {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	position: absolute;
	top: 2%;
	left: 32%;
	caret-color: black;
	padding: 50px;
}

.add-new-address-class-container.show-new-address {
	visibility: visible;
}

.address-title {
	padding-bottom: 10px;
	text-align: center;
}

.add-address-details label {
	display: block;
	margin-bottom: 05px;
	margin-top: 15px;
	font-weight: bold;
}

.add-address-details input, .add-address-details select {
	padding: 8px 10px;
	width: 30vw;
	font-size: 16px;
	border: 1.5px solid rgb(178, 178, 178);
}

.save-cancel-container button, #exit-this-page {
	padding: 13px 0px;
	width: 96%;
	display: block;
	margin-top: 20px;
	font-size: 16px;
	background-color: rgb(1, 65, 1);
	border: none;
	color: white !important;
	border-radius: 2px;
	cursor: pointer !important;
	text-align: center;
	text-decoration: none;
}

.save-cancel-container button:hover, #exit-this-page:hover {
	background-color: rgb(2, 121, 2);
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px
		6px 6px;
}

.add-address-details input:focus, .add-address-details select:focus {
	outline: none;
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

.pincode-state-container {
	display: flex;
}

/* delivery button  display none */
/*.address-container-label .deliver-address-here {
	display: none;
}
/* delivery button  display none */
.address-container-label  .data-find-address {
	display: inline;
}

.form_container {
	width: 67vw;
	margin-top: 10px;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}

.add-new-address-class {
	background-color: white;
	padding: 30px 50px 30px 50px;
	border-radius: 5px;
	width: 36.5vw;
	height: 95vh;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}
/* delivery button  displauy none */
.address-container-label .deliver-address-here{
 display: none;

}
/* delivery button  displauy none */
.address-container-label  .data-find-address{
    display: inline;
   
}
.no_address_found img{
width:25vw;
height:48vh;
background-color:white;

}
.no_address_found{
padding:3vh 3vw;
border-radius:15px;
width:30vw;
margin: 1.5vh auto;

text-align:center;
box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;

}
.no_address_found p{
font-weight:400;
line-height:3.5vh;
font-size:20px;
margin:2vh 0;
color:rgb(152, 152, 152);

}
.add-new-address-div-address h3{
 color: white;
    background-color: rgb(9, 124, 255);
    padding:1.5vh 2vw;
     border-radius: 25px;
}
.add-new-address-div-address{
width:24vw;
cursor:pointer;
   
}
.error1, .error{
width:30vw;
margin-top:1vh;
color:red;
}
#pincode{
color:black;
}
</style>
</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>
	<main>

		<div class="address-title-head">
			<h3>DELIVERY ADDRESS</h3>
		</div>
	<%	List<DeliveryAddresses> addressList = (List<DeliveryAddresses>) request.getAttribute("LOGGED_USER_ADDRESSES");
		
			%>
		
     <%if(addressList.isEmpty()) {%>
            <div class="no_address_found">
      <img src="https://iili.io/JJ2K0Cb.png" alt="no address found">
      <p>Please create a new address to proceed with your purchase.</p>
      <div  class="add-new-address-div-address">
      <h3>ADD NEW ADDRESS</h3>
      </div>
      </div>
      <%} %>

		<div class="all-address-container">
		<%if (addressList != null && !addressList.isEmpty()) {
			for (DeliveryAddresses address : addressList) { %>
			<form class="form_container"
				action="order_created?address_id=<%=address.getId()%>" method="post">
				<div class="address-container">
					<label class="address-container-label">
						<div class="select-this-address">
							<input type="radio" class="radio-button" name="address_id"
								id="addressValue<%=address.getId()%>"
								value="<%=address.getId()%>" readonly>
						</div>
						<div>
							<div class="address-detail-container">
								<p class="user-details-container">
									<span class="user-name-address"><%=address.getPersonName()%></span>
									<span class="user-title"><%=address.getAddressTitle()%></span>
									<span class="address-mobile"><%=address.getMobileNumber()%></span>
								</p>
								<span class="user-order-address"><%=address.getStreetName()%>
									, <%=address.getCity()%> , <%=address.getState()%> - <span
									class="address-pincode"><%=address.getPincode()%></span> </span>
							</div>
							<div class="deliver-address-here">
								<button id="deliver-here" class="deliver_button"
									data-set="addressValue<%=address.getId()%>"
									onclick="return confirmOrder()">DELIVER HERE</button>
							</div>
						</div>
					</label>
				</div>
			</form>
			<%
			}
			}
			%>
		</div>

<%if (addressList != null && !addressList.isEmpty()) {%>
		<div class="add-new-address-div">
			<p>+</p>
			ADD A NEW ADDRESS
		</div>
			<%}%>
		<div>

			<div class="add-new-address-class-container">

				<form class="add-new-address-class" id="save-address"
					action="create_address" method="post">
					<div class="address-title">
						<h2>Add Your Delivery Address</h2>
					</div>
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
							name="street_name" id="street"
							placeholder="Eg: 1/117, Kumaran Street..." maxlength="40">
					</div>
					<div class="add-address-details">
						<label for="local">Address(location)</label> <input type="text"
							name="location" id="local" maxlength="30">
					</div>
					<div class="add-address-details">
						<label for="city">District/City</label> <select id="city"
							name="city">
							<option value="Select">Select</option>
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
							name="person_name" id="name">
					</div>
					<div class="pincode-state-container">
						<div class="add-address-details pincode-details zipcode">
							<label for="pincode">Pincode</label> <input type="text"
								name="pincode" id="pincode">
						</div>
						<div class="add-address-details pincode-details">
							<label for="state">State</label> <input type="text" name="state"
								value="Tamil Nadu" id="state" readonly>
						</div>
					</div>
					<div class="error1"></div>
					<div class="add-address-details">
						<label for="mobile">Mobile Number</label> <input type="text"
							name="mobile_number" id="mobile">
					</div>
						<div class="error"></div>

					<div class="save-cancel-container">
						<button type="submit" id="save-address">SAVE DELIVERY
							ADDRESS</button>
						<a href="" id="exit-this-page"> CANCEL</a>
					</div>
				</form>

			</div>


		</div>
	</main>
	
     <script src="<%=request.getContextPath()%>/javascript/search.js"></script>
	
	<script type="text/javascript">

     // get the class. which div class have to display none
     const newAddress = document.querySelector(".add-new-address-class-container")
     // add new class
       <%if(addressList != null && !addressList.isEmpty()) {%>
     document.querySelector(".add-new-address-div").addEventListener("click",() =>{
         newAddress.classList.add("show-new-address");
     });
     const mobileInput = document.getElementById("mobile");

 	const errorMessage = document.querySelector(".error");

 	mobileInput.addEventListener("input", () => {
 	    const inputValue = mobileInput.value.trim(); // remove leading/trailing whitespace
 	    const isValidInput = /^[6-9]{1}[0-9]{9}$/.test(inputValue);
 	   //   /^[6-9]\d{9}$/.test(inputValue) && !/^\d*(\d)\1{9}\d*$/.test(inputValue); // use regex to match the updated criteria
 	    if (!isValidInput || inputValue === "") {
 	 
 	      if (inputValue === "") {
 	        errorMessage.textContent = "Please enter a mobile number.";
 	      } else if (/^\d+$/.test(inputValue)) {
 	        errorMessage.textContent = "Enter a valid 10-digit mobile number.";
 	      } else {
 	        errorMessage.textContent = "Please enter digits only.";
 	      }
 	      errorMessage.style.color = "red";
 	    } else {
 	     
 	      errorMessage.textContent = "";
 	    }
 	});
 	const errorMessage1 = document.querySelector(".error1");
 	const pincodeInput = document.getElementById('pincode');

 	pincodeInput.addEventListener('input', function() {
 	  const pincode = pincodeInput.value.trim();

 	  if (pincode !== '') {
 	    const pincodeRegex = /^6\d{5}$/; // regex pattern to match a pincode starting with 6 and having a total of 6 digits

 	    if (!pincodeRegex.test(pincode)) {
 	      errorMessage1.textContent = 'Invalid pincode! Please enter a valid pincode';
 	      pincodeInput.classList.add('error');
 	    } else {
 	      errorMessage1.textContent = ''; // Clear the error message if the pincode is valid
 	      pincodeInput.classList.remove('error');
 	    }

 	    // Check the pincode range
 	    const pincodeValue = parseInt(pincode, 10);
 	    if (pincodeValue < 600001 || pincodeValue > 643253) {
 	      errorMessage1.textContent = 'Invalid pincode! Please enter a valid pincode';
 	      pincodeInput.classList.add('error');
 	    }
 	  }
 	});

 	
 	

     <%}%>
  <%if(addressList.isEmpty()){%>
     document.querySelector(".add-new-address-div-address").addEventListener("click",() =>{
         newAddress.classList.add("show-new-address");
     });
     const mobileInput = document.getElementById("mobile");
 
 	const errorMessage = document.querySelector(".error");

 	mobileInput.addEventListener("input", () => {
 	    const inputValue = mobileInput.value.trim(); // remove leading/trailing whitespace
 	    const isValidInput = /^[6-9]{1}[0-9]{9}$/.test(inputValue);
 	   //   /^[6-9]\d{9}$/.test(inputValue) && !/^\d*(\d)\1{9}\d*$/.test(inputValue); // use regex to match the updated criteria
 	    if (!isValidInput || inputValue === "") {
 	    
 	      if (inputValue === "") {
 	        errorMessage.textContent = "Please enter a mobile number.";
 	      } else if (/^\d+$/.test(inputValue)) {
 	        errorMessage.textContent = "Enter a valid 10-digit mobile number.";
 	      } else {
 	        errorMessage.textContent = "Please enter digits only.";
 	      }
 	      errorMessage.style.color = "red";
 	    } else {
 	     
 	      errorMessage.textContent = "";
 	    }
 	});
 	const errorMessage1 = document.querySelector(".error1");
 	const pincodeInput = document.getElementById('pincode');

 	pincodeInput.addEventListener('input', function() {
 	  const pincode = pincodeInput.value.trim();

 	  if (pincode !== '') {
 	    const pincodeRegex = /^6\d{5}$/; // regex pattern to match a pincode starting with 6 and having a total of 6 digits

 	    if (!pincodeRegex.test(pincode)) {
 	      errorMessage1.textContent = 'Invalid pincode! Please enter a valid pincode';
 	      pincodeInput.classList.add('error');
 	    } else {
 	      errorMessage1.textContent = ''; // Clear the error message if the pincode is valid
 	      pincodeInput.classList.remove('error');
 	    }

 	    // Check the pincode range
 	    const pincodeValue = parseInt(pincode, 10);
 	    if (pincodeValue < 600001 || pincodeValue > 643253) {
 	      errorMessage1.textContent = 'Invalid pincode! Please enter a valid pincode';
 	      pincodeInput.classList.add('error');
 	    }
 	  }
 	});

 	
 	
 <%}%>

     document.getElementById("exit-this-page").addEventListener("click",()=>{
         newAddress.classList.remove("show-new-address");
     })
     
     
function confirmOrder() {
    var confirmation = confirm("Are you sure you want to confirm the order?");
    
    if (confirmation === true) {
        // If the user clicks OK, submit the form
        return true;
    } else {
        // If the user clicks Cancel or closes the dialog, do nothing
        return false;
    }
}
     document.addEventListener('DOMContentLoaded', () => {
    	  const radioButtons = document.querySelectorAll('.radio-button');

    	  radioButtons.forEach(radioButton => {
    	    radioButton.addEventListener('click', () => {
    	      const radioButtonId = radioButton.getAttribute('id');
    	      const deliverHere = document.querySelector('[data-set="' + radioButtonId + '"]');
    	      
    	      if (deliverHere) {
    	        // Deselect all radio buttons first
    	        radioButtons.forEach(rb => {
    	          if (rb !== radioButton) {
    	            rb.checked = false;
    	            const rbId = rb.getAttribute('id');
    	            const rbDeliverHere = document.querySelector('[data-set="' + rbId + '"]');
    	            if (rbDeliverHere) {
    	              rbDeliverHere.parentElement.classList.remove('data-find-address');
    	            }
    	          }
    	        });

    	        // Select the clicked radio button
    	        deliverHere.parentElement.classList.add('data-find-address');
    	        radioButton.checked = true;
    	      }
    	    });
    	  });
    	});


     document.addEventListener("DOMContentLoaded", function() {

    	    const mobileInput = document.getElementById("mobile");
    	    const pincodeInput = document.getElementById("pincode");
         const form = document.getElementById("save-address");
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
             
             // Perform your validation checks here
             const mobileValue = mobileInput.value.trim();
             const pincodeValue = pincodeInput.value.trim();
             const mobileRegex = /^[6-9]{1}[0-9]{9}$/;
             const pincodeRegex = /^6\d{5}$/;

             if (!mobileRegex.test(mobileValue) || !pincodeRegex.test(pincodeValue)) {
                 // Prevent the form from submitting
                 event.preventDefault();

                 // Show error messages or handle validation errors here
                 const errorMessage = document.querySelector(".error");
                 const errorMessage1 = document.querySelector(".error1");

                 if (!mobileRegex.test(mobileValue) || mobileValue === "") {
                     errorMessage.textContent = "Invalid mobile number.";
                     errorMessage.style.color = "red";
                 } else {
                     errorMessage.textContent = "";
                 }

                 if (!pincodeRegex.test(pincodeValue) || pincodeValue === "") {
                     errorMessage1.textContent = "Invalid pincode.";
                     errorMessage1.style.color = "red";
                 } else {
                     errorMessage1.textContent = "";
                 }

                 return false; // Prevent the form from submitting
             }

             // If validation passes, the form will submit as usual
    
         });
     });
  
     </script>
     
</body>
</html>