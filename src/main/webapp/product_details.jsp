
<%@page import="in.fssa.fertagriboomi.model.RatingsAndReviews"%>
<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/product_details.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css">
	

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Product Details</title>
<style>
#wish1 {
    margin-left: -1.4rem;
    position: absolute;
    margin-top: -1.2rem;
    cursor: pointer;
    
    }
.fa-solid{
 color:blue;
}
/* Style for the wishlist message */
#wishlist-message {
  position: fixed;
  margin-top:2vh;
  right: 32vw;
  background-color: #176047;
  color: white;
  padding: 15px 30px;
  font-size:18px;
  
  border-radius: 5px;
  animation: fadeOut 5s forwards; /* Animation to fade out */
}

/* Hidden class to initially hide the message */
.hidden {
  display: none;
}

/* Keyframes for the fade out animation */
@keyframes fadeOut {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    display: none;
  }
}
.like img, .dislike img {
	width: 30px;
	height: 30px;
	margin-right: 15px;
	margin-top:10px;
	display:inline;

}
.alert-mesg{
display:flex;
}
.alert-mesg p{
margin-top:12px;
align-items: center;
} 
.payment {
margin-top:5vh;
margin-left:7vw;
font-weight:bold;
font-size:20px;
color:green;
}
.benifitsDetails, .descriptionDetails, .applicationDetails {
	background-color: #ffffffec;
	margin-top: 5vh;
	padding: 50px;
	border-radius: 10px;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px
		6px;
		width:77.3vw;
		margin-left:5vw;
}
.reviews{
	margin-left:7vw;
}

