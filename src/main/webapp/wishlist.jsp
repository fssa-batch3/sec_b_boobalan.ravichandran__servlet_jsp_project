
<%@page import="java.util.List"%>
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
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/footer.css">
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
	
<title>wishlist Items</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.wishlist{
    
  margin: 0px 70px 30px 70px;
}
main{
    min-height:77.5vh;
    background-color: rgb(243, 245, 249);
    padding-top: 40px;
}
.wishlist h2{
    font-size: 28px;
    padding: 10px 0px 10px 70px;
    margin-bottom: 20px;
}
.fertilizer{
    display: flex;
    margin: 5px 50px 5px 50px ;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
    padding: 10px 100px 10px 50px;
    
}
.fert1 img{
    width: 220px;
    height: 220px;
    margin: 10px 50px 10px 100px;
    padding: 20px ;
    border-radius: 5px;
}
.fert1 img:hover{
    box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
    transform: scale(1.02);
}
.fert2 p{
 font-size: 20px;
 font-weight: bolder;
 width: 550px;
 padding: 20px 0px 0px 60px;
 color: rgb(218, 16, 67);
}
.fert2 p:hover{
    color: rgb(14, 118, 14);
}
.fert1 p:hover{
    color: rgb(14, 118, 14);
}
.fert1 a , .fert2 a{
    text-decoration: none;
}
#win{
    color:rgb(49, 5, 5);
    margin-left: 10px;
}
#win101{
    display: none;
}
.remov{
    /* padding: .8rem 3rem; */
    background-color: rgb(6, 6, 51);
    color:white;
    border-radius:5px;
    font-size: 18px;
    font-weight: bold;
    border: none;
    width:180px;
    height:50px;
    margin-top: 100px;
    /* margin-left: -50px; */
}
.remov:hover{
    background-color: rgb(15, 15, 159);
    box-shadow:rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}
.pro_price{
    display: flex;
    width:300px;
   
   margin-top: 25px;
}
.pro_price h2{
    font-size: 24px;
}
.pro_price h3{
    font-size: 20px;
    text-decoration: line-through;
    margin-top: 12px;
    margin-left: 30px;
    color:rgb(22, 120, 7)
}
.fert2{
    display:flex;
    margin-top: 20px;
}
.product_details a p{
    font-size: 25px;
}
.you_save h2{
    color:rgb(25, 3, 52);
    font-size: 23px;
}
#empty-wishlist{
    width:65w;
    height:70vh;
    padding: 10vh 10vw;
    margin-left:18vw;
   
}

/* ---------------/@media mobile resposive start/------------============= */

@media screen and (max-width:450px) {
    .wishlist{
        margin:0 0 50px 0;
      }
      .wishlist h2{
        display: inline-block;
        font-size:17px;
        padding: 15px 0px 10px 20px;
        margin-bottom: 10px;
    }
    #win{
        display: none;
    }
    #win101{
        display:inline-flex;
        color:rgb(49, 5, 5);
        margin-left: 5px;
    }
    .fertilizer{
        margin:0 ;
        border-radius:0;
        width:100vw;
    }
    
.fert1 img{
    width: 170px;
    height: 170px;
    margin: 10px;
    padding: 10px;
}

.fert2 p{
    font-size: 14px;
    width: 200px;
    padding: 50px 0px 0px 10px;
   }
   
.remov{
    margin-left: 17vw;
    padding: 8px 20px;
    margin-top: 50px;
    border-radius:3px;
    font-size: 13px;
}
}

