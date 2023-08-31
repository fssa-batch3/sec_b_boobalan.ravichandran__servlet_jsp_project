<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<style>
* {
	font-family: 'Lora', serif;
}

.box {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Lora', serif;
}

* {
	font-family: 'Lora', serif;
}

.form {
	background-color: white;
	width: 400px;
	min-height: 400px;
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
	background-color: green;
	padding: 10px 35px;
	border: none;
	border-radius: 3px;
	font-size: 18px;
	margin-left: 20vw;
		color: white;
}


.showLabel {
	font-size: 17px;
}

.btn button:hover {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	background-color: rgb(3, 155, 3);
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
</style>
</head>
<body>
	<div class="box">
		<form action="login" class="form" method="post">

			<h1>User Login</h1>
			<div class="form-group">
				<input type="text" id="email" class="form-control" name="email" required>
				<label for="mobile" class="form-label">Email Address</label>
			</div>
			
			<div class="form-group form-group3">
				<input type="password" id="txtPassword" name="password" class="form-control"
					required> <label for="txtPassword" class="form-label">Enter
					Your Password</label>
			</div>

			<div>
				<div class="btn">


					<button type ="submit" id="userLoginDel">
						Login
					</button>
				</div>
				<h4 class="singup">
					New to FAB?<a href="../user/user_signup.html">Create an account</a>
				</h4>
			</div>
		</form>
	</div>
</body>
</html>