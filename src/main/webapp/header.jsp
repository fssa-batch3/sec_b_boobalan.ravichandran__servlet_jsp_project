<header>
	<div class="user_header">
		<div class="header">
			<ul class="seller">
				<li></li>
			</ul>
		</div>
		<header id="nav_bars_head">

			<!-- --------------menu bar end -------------------- -->

			<div class="head">
				<a href="<%= request.getContextPath()%>/index">
					<div class="fert_logo">
						<img src="https://iili.io/Hyihp7S.md.png"
							alt="logo for fert agri boomi" class="header__logo" />
					</div>
				</a>

				<div class="wrapperer">
					<div class="search-input">
						<div class="search_bar">
							<button class="sear_btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
							<input class="input0" type="text" placeholder="Search....">
						</div>
						<div class="autocom-box"></div>
					</div>

					<!-- search bar end -->
					<div class="navbar_links">
						<ul class="hero">
							<div class="all_nave_links">
								<li class="hero_list11"><a
									href="${root}/pages/user/wishlist.html"><img
										src="https://iili.io/HyiOB24.th.png" id="wish">
										<p id="wish_name">Wishlist</p> </a></li>
								<li class="hero_list11"><a
									href="${root}/pages/user/user_order.html"> <img
										src="https://iili.io/HyiOUnn.md.png" id="order_del">
										<p>Orders</p></a></li>
								<li class="hero_list11" id="cart_icon"><a
									href="${root}/pages/user/add_cart.html"><img
										src="https://iili.io/HyiOQuS.md.png" id="cart">
										<p id="cart_name">Cart</p></a></li>

								<div class="login-container">
									<a href="<%= request.getContextPath()%>/login"><button>Login</button></a>
								</div>

							</div>

						</ul>
					</div>
				</div>
		</header>
		<div class="nav">
			<a href="<%= request.getContextPath()%>/index"><button class="btn1">HOME</button></a>
			<div class="dropdown">
				<button class="dropbtn">BRANDS</button>
				<div class="dropdown-content">
					<a href="<%= request.getContextPath()%>/products?category_id=1">DHANUKA</a>
					<a href="<%= request.getContextPath()%>/products?category_id=2">DOW AGRO SCIENCE</a> <a
						href="<%= request.getContextPath()%>/products?category_id=3">TATA RALLIS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=4">ADAMA</a> <a
						href="<%= request.getContextPath()%>/products?category_id=5">BAYER</a> <a
						href="<%= request.getContextPath()%>/products?category_id=6">ARIES AGRO</a> <a
						href="<%= request.getContextPath()%>/products?category_id=7">INFOIL</a> <a
						href="<%= request.getContextPath()%>/products?category_id=8">RINUJA</a>
				</div>
			</div>
			<div class="dropdown1">
				<button class="dropbtn1">CROP PROTECTION</button>
				<div class="dropdown1-content">
					<a href="<%= request.getContextPath()%>/products?category_id=9">BIO INSECTICIDES</a> <a
						href="<%= request.getContextPath()%>/products?category_id=10">BIO FUNGICIDES</a> <a
						href="<%= request.getContextPath()%>/products?category_id=11">BIO NEMATICIDES</a> <a
						href="<%= request.getContextPath()%>/products?category_id=12">BIO VIRCIDES</a>
				</div>
			</div>
			<div class="dropdown2">
				<button class="dropbtn2">CROP NUTRITION</button>
				<div class="dropdown2-content">
					<a href="<%= request.getContextPath()%>/products?category_id=13">MAJOR NURIENTS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=14">SECONDARY NURIENTS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=15">GROWTH PROMOTERS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=16">GROWTH RETARDANTS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=17">ORGANIC FERTILIZERS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=18">BIO FERTILIZERS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=19">ANTI STRESSING AGENTS</a> <a
						href="<%= request.getContextPath()%>/products?category_id=20">MICRO NURIENTS</a>
				</div>
			</div>
		</div>
	</div>
</header>