</style>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<main>
		<%
		String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
		%>

		<img id="empty-wishlist"
			src="https://cdni.iconscout.com/illustration/premium/thumb/empty-cart-2130356-1800917.png"
			alt="wishlist image">
		<div class="wishlist"></div>
	</main>
	
	
	
		<jsp:include page="/footer.jsp"></jsp:include>
		
		
		<script src="<%= request.getContextPath()%>/javascript/search.js"> </script>
		
	<script type="text/javascript">
	
	let logedUser;

	let allProducts; // Declare the variable to hold product data

	// -------wishlist product get here -------
	const wishListProduct = JSON.parse(localStorage.getItem("wishlisstItem")) || [];

	async function getAllProducts() {
	    try {
	        const response = await fetch("http://localhost:8080/fertagriboomiweb/Product/all", {
	            method: "GET",
	        });

	        if (!response.ok) {
	            throw new Error(`HTTP error! Status: ${response.status}`);
	        }

	        const responseData = await response.json();

	        // Access the array of products from the 'data' property
	        allProducts = responseData.data;

	        // Now, 'allProducts' contains the array of product data
	        //console.log(allProducts);
	       // console.log("wishListProduct", wishListProduct);
	        logedUser = '<%=loggedUserUniqueEmail%>';
	       // console.log("loggedUserUniqueEmail", logedUser);
	        
	        
	        const findLogedUserWishlist = wishListProduct.filter(
	        		  (details) => details.userUniqueId === logedUser
	         );

	        const matchedProducts = allProducts.filter(product => {
	            return findLogedUserWishlist.some(wishItem => wishItem.product_id === product.id);
	        });
	        
	        



	        // Log matched products inside the .then() block
	        console.log("matchedProducts:", matchedProducts);
	        console.log("findLogedUserWishlist:", findLogedUserWishlist);
	        
	        // Example: Logging product names
	        matchedProducts.forEach(product => {
	            const rootPath = window.location.origin;
	            const divFertilizer = document.createElement("div");
	            divFertilizer.setAttribute("class", "fertilizer");
	            document.querySelector("div.wishlist").append(divFertilizer);
	         // <div  class="fert1">
	        	  const divFert1 = document.createElement("div");
	        	  divFert1.setAttribute("class", "fert1");
	        	  divFertilizer.appendChild(divFert1);

	        	  const productName = encodeURIComponent(product.name);
	        	  const productId = product.id;
	        	  const productUrl = `<%= request.getContextPath() %>/product/details?product_id=`+productId;

	        	  const fertA = document.createElement("a");
	        	  fertA.setAttribute("href", productUrl);
	        	  divFert1.append(fertA);

	        	  const image = document.createElement("img");
	        	  image.setAttribute("src", product.imageURL);
	        	  fertA.append(image);

	        	  // <div  class="fert2">
	        	  const divFert2 = document.createElement("div");
	        	  divFert2.setAttribute("class", "fert2");
	        	  divFertilizer.appendChild(divFert2);

	        	  const divProductDetails = document.createElement("div");
	        	  divProductDetails.setAttribute("class", "product_details");
	        	  divFert2.append(divProductDetails);

	        	  const fert2A = document.createElement("a");
	        	  fert2A.setAttribute("href", "");
	        	  divProductDetails.append(fert2A);

	        	  const fert2P = document.createElement("p");
	        	  fert2P.innerText = product.name;
	        	  fert2A.append(fert2P);

	        	  // <div class="pro_price">
	        	  //     <h2>---</h2>
	        	  //     <h3>....</h3>
	        	  // </div>
	        	  const divProPrice = document.createElement("div");
	        	  divProPrice.setAttribute("class", "pro_price");
	        	  divProductDetails.append(divProPrice);

	        	  const divProPriceH2 = document.createElement("h2");
	        	  const discount = product.productDiscount;
	        	  const actualPrice = product.productPrice;
	        	  const currePrice = actualPrice - discount;
	        	  divProPriceH2.innerText = '\u20B9 '+ currePrice 
	        	  divProPrice.append(divProPriceH2);

	        	  const divProPriceh3 = document.createElement("h3");
	        	  divProPriceh3.innerText = '\u20B9 '+ actualPrice;
	        	  divProPrice.append(divProPriceh3);

	        	  // <div class="you_save">
	        	  const divProSave = document.createElement("div");
	        	  divProSave.setAttribute("class", "you_save");
	        	  divProductDetails.append(divProSave);

	        	  const divDiscount = document.createElement("h2");
	        	  divDiscount.innerText = 'You Save: \u20B9 ' + discount;
	        	  divProSave.appendChild(divDiscount);

	        	  const fert2Button = document.createElement("button");
	        	  fert2Button.setAttribute("class", "remov");
	        	  fert2Button.setAttribute("data-product-id", product.id);
	        	  fert2Button.innerText = "Remove";
	        	  divFert2.append(fert2Button);

	        	  fert2Button.addEventListener("click", function removeWishList() {
	        		    const { productId: id } = this.dataset;
	        		    this.setAttribute("like", "false");
	        		    const updatedWishlist = wishListProduct.filter(
	        		        (wishlistItem) => wishlistItem.product_id.toString() !== id
	        		    );
	        		    localStorage.setItem("wishlisstItem", JSON.stringify(updatedWishlist));
	        		    this.style.color = "rgb(198, 198, 198)";
	        		    window.location.reload();
	        		});


	        });

	        const emptyWishList = document.getElementById("empty-wishlist");
	        const shownProducts = document.querySelector(".wishlist");
	        if (matchedProducts.length === 0) {
	            emptyWishList.style.display = "block";
	            shownProducts.style.display = "none";
	        } else {
	            emptyWishList.style.display = "none";
	            shownProducts.style.display = "block";
	        }
	    } catch (error) {
	        console.error("Error:", error);
	    }
	}

	// Call the function to fetch product data
	getAllProducts();


</script>
</body>
</html>
