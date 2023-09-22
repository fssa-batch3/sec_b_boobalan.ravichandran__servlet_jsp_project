
<style>
.mobile_footer {
	display: none;
}
</style>
<footer>

	<div class="footer1">
		<div class="img101">
			<a href="<%=request.getContextPath()%>/index"> <img
				src="<%=request.getContextPath()%>/assets/images/Fert agri.png"
				alt="logo">
			</a>
		</div>
		<div class="about111">
			<div class="quick">
				<h2>QUICK LINKS</h2>
				<p>
					<a href="<%=request.getContextPath()%>/about_us">ABOUT US</a>
				</p>
				<%
				String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
				%>

				<%
				if (loggedUserUniqueEmail != null) {
				%>
				<p>
					<a href="<%=request.getContextPath()%>/wishlist">WISHLIST</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/add_to_cart">CART</a>
				</p>
				<%
				}
				%>

				<p>
					<a href="<%=request.getContextPath()%>/index">HOME</a>
				</p>
			</div>
			<div class="quick">
				<h2>BRANDS</h2>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=1">DHANUKA</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=2">DOW
						AGRO SCIENCE</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=6">INFOIL</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=3">
						TATA RALLIS</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=4">ADAMA</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=5">BAYER</a>
				</p>
			</div>
			<div class="quick">
				<h2>CROP PROTECTION</h2>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=9">BIO
						INSECTICIDES</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=10">BIO
						FUNGICIDES</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=11">BIO
						NEMATICIDES</a>
				</p>
				<p>
					<a href="<%=request.getContextPath()%>/products?category_id=12">
						BIO VIRCIDES</a>
				</p>
			</div>
			<div class="quick">
				<h2>CONTACT US</h2>
				<div class="rboomi">
					<h3>EMAIL</h3>
					<p>rboomibalan459@gmail.com</p>
				</div>
				<div class="rboomi">
					<h3>PHONE</h3>
					<p>+919629223356</p>
				</div>
				<div class="rboomi">
					<h3>ADDRESS</h3>
					<p>1/115, Thirumurugan street, Mandumandram Nagar,
						Tiruchippalli-620021</p>
				</div>
			</div>
		</div>
		<div class="bottom">
			<div class="cont">
				<p>FOLLOW US</p>
			</div>
			<div class="social">
				<a href="https://www.instagram.com/rp0803/?igshid=YmMyMTA2M2Y%3D">
					<img
					src="<%=request.getContextPath()%>/assets/images/instagram.png"
					alt="instagram">
				</a> <a href="https://www.youtube.com/channel/UCufA2FcZ-8DSsbCog424g_g">
					<img src="<%=request.getContextPath()%>/assets/images/youtube.webp"
					alt="youtube">
				</a> <a
					href="https://myaccount.google.com/?utm_source=OGB&tab=rk&utm_medium=app">
					<img src="<%=request.getContextPath()%>/assets/images/mail.jpg"
					alt="email">
				</a> <a href="https://twitter.com/agrigoi?lang=en"> <img
					src="<%=request.getContextPath()%>/assets/images/twiter.png"
					alt="twitter">
				</a> <a
					href="https://www.facebook.com/people/Agriculture/100068310005265/">
					<img src="<%=request.getContextPath()%>/assets/images/facebook.png"
					alt="facebook">
				</a> <a href="#"> <img
					src="<%=request.getContextPath()%>/assets/images/whatsapp.webp"
					alt="whatsapp">
				</a>

			</div>
		</div>
	</div>
</footer>
<div class="mobile_footer">
	<div class="mobile_aboutus">
		<a href="">Home</a> <a href="pages/user/about_us.html">
			<p>About Us</p>
		</a>
		<p>(+91)9629223356</p>

	</div>
	<div class="copyright">
		<p>Copyright © 2021 - 2023 FAB - Designed By</p>
		<span>Boobalan-R</span>
	</div>
	<div class="mobile_social">
		<p>Contact Us</p>
		<div>
			<a href="https://twitter.com/agrigoi?lang=en"> <img
				src="<%=request.getContextPath()%>/assets/images/twiter.png"
				alt="twitter">
			</a> <a
				href="https://www.facebook.com/people/Agriculture/100068310005265/">
				<img src="<%=request.getContextPath()%>/assets/images/facebook.png"
				alt="facebook">
			</a>
		</div>
	</div>
</div>
