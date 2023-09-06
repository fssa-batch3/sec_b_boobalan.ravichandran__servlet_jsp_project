<header>
	<header>
		<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lora', serif;
}

body {
	caret-color: transparent;
}

:root {
	--nav-backgroung: #176047;
	--nav-head-color: rgb(255, 255, 255);
}

.header {
	background-color: var(--nav-backgroung);
	padding: 15px 100px;
}

.hero_list, .hero_list1, .hero_list11 {
	list-style: none;
}

.hero_list a {
	text-decoration: none;
	padding: 8px 10px 8px 10px;
	border-radius: 5px;
	color: black;
	font-weight: bold;
	background-color: #e4fff6;
}

.hero_list a:hover {
	color: #dbfcf0;
	background-color: #104432;
	box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px
		2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
	transition: .5s;
	border: 1px solid white;
}

.header__logo {
	width: 13.5vw;
	height: 8vh;
	padding: 8px 5px 5px 40px;
}

.head {
	display: flex;
	align-items: center;
	width: 1450px;
}

/* search bar start  */
.search_bar {
	width: 27vw;
	height: 40px;
	position: relative;
	margin: 4vh 6vw 0vh 6vw;
	caret-color: black;
}

.search-input .search_bar .input0 {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: absolute;
	outline: none;
	padding: 10px 80px 10px 20px;
	font-size: 16px;
	border: 1.5px solid rgb(24, 8, 115);
	box-sizing: border-box;
	border-radius: 50px;
}

.search_bar .sear_btn {
	position: absolute;
	right: 0;
	top: 0;
	z-index: 1;
	height: 100%;
	width: 60px;
	background-color: orangered;
	color: white;
	border: none;
	border-radius: 0 50px 50px 0;
	font-size: 18px;
	box-sizing: border-box;
	cursor: pointer;
}

.search_bar .input0:focus {
	border: 1.5px solid rgb(4, 93, 50);

	/* box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px; */
}

.search_bar .sear_btn:hover {
	background-color: rgb(4, 4, 77);
}
/* search bar end */
/* head class start */

/* wrapperer -=------------------ */
/* .wrapperer{
  
} */
.hero {
	display: flex;
	top: 0;
	left: 0;
	width: 35vw;
	height: 100%;
	align-items: center;
	margin: auto;
	justify-content: space-around;
}

.hero .hero_list1 a {
	text-decoration: none;
	color: rgb(255, 255, 255);
	font-weight: bold;
	background-color: orangered;
	padding: 10px 60px;
	border-radius: 5px;
}

.hero .hero_list11 a {
	text-decoration: none;
	color: rgb(11, 2, 51);
	font-weight: bold;
	display: flex;
	margin-left: 40px;
}

.hero .hero_list11 img {
	width: 35px;
	height: 35px;
}

.hero .all_nave_links .hero_list11 a p {
	margin-top: 10px;
	margin-left: 3px;
}

.fa-heart {
	padding: 5px;
}

.hero .hero_list1 a:hover {
	color: rgb(255, 255, 255);
	background-color: rgb(4, 4, 77);
	transition: .5s;
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px
		6px 6px;
}

.hero .hero_list11 a:hover {
	color: rgb(227, 67, 9);
}

.seller {
	color: transparent
}

#span_count {
	background-color: rgb(255, 136, 0);
	padding: 4px 16px 20px 10px;
	border-radius: 50px;
	border: 2px solid white;
	position: relative;
	color: white;
	font-size: 13px;
	width: 16px;
	height: 25px;
	margin-left: -18px;
	margin-top: -10px;
}

#wish_span_count {
	background-color: rgb(4, 18, 102);
	padding: 4px 16px 20px 10px;
	border-radius: 50px;
	position: relative;
	border: 2px solid white;
	color: white;
	font-size: 13px;
	width: 16px;
	height: 25px;
	margin-left: -18px;
	margin-top: -10px;
}
/* #wish_name,#cart_name{
  margin-left: -5px;
} */
#order_del {
	width: 38px;
	height: 42px;
	margin-top: -2px;
}

.all_nave_links {
	display: flex;
	margin-right: 2vw;
}

.navbar_links {
	margin-left: 42.5vw;
	display: flex;
	margin-top: -35px;
	margin-bottom: 20px;
}

#profile_icon {
	margin-left: 200px;
}
/* head class end */

/* ------------dropdown content start------------- */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropbtn {
	cursor: pointer;
	background-color: var(--nav-backgroung);
	color: var(--nav-head-color);
	padding: 16px;
	font-size: 16px;
	border: none;
	font-weight: bold;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #e8feda;
	width: 210px;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
	z-index: 1;
}

.dropdown:hover .dropbtn {
	background-color: #ffffff;
	color: black
}

.dropdown1-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown1:hover .dropdown1-content {
	display: block;
}

.dropbtn1 {
	cursor: pointer;
	background-color: var(--nav-backgroung);
	color: var(--nav-head-color);
	padding: 16px;
	font-size: 16px;
	border: none;
	font-weight: bold;
}

.dropdown1 {
	position: relative;
	display: inline-block;
}

