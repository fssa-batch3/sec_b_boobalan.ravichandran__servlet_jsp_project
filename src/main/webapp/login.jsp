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
<script
	src="
		https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js
		"></script>
<title>User Login</title>
<style>
* {
	font-family: 'Lora', serif;
}

body {
	font-family: Arial, sans-serif;
}

.box {
	height: 93vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Lora', serif;
	margin-left: 5vw;
}

* {
	font-family: 'Lora', serif;
}

.form {
	background-color: white;
	width: 30vw;
	min-height: 50vh;
	padding: 30px;
	border-radius: 10px;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.form h1 {
	font-weight: 600;
	margin-top: 10px;
	margin-bottom: 40px;
	font-size: 26px;
	text-align: center;
}

.form-group {
	height: 35px;
	margin-bottom: 40px;
	margin-top: 20px;
	position: relative;
}

.form-control {
	position: absolute;
	top: 0;
	left: 0;
	width: 92%;
	height: 100%;
	background: none;
	border: 1px solid gray;
	outline: none;
	border-radius: 3px;
	padding: 5px 16px;
	z-index: 1;
	font-size: 17px;
}

.form-label {
	position: absolute;
	top: 12px;
	left: 13px;
	font-size: 16px;
	color: hwb(0 25% 75%);
	background-color: rgb(255, 255, 255);
	padding: 0 6px;
	transition: .2s;
}

.form-control:focus+.form-label {
	top: -9px;
	z-index: 5;
	color: #1866c9;
	font-weight: 500;
}

.form-control:focus {
	box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3)
		0px 1px 3px -1px;
}

.form-control:not(:focus):valid+label {
	top: -9px;
	z-index: 5;
}

.form-group.invalid .form-control {
	border: 2px solid red;
}

.form-group.valid .form-control {
	border: 2px solid green;
}

.btn {
	display: flex;
	top: 0;
	justify-content: space-between;
	align-items: center;
}

.btn a {
	color: rgb(7, 7, 68);
	font-size: 19px;
	font-weight: 600;
	text-decoration: none;
}

.btn button {
	background-color: rgb(7, 113, 67);
	padding: 1.5vh 5vw;
	border: none;
	border-radius: 3px;
	font-size: 18px;
	margin-left: 16vw;
	color: white;
}

.showLabel {
	font-size: 17px;
}

.btn button:hover {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	background-color: rgba(10, 160, 95, 0.904);
}

.singup {
	font-size: 20px;
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

.logo_img {
	width: 20vw;
	height: 12.5vh;
	margin-left: 3vw;
}

.error_div {
	margin-top: -15vh;
	text-align: center;
	margin-left: 5vw;
}

.error_div p {
	color: rgb(255, 14, 14);
	font-size: 19px;
}

.login_container {
	display: flex;
	width: 100%;
	height: 100%;
}

.login_logo img {
	width: 45vw;
	height: 80vh;
	margin-top: 5vh;
}
</style>
</head>
<body>
	<div class="login_container">
		<div class="login_logo">
			<img src="https://iili.io/J97TJJs.png" alt="login icon">
		</div>
		<div>
			<div class="box">
				<form action="login" class="form" method="post">
					<a href="index"> <img src="https://iili.io/Hyihp7S.md.png"
						alt="logo for fert agri boomi" class="logo_img" /></a>
					<h1>Sign in</h1>
					<div class="form-group">
						<input type="text" id="email" class="form-control" name="email"
							value="rboomibaln459@gmail.com" required autofocus> <label
							for="mobile" class="form-label">Email Address</label>
					</div>

					<div class="form-group form-group3">
						<input type="password" id="txtPassword" name="password"
							class="form-control" value="Abcd@1234" required> <label
							for="txtPassword" class="form-label">Enter Your Password</label>
					</div>

					<div>
						<div class="form-group">
							<label class="showLabel"> <input type="checkbox"
								id="show"> Show Password
							</label>
						</div>
						<div class="btn">

							<button type="submit" id="userLoginDel">Login</button>
						</div>
						<h4 class="singup">
							New to FAB?<a href="user/register">Create an account</a>
						</h4>
					</div>
				</form>
			</div>

			<%
			String err = request.getParameter("error");
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
		</div>
	</div>
	<script>
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