</style>
</head>
<body>

	<%
	String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
	%>
	
	<jsp:include page="/header.jsp"></jsp:include>
	



	<%
	Product product = (Product) request.getAttribute("productDetails");
	List<RatingsAndReviews> reviews = (	List<RatingsAndReviews>) request.getAttribute("REVIEWS");
	%>

	<div class="total">
		<div class="userAlert" style="display: none;" id="like">
                    <div class="like">
                        <span class="LikeAlert alert-mesg">
                            <img src="https://img.icons8.com/fluency/512/checked.png" alt="tick"> <p>Added to your Wishlist<p>
                        </span>
                    </div>
                </div>
                <div class="userAlert " style="display: none;" id="dislike">
                    <div class="dislike">
                        <span class="LikeAlert alert-mesg">
                            <img src="https://img.icons8.com/fluency/512/checked.png" alt="tick"><p>Removed from your Wishlist</p>
                        </span>
                    </div>
                </div>
		<div class="fertilizer">
			<div class="fert1">
				<img src="<%=product.getImageURL()%>"
					alt="
					<%=product.getName()%>" id="product_image"> <a
					href=""><i id="wish1" class="fa fa-heart"
					style="font-size: 36px"></i></a>
			</div>
			<div class="fert2">
				<h2 id="pro_name"><%=product.getName()%></h2>
				<div class="fert3">
					<h3>Manufacture:</h3>
					<p id="manufact"><%=product.getManufacture()%></p>
				</div>


				<div class="fert4">
					<p id="price">&#8377;<%=product.getPrice() - product.getDiscount()%></p>
					<del id="actual_price">&#8377;<%=product.getPrice()%></del>
				</div>
				<div class="fert55">
					<p id="discount">
						You Save -
						  &#8377;<%=product.getDiscount()%></p>
				</div>
				<div class="fert5">
					<h3>
						Weight: <span id="product_weight">200ml</span>
					</h3>
				</div>

				<div class="rem">
					<a id="go_to_cart">
						<button id="rem1">
							GO TO CART <i id="cart" class="fa fa-shopping-cart"
								style="font-size: 25px"></i>
						</button>
					</a>
					<%
					String buyNowUrl;
					if (loggedUserUniqueEmail != null) {
						buyNowUrl = "details/order_summary?product_id=" + product.getId();
					} else {
						buyNowUrl = request.getContextPath() + "/login";
					}
					%>

					<div>
						<a href="<%=buyNowUrl%>">
							<button id="rem2" type="submit">
								BUY NOW <i id="thunder" class="fa fa-bolt"
									style="font-size: 25px"></i>
							</button>
						</a>
					</div>

				</div>
				<div id="wishlist-message" class="hidden">Product added to Cart!</div>
				
				<div class="payment"><li>Payment Method: Cash on Delivery Only.</l></div>
				<div class="addvertisement">
					<img src="https://iili.io/J9hKbou.jpg" alt="advertisement">
				</div>
			</div>

		</div>
		<div class="details-container">
		</div>
		<% if (reviews != null && !reviews.isEmpty()) { %>
<div class="reviews">
    <div class="reviewsName">
        <div class="averageRating">
            <h1><%= calculateAverageRating(reviews) %></h1>
            <img src="<%= request.getContextPath()%>/assets/images/star_rating.png" alt="Star Icon">
        </div>
        <img src="<%= request.getContextPath()%>/assets/images/customers_reviews.jpg" id="reviewsLogo" alt="Customer Reviews Logo">
        <h2>Customer Reviews</h2>
    </div>
    <div class="reviewsDetails">
        <h2>Ratings & Reviews</h2>
        <div class="allCustomeReviews">
            <% for (RatingsAndReviews review : reviews) { %>
            <div class="customerStar1">
                <div class="reviewStarReviewContainer">
                    <div class="reviewStarContainer">
                        <h3><%= review.getRatings() %></h3>
                        <img src="<%= request.getContextPath()%>/assets/images/star_rating.png" alt="Star Icon">
                    </div>
                    <p><%= review.getUserName() %></p>
                </div>
                <div class="customersReviewsDiv">
                    <p><%= review.getReviews() %></p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<% } else { %>
<img src="<%= request.getContextPath()%>/assets/images/no_reviews.jpg" id="NoreviewsLogo" alt="No Reviews Logo">
<% } %>

	<%!
    public String calculateAverageRating(List<RatingsAndReviews> reviews) {
        if (reviews == null || reviews.isEmpty()) {
            return "0.0"; // Return a formatted string with one digit after the decimal point
        }

        double sum = 0.0;
        for (RatingsAndReviews review : reviews) {
            sum += review.getRatings();
        }

        double averageRating = sum / reviews.size();

        // Format the average rating to have one digit after the decimal point
        return String.format("%.1f", averageRating);
    }
%>
	</div>
	<script>
	const crop_description = document.createElement("div");
crop_description.setAttribute("class", "crop_description");
document.querySelector("div.details-container").append(crop_description);

//   <div class="description">...</div>
const div_description = document.createElement("div");
div_description.setAttribute("class", "description");
document.querySelector("div.details-container").append(div_description);

// <h1>...</h1>
const description_h1 = document.createElement("h1");
description_h1.innerText = "Descriptions";
description_h1.setAttribute("id", "descriptiondes");
description_h1.setAttribute("type", "submit");
crop_description.append(description_h1);

const divDesc = document.createElement("div");
divDesc.setAttribute("id", "descriptionul");
divDesc.setAttribute("class", "descriptionDetails");
div_description.append(divDesc);

const description_ul = document.createElement("ul");
divDesc.append(description_ul);

const productDescription = '<%=product.getDescription()%>';
const applicationPoints = productDescription.split(". ");

applicationPoints.forEach((point) => {
	  const description_li = document.createElement("li");
	  description_li.innerText = point.trim() + ".";
	  description_ul.appendChild(description_li);
	});

	// Append the applicationList to the appropriate container element on the product detail page





	const bdescription_inn = document.createElement("h3");
	bdescription_inn.innerText = "Descriptions";
	bdescription_inn.setAttribute("id", "descriptionin");

	divDesc.prepend(bdescription_inn);

	//   <div class="benifits">...</div>
	const div_benifits = document.createElement("div");
	div_benifits.setAttribute("class", "benifits");
	document.querySelector("div.details-container").append(div_benifits);


	const divbeni = document.createElement("div");
	divbeni.setAttribute("id", "benifitsul");
	divbeni.setAttribute("class", "benifitsDetails");
	div_benifits.append(divbeni);





	// <h2>...</h2>
	const benifits_h2 = document.createElement("h2");
	benifits_h2.innerText = "Benefits";
	benifits_h2.setAttribute("id", "benifitsbeni");
	crop_description.append(benifits_h2);

	// <ul>...</ul>
	const benifits_ul = document.createElement("ul");
	divbeni.append(benifits_ul);

	// <li>...</li>
	const productBenifits = '<%=product.getBenefits()%>'
	const benifitsPoints = productBenifits.split(". ");
	// console.log(benifitsPoints)

	// split the each points
	benifitsPoints.forEach((point) => {
	  const benifits_li1 = document.createElement("li");
	  benifits_li1.innerText = point.trim() + ".";
	  benifits_ul.appendChild(benifits_li1);
	});






	const benifits_inn = document.createElement("h3");
	benifits_inn.innerText = "Benefits";
	benifits_inn.setAttribute("id", "benifitsin");
	divbeni.prepend(benifits_inn);


	//   <div class="method">...</div>
	const div_method = document.createElement("div");
	div_method.setAttribute("class", "method");
	document.querySelector("div.details-container").append(div_method);

	// <h2>...</h2>
	const method_h2 = document.createElement("h2");
	method_h2.innerText = "Method of Application";
	method_h2.setAttribute("id", "applicationapp");
	crop_description.append(method_h2);



	// apllication details
	const divAppli= document.createElement("div");
	divAppli.setAttribute("id", "applicationul");
	divAppli.setAttribute("class", "applicationDetails");
	div_method.append(divAppli);

	// <ul>...</ul>
	const method_ul = document.createElement("ul");

	divAppli.append(method_ul);


	// <li>...</li>
	const productApplication = '<%=product.getApplication()%>';
	const methodPoints = productApplication.split(". ");
	// console.log(benifitsPoints)

	// split the each points
	methodPoints.forEach((point) => {
	  const method_li1 = document.createElement("li");
	  method_li1.innerText = point.trim()+".";
	  method_ul.appendChild(method_li1);
	});

	const application_inn = document.createElement("h3");
	application_inn.innerText = "Method of Application";
	application_inn.setAttribute("id", "applicationin");
	divAppli.prepend(application_inn);

	


	const descriptionCrop = document.getElementById("descriptiondes");
	const benifitsCrop = document.getElementById("benifitsbeni");
	const applicationCrop = document.getElementById("applicationapp");
	const descriptionCropUl = document.querySelector(".description");
	const benifitsCropUl = document.querySelector(".benifits");
	const applicationCropUl = document.querySelector(".method");
	applicationCropUl.style.display = "none";
	benifitsCropUl.style.display = "none";
	descriptionCropUl.style.display = "none";

	descriptionCrop.addEventListener("click", function(){
	  descriptionCropUl.style.display = "inline";
	  benifitsCropUl.style.display = "none";
	  applicationCropUl.style.display = "none";
	  descriptionCrop.classList.add("descrip");
	  benifitsCrop.classList.remove("benifi");
	  applicationCrop.classList.remove("applica");


	});
	benifitsCrop.addEventListener("click", () => {
	  benifitsCropUl.style.display = "inline";
	  descriptionCropUl.style.display = "none";
	  applicationCropUl.style.display = "none";
	  benifitsCrop.classList.add("benifi");
	  applicationCrop.classList.remove("applica");
	  descriptionCrop.classList.remove("descrip");

	});
	applicationCrop.addEventListener("click", () => {
	  applicationCropUl.style.display = "inline";
	  descriptionCropUl.style.display = "none";
	  benifitsCropUl.style.display = "none";
	  applicationCrop.classList.add("applica");
	  descriptionCrop.classList.remove("descrip");
	  benifitsCrop.classList.remove("benifi");
	});


	
	
	
	/* wishlist storage*/
const button = document.querySelector("#wish1");
const loginUserDetails = '<%=loggedUserUniqueEmail%>';

button.addEventListener("click", function wishListAction(event) {
    event.preventDefault();

    // Check if the user is logged in
    const logedUserDetails = '<%=loggedUserUniqueEmail%>';

    this.classList.toggle("fa-solid");
    this.classList.toggle("true");
    this.classList.toggle("active");
    this.style.color = "rgb(7, 14, 88)";

    const wishlisstItem =
        JSON.parse(localStorage.getItem("wishlisstItem")) || [];
    const productUniqueId = parseInt('<%=product.getId()%>'); // Parse the ID as an integer
    const exit =
        wishlisstItem.length &&
        wishlisstItem.some(
            (data) =>
                data.product_id === productUniqueId &&
                data.userUniqueId === logedUserDetails
        );

    if (this.classList.contains("true") && !exit) {
        this.setAttribute("like", "true");

        wishlisstItem.push({
            product_id: productUniqueId, // Store as an integer
            userUniqueId: loginUserDetails,
        });
        localStorage.setItem("wishlisstItem", JSON.stringify(wishlisstItem));

    } else {
        this.setAttribute("like", "false");

        // Filter the wishlist items with the same product ID and user ID
        const wishlistRemove = wishlisstItem.filter(
            (data) =>
                data.product_id !== productUniqueId ||
                (data.product_id === productUniqueId &&
                    data.userUniqueId !== logedUserDetails)
        );
        localStorage.setItem("wishlisstItem", JSON.stringify(wishlistRemove));
        this.style.color = "rgb(198, 198, 198)";
    }
});

// Function to show the alert message for adding/removing from the wishlist
function showAlertMessage() {
    const like = document.getElementById("like");
    const dislike = document.getElementById("dislike");

    if (button.classList.contains("active")) {
        like.style.display = "block";
        dislike.style.display = "none";
        setTimeout(function() {
            like.style.display = "none";
            location.reload(); // Reload the page after 2 seconds
        }, 1200); // 1200 milliseconds (1.2 seconds) delay
    } else {
        like.style.display = "none";
        dislike.style.display = "block";
        setTimeout(function() {
            dislike.style.display = "none";
            location.reload(); // Reload the page after 2 seconds
        }, 1200); // 1200 milliseconds (1.2 seconds) delay
    }
}

button.addEventListener("click", showAlertMessage);

// Function to check if the product is in the wishlist and update button style
function checkWishlistStatus() {
    const wishlisstItem =
        JSON.parse(localStorage.getItem("wishlisstItem")) || [];
    const productUniqueId = parseInt('<%=product.getId()%>'); // Parse the ID as an integer
    const exit =
        wishlisstItem.length &&
        wishlisstItem.some(
            (data) =>
                data.product_id === productUniqueId &&
                data.userUniqueId === loginUserDetails
        );

    if (exit) {
        // Product is in the wishlist
        button.classList.add("fa-solid");
        button.classList.add("true");
        button.classList.add("active");
        button.style.color = "rgb(7, 14, 88)";
    } else {
        // Product is not in the wishlist
        button.classList.remove("fa-solid");
        button.classList.remove("true");
        button.classList.remove("active");
        button.style.color = "rgb(198, 198, 198)";
    }
}

// Call the function to check and update button style on page load
window.addEventListener("load", function() {
    checkWishlistStatus();
});


//Add to cart details
function addToCart() {
  if (loginUserDetails) {
    const logedUserDetails = '<%=loggedUserUniqueEmail%>';
    const addToCartItem =
      JSON.parse(localStorage.getItem("addToCartItem")) || [];
    const addProductId = '<%=product.getId()%>';

    const productExists = addToCartItem.some(
      (data) =>
        data.cart_id === addProductId && data.userUniqueId === logedUserDetails
    );
    if (!productExists) {
      addToCartItem.push({
        cart_id: addProductId,
        userUniqueId: loginUserDetails,
        product_qty: "1",
      });
      localStorage.setItem("addToCartItem", JSON.stringify(addToCartItem));

      // Show the wishlist message
      const wishlistMessage = document.getElementById("wishlist-message");
      wishlistMessage.classList.remove("hidden");

      // Set a timer to hide the message after 3 seconds and refresh the page
      setTimeout(function () {
        wishlistMessage.classList.add("hidden");
        location.reload(); // Refresh the page
      }, 2400);
    } else {
      alert("Product already in cart");
    }
  } else {
    window.location.href = `${add_path}/pages/user/user_login.html`;
  }
}

document.getElementById("rem1").addEventListener("click", addToCart);

</script>

		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