.dropdown1-content {
	display: none;
	position: absolute;
	background-color: #e8feda;
	width: 200px;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
	z-index: 1;
}

.dropdown1:hover .dropbtn1 {
	background-color: #ffffff;
	color: black
}

.dropdown2-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown2-content :hover, .dropdown1-content :hover, .dropdown-content :hover
	{
	font-size: 17px;
	font-weight: bold;
	color: rgb(157, 4, 4);
}

.dropdown2:hover .dropdown2-content {
	display: block;
}

.dropbtn2 {
	cursor: pointer;
	background-color: var(--nav-backgroung);
	color: var(--nav-head-color);
	padding: 16px;
	font-size: 16px;
	border: none;
	font-weight: bold;
}

.btn1 {
	cursor: pointer;
	background-color: var(--nav-backgroung);
	color: var(--nav-head-color);
	padding: 16px;
	font-size: 16px;
	border: none;
	margin-left: 20px;
	font-weight: bold;
}

.dropdown2 {
	position: relative;
	display: inline-block;
}

.dropdown2-content {
	display: none;
	position: absolute;
	background-color: #e8feda;
	width: 250px;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
	z-index: 1;
}

.dropdown2:hover .dropbtn2 {
	background-color: #ffffff;
	color: black
}

.nav {
	background-color: var(--nav-backgroung);
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-top: 1vh;
}

#profile_icon {
	margin-left: 3vw;
}

.login-container {
	margin-left: 4vw;
}

.login-container a button {
	cursor: pointer;
	padding: 1.3vh 3vw;;
	background-color: #176047;
	border: none;
	border-radius: 5px;
	color: white;
}

.login-container a button:hover {
	background-color: #50b892;
	box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px,
		rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
}

.logout {
	cursor: pointer;
	padding: 1vh 2.2vw;;
	background-color: #176047;
	border: none;
	border-radius: 5px;
	color: white;
	text-decoration: none;
	margin-left: 3vw;
}

.logout:hover {
	background-color: #50b892;
	box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px,
		rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
}
</style>
		<div class="user_header">
			<div class="header">
				<ul class="seller">
					<li></li>
				</ul>
			</div>
			<header id="nav_bars_head">

				<!-- --------------menu bar end -------------------- -->

				<div class="head">
					<a href="index">
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
											src="https://iili.io/HyiOB24.th.png" id="wish"><span
											id="wish_span_count">4</span>
											<p id="wish_name">Wishlist</p> </a></li>
									<li class="hero_list11"><a
										href="${root}/pages/user/user_order.html"> <img
											src="https://iili.io/HyiOUnn.md.png" id="order_del">
											<p>Orders</p></a></li>
									<li class="hero_list11" id="cart_icon"><a
										href="${root}/pages/user/add_cart.html"><img
											src="https://iili.io/HyiOQuS.md.png" id="cart"><span
											id="span_count">4</span>
											<p id="cart_name">Cart</p></a></li> <a href="profile_details"
										id="profile_icon"><img class="img1"
										src="https://iili.io/HyiebON.md.png" alt="profile"
										width="35px" height="35px"></a>
								</div>

							</ul>
						</div>
					</div>
			</header>
			<div class="nav">
				<a href="index"><button class="btn1">HOME</button></a>
				<div class="dropdown">
					<button class="dropbtn">BRANDS</button>
					<div class="dropdown-content">
						<a href="products?category_id=1">DHANUKA</a> <a
							href="products?category_id=2">DOW AGRO SCIENCE</a> <a
							href="products?category_id=3">TATA RALLIS</a> <a
							href="products?category_id=4">ADAMA</a> <a
							href="products?category_id=5">BAYER</a> <a
							href="products?category_id=6">ARIES AGRO</a> <a
							href="products?category_id=7">INFOIL</a> <a
							href="products?category_id=8">RINUJA</a>
					</div>
				</div>
				<div class="dropdown1">
					<button class="dropbtn1">CROP PROTECTION</button>
					<div class="dropdown1-content">
						<a href="products?category_id=9">BIO INSECTICIDES</a> <a
							href="products?category_id=10">BIO FUNGICIDES</a> <a
							href="products?category_id=11">BIO NEMATICIDES</a> <a
							href="products?category_id=12">BIO VIRCIDES</a>
					</div>
				</div>
				<div class="dropdown2">
					<button class="dropbtn2">CROP NUTRITION</button>
					<div class="dropdown2-content">
						<a href="products?category_id=13">MAJOR NURIENTS</a> <a
							href="products?category_id=14">SECONDARY NURIENTS</a> <a
							href="products?category_id=15">GROWTH PROMOTERS</a> <a
							href="products?category_id=16">GROWTH RETARDANTS</a> <a
							href="products?category_id=17">ORGANIC FERTILIZERS</a> <a
							href="products?category_id=18">BIO FERTILIZERS</a> <a
							href="products?category_id=19">ANTI STRESSING AGENTS</a> <a
							href="products?category_id=20">MICRO NURIENTS</a>
					</div>
				</div>
			</div>
		</div>
	</header>
</header>