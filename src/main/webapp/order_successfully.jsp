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
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<title>Ordered Successfully</title>
<style type="text/css">
* {
  font-family: 'Neuton', serif;
    letter-spacing: .3px;
    word-spacing: 3px;
}

main {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px 50px 100px 50px;
}

.thank h1 {
	font-size: 45px;
	padding-left: 70px;
	color: rgb(221, 193, 13);
	font-style: italic;
	margin-bottom: 20px;
}

.thank {
	/* box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px; */
	width: 650px;
	padding-top: 50px;
	padding-bottom: 50px;
	display: inline-block;
}

.thank img {
	width: 500px;
	height: 370px;
	margin-left: 5vw;
}

.thank h3, .thank h2 {
	width: 1100px;
	font-size: 20px;
}

.thank h3 {
	padding-left: 150px;
	padding-bottom: 10px;
	color: rgb(5, 85, 66);
}

.thank h2 {
	padding-left: 200px;
	color: rgb(22, 42, 6);
}
.thank_content{
margin-top:-5vh;
}
</style>
</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>
	


	<main>
		<div class="thank">
			<img src="https://iili.io/J9UjNUv.gif" alt="tickmark   ">
			<div class="thank_content">
			<h1>Thank you for your order</h1>
			<h3>Your support of our small business</h3>
			<h2>is (very much!) appreciated.</h2>
			</div>
		</div>
		<div>
			<img src="https://iili.io/J9UhgFj.gif" alt="delivery gif">
		</div>
		
		
		<%
	String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
	%>
	
	</main>
		<jsp:include page="/footer.jsp"></jsp:include>
			<script src="<%=request.getContextPath()%>/javascript/search.js"> </script>
		
	<script>
	 // removing the data associated with the "addToCartItem" key

	  const logedUser = '<%=loggedUserUniqueEmail %>';
	  let addToCartItem = JSON.parse(localStorage.getItem("addToCartItem")) || [];

	  // Filter out the items that match the logedUser details
	  addToCartItem = addToCartItem.filter(
	    (item) => item.userUniqueId !== logedUser
	  );


	  // Update the addToCartItem array in local storage with the new array
	  localStorage.setItem("addToCartItem", JSON.stringify(addToCartItem));
 
	 
	    </script>
</body>
</html>