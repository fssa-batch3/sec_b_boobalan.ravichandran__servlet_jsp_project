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
<link rel="stylesheet" href="../css/create_user.css">
<script src="
		https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
		"></script>
<title>create account</title>
<style>
.singup {
	font-size: 20px;
	margin-top:6vh;
	
}
.form {
	
	width:32vw;
	min-height: 350px;
	
}

.singup a {
	font-size: 18px;
	text-decoration: none;
	color: #08499e;
	padding-left: 5px;
}

.singup a:hover {
	color: rgb(255, 0, 93);
}
.register-container{
display:flex;
}
.sign-up img{
width:50vw;
height:80vh;
margin-top:6vh;
}

</style>
</head>
<body>

<% User user = (User)request.getAttribute("USER_DETAILS"); %>
<div class="register-container">
<div class="sign-up">
 <img src="https://iili.io/JJYU7Pn.png" alt="signup" >
</div>
<div class="box">
    <form class="form" action="create" method="post">
        <a href="../index"> <img src="https://iili.io/Hyihp7S.md.png"
            alt="logo for fert agri boomi" class="logo_img" /></a>
        <h1>Create Your Account</h1>
        <div class="form-group">
            <input type="text" class="form-control" value="<%= (user != null) ? user.getPhoneNumber() : "" %>"
                id="mobile" required="true" name="phone"
                title="Enter 10 number only" maxlength="10" autofocus>
            <label for="mobile" class="form-label"> Mobile Number </label>
        </div>

        <div class="form-group form-group1">
            <input type="email" class="form-control" value="<%= (user != null) ? user.getEmail() : "" %>"
                id="email" required name="email">
            <label for="email" class="form-label">Email address</label>
        </div>

        <div class="form-group form-group2">
            <input type="text" class="form-control" id="full_name"
                value="<%= (user != null) ? user.getName() : "" %>" required="true" name="name">
            <label for="full_name" class="form-label">Enter Your Name</label>
        </div>

        <div class="form-group form-group3">
            <input type="password" class="form-control" value="<%= (user != null) ? user.getPassword() : "" %>"
                id="txtPassword" name="password" required="true">
            <label for="txtPassword" class="form-label">Set Password</label>
        </div>
       <div class="password_valid">
				<label class="create_lable"> <input type="checkbox"
					id="chkUppercase" disabled> Have at 1 Uppercase letter
				</label>
			</div>
			<div class="password_valid">
				<label class="create_lable"> <input type="checkbox"
					id="chkLowercase" disabled> Have at 1 Lowercase letter
				</label>
			</div>
			<div class="password_valid">
				<label class="create_lable"> <input type="checkbox"
					id="chkSpecialChar" disabled> Have at 1 Special character
				</label>
			</div>
			<div class="password_valid">
				<label class="create_lable"> <input type="checkbox"
					id="chkNumber" disabled> Have at 1 Number
				</label>
			</div>
			<div class="password_valid">
				<label class="create_lable"> <input type="checkbox"
					id="chkMinLength" disabled> Have at Minimum 8 characters
				</label>
			</div>

        <div class="form-group">
            <label class="showLabel"> <input type="checkbox" id="show">
                Show Password
            </label>
        </div>
        
     
        <div class="btn1">
            <button type="submit" id="userSignUp">Register</button>
        </div>
        
           <h4 class="singup">
							Already Registered In FAB?<a href="../login">Login</a>
						</h4>
    </form>
</div>


</div>

	<%
	String err = (String) request.getAttribute("ERROR");
	%>
	<%
	if (err != null) {
	%>
	<script>
					    // Display a Swal alert when the 'err' parameter is not null
					    Swal.fire({
					        icon: 'error',
					        title: 'Error',
					        text: '<%=err%>'
					    });
					</script>
	<%
	}
	%>

	<script>
        const passwordInput = document.getElementById("txtPassword");

        const uppercaseCheckbox = document.getElementById("chkUppercase");
        const lowercaseCheckbox = document.getElementById("chkLowercase");
        const specialCharCheckbox = document.getElementById("chkSpecialChar");
        const numberCheckbox = document.getElementById("chkNumber");
        const minLengthCheckbox = document.getElementById("chkMinLength");

        passwordInput.addEventListener("input", () => {
            const passwordValue = passwordInput.value;

            // Check for uppercase letter
            const hasUppercase = /[A-Z]/.test(passwordValue);
            uppercaseCheckbox.checked = hasUppercase;

            // Check for lowercase letter
            const hasLowercase = /[a-z]/.test(passwordValue);
            lowercaseCheckbox.checked = hasLowercase;

            // Check for special character
            const hasSpecialChar = /[!@#$%^&*_=+-]/.test(passwordValue);
            specialCharCheckbox.checked = hasSpecialChar;

            // Check for number
            const hasNumber = /\d/.test(passwordValue);
            numberCheckbox.checked = hasNumber;

            // Check for minimum length
            const hasMinLength = passwordValue.length >= 8;
            minLengthCheckbox.checked = hasMinLength;
        });
        
        /* password show */
        const Password = document.querySelector("#txtPassword");
		const Checkbox = document.querySelector("#show");

		Checkbox.addEventListener("click", () => {
  		const type =
   			 Password.getAttribute("type") === "password" ? "text" : "password";
  				Password.setAttribute("type", type);
});

        </script>
</body>
</html>