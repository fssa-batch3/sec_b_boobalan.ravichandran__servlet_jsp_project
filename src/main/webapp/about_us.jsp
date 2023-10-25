<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Neuton:ital,wght@0,200;0,300;0,400;1,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/about_us.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<title>About Us</title>
<style>
.video-container {
    position: relative;
    width: 100%; /* Adjust the width as needed */
    max-width: 800px; /* Set a maximum width if desired */
    margin: 0 auto;
    overflow: hidden;
    height:37vh;
    margin-top:5vh;
    text-align:center;
}
.video-container h2{
margin-bottom:2vh;

}
iframe {
    width: 100%;
    height: 100%;
    border: 0;
}

.zoom-button {
    position: absolute;
    bottom: 10px;
    right: 10px;
    background-color: #3498db;
    color: #fff;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

.zoom-button:hover {
    background-color: #2980b9;
}

</style>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<main>
		<div class="about">
			<div class="about_us">
				<div>
					<h1>WHO WE ARE</h1>
					<p>Fert Agri Boomi is a Small platform that sell all the
						fertilizers required by farmers on this website. Through this,
						farmers can easily buy the fertilizers they need.</p>
				</div>
			</div>
			<div class="about_detail1">
				<div class="about_content1">
					<h2>A Step Towards Empowering The Agricultural Industry</h2>
					<p>Fert Agri Boomi is the One stop solution for one&rsquo;s
						end-to-end purchasing needs. With the motto of "Let&rsquo;s unite
						to serve" we strive to move forward together, by bringing the
						whole agricultural industry on a common platform. Fert Agri Boomi
						helps farmers navigate easily on the platform to make educated
						choices for their Agriculture Input needs. Being a Brand neutral
						company, Farmers can purchase quality Fertilizers.</p>

				</div>
				<div class="about_img">
					<img src="./assets/images/about us/abt1.jpg" alt="about1">
				</div>
			</div>
			<div class="about_detail2">
				<div class="about_img1">
					<img src="./assets/images/about us/abt2.webp" alt="about2">
				</div>
				<div class="about_content2">
					<h2>What do we do?</h2>
					<p>We help farmers meet their agricultural needs. Fert Agri
						Boomi has an eCommerce Application and Website which helps farmers
						navigate easily on the platform to order Agriculture Input
						products.</p>
				</div>
			</div>

			<div class="about_detail3">
				<div class="about_content3">
					<p>Higher profitability for farmers means more investments in
						their production capabilities, higher employment, and more
						sustainable farming. Fert Agri Boomi Marketplace enables thousands
						of farmers across several States to create more distribution
						channels for their products, gain direct access to thousands of
						businesses and reduce their dependence on intermediaries with no
						value.</p>
				</div>
				<div class="about_img2">
					<img src="./assets/images/about us/abt3.jpg" alt="about3">
				</div>
			</div>
			<div class="about_detail4">
				<div class="about_img3">
					<img src="./assets/images/about us/abt4.jpg" alt="about4">
				</div>
				<div class="about_content4">
					<h2>Our Vision</h2>
					<p>&ldquo;To be a nationwide provider of High-Quality Farming
						Inputs, and Agriculture Support Services to farmers at their
						doorstep, to enable a sustainable farming future.&rdquo;</p>
				</div>
			</div>
			<div class="about_detail5">
				<div class="about_content5">
					<h2>Our Mission</h2>
					<p>&ldquo;Establish an e-commerce platform and a delivery
						framework to cater to on-demand Farming Inputs & Services. Advance
						Farmers to a new era of Digital Transformation, by providing a
						wide range of Farming Input advice & options right on their
						gadgets.&rdquo;</p>
				</div>
				<div class="about_img4">
					<img src="./assets/images/about us/abt5.webp" alt="about5">
				</div>
			</div>

			<div class="video-container">
			  <h2>Getting Started with Fert Agri Boomi: Registration and Login Guide</h2>
				<iframe
					src="https://drive.google.com/file/d/16Rd-6bvfNaDcwxLzC2F8wRSdezLObDdy/preview"></iframe>
				<div class="zoom-button" onclick="toggleFullscreen(this)">Zoom</div>
			</div>
			<div class="video-container">
			<h2>How can you place an order for products on Fert Agri Boomi?</h2>
				<iframe
					src="https://drive.google.com/file/d/1S2nFzOvjt8zIR_F6bJA7aSFXAlK78DTZ/preview"></iframe>
				<div class="zoom-button" onclick="toggleFullscreen(this)">Zoom</div>
			</div>

		</div>

	</main>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script type="text/javascript">
	function toggleFullscreen(button) {
	    const iframe = button.previousElementSibling;
	    if (!document.fullscreenElement) {
	        if (iframe.requestFullscreen) {
	            iframe.requestFullscreen();
	        } else if (iframe.mozRequestFullScreen) { /* Firefox */
	            iframe.mozRequestFullScreen();
	        } else if (iframe.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
	            iframe.webkitRequestFullscreen();
	        } else if (iframe.msRequestFullscreen) { /* IE/Edge */
	            iframe.msRequestFullscreen();
	        }
	    } else {
	        if (document.exitFullscreen) {
	            document.exitFullscreen();
	        } else if (document.mozCancelFullScreen) {
	            document.mozCancelFullScreen();
	        } else if (document.webkitExitFullscreen) {
	            document.webkitExitFullscreen();
	        } else if (document.msExitFullscreen) {
	            document.msExitFullscreen();
	        }
	    }
	}

	</script>
</body>
</html>