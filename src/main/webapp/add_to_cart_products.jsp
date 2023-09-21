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

<title>Add to cart</title>
<style>
body {
	font-family: Arial, sans-serif;
	
}



.search_menu,.mobile_footer{
    display: none;
}

.checked {
    color: orange;
    margin-bottom: 10px;
    padding-left: 5px;
  }
  main{
    background-color: rgb(241, 243, 246);
    padding: 40px 0px 0px 150px;
    user-select: none;
    min-height:77.8vh;
  }
.cart1{
    background-color: rgb(255, 255, 255);
    min-width:720px;
    padding-top: 20px;
    box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}
.cart {
    display: flex;
    text-align: center;
    padding-bottom:15vh;
}
.cart21 img{
    width: 250px;
    height: 250px;
}
.cart2{
    display: flex;
    text-align: center;
    margin-left: 50px;
}
.cart111,.cart112 ,.cart113 ,.cart115{
 display: flex;
 justify-content: space-between;
 padding: 0 20px;
}
a{
 text-decoration: none;
 color:rgb(84, 83, 83)
}
.cart22{
    margin-top: 60px;
}
.cart22 h1{
    font-size: 22px;
    margin-left: 20px;
    width:30vw;
    text-align: left;
}
.star{
    margin-top: 20px;
}
.price h2 {
    margin:12px 0px 20px 30px;
}
.price del{
    margin:17px 0px 20px 20px;
    font-size: 18px;
    color: rgb(149, 8, 71);
    font-weight: bold;
}
.cart22 h3{
    font-size: 19px;
}


.price{
    margin: 10px 10px 10px -10px;
    display: flex;
    
    margin-left: 50px;
}
/* ===========-------------section -----------=============== */
.cart_details{
    border-bottom: 2px solid gray;
    padding:20px 30px 20px 0px;
}
/* -----------/ order qty/-------------- */
.fert5{
    display: flex;
    margin-left: 100px;
    margin-top: 10px;
}
.fert5 #option{
 width:62px;
 height:40px;
 padding: 5px 10px;
 margin-left: 20px;
 font-size: 18px;
 border-radius: 3px;
}
.fert5 #option:focus{
    outline: none;
}

.btnn {
    display: flex;
    padding-top:2vh;
  
}
.btnn button{
    margin-left:90px;
    padding: 12px 70px;
    font-size: 18px;
    margin-bottom: 20px;
    background-color: transparent;
    border: 2px solid  rgb(239, 239, 239);
    font-weight: bold;
    border-radius: 5px;
    cursor:pointer;

}
.btnn button:hover{
    border: 2px solid rgb(250, 250, 250);
    background-color: rgb(249, 248, 248);
    color: rgb(0, 0, 0);
    border-radius: 5px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;}
.bttn button:hover{
    background-color:  rgb(244, 115, 30);
    color: white;
    border: 2px solid  rgb(255, 107, 8);
    box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
    box-sizing: border-box;
}
.bttn button{
    margin-left:380px;
    padding: 14px 70px;
    font-size: 17px;
    background-color: rgb(255, 102, 0);
    color:white;
    border-radius: 10px;
    border: 2px solid  rgb(255, 107, 8);
}
.bttn{
   background-color: white;
   box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
   padding: 15px 20px 15px 0px;
}

/* --==================-/ cart total prce details /---------================== */

.cart11{
    background-color: white;
    margin-left: 100px;
    min-width:340px;
    max-height: 310px;
    box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
    position: sticky;
    top: 0;
}
.cart101 h2{
margin-top: 16px;
 padding-bottom: 13px;
 border-bottom: 2px solid rgb(236, 234, 234);
 color: rgb(3, 4, 73);

}
.cart111 h2,.cart112 h2 ,.cart113 h2{
    color:rgb(87, 85, 85);
    font-size: 20.5px;
    margin:10px 0px;
    font-weight: normal;
}
.cart111 p, .cart113 p{
    margin-top: 13px;
    font-size: 19px;
    color: rgb(68, 67, 67);
    font-weight: bold;
}
.cart112 p{
    margin-top: 13px;
    font-size: 19px;
    color: rgb(149, 8, 71);
    font-weight: bold;
}

.cart114 h3{
 color:rgb(2, 97, 2);
 margin: 15px 0;
 font-size: 19.5px;
 font-weight: 500;
}

.cart115{
    border-top: 2px solid rgb(223, 221, 221);
    margin: 5px 25px;
    padding: 10px 0px;
    border-bottom: 2px solid rgb(223, 221, 221);
}
.cart115 h1{
    font-size: 22px;
    color:rgb(96, 95, 95);
}
.cart115 p{
    margin-top: 5px;
    margin-left: 107px;
    font-size: 19px;
    font-weight: bold;
    color:rgb(15, 87, 3);
}
.bttn101{
    display: none;
}


#empty-cart-image{
    width: 50vw;
    text-align: center;
    margin-left: 13vw;
       margin-top: 4vw;
}

#discount{
    color:green ;
    font-size: 21px;
    /* margin-left: 40px; */
    width:300px;
}

/* -------============/ @media start for mobile screen/-=============---------- */
@media screen and (max-width:400px){
    main{
        background-color: rgb(255, 255, 255);
        padding:0;
        user-select: none;
      }
      .cart_details{
        border-bottom:none;
    }
    .cart1{
        background-color: rgb(255, 255, 255);
        max-width:100vw;
        padding-top:0;
        box-shadow:none;
    }
    .cart {
        display: block;
    }
    .cart2{
        margin-left: 0;
    }
    /*   =-------/place oder button/--------========  */
    .bttn{
        display: none;
    }
  /* ---------/ product images/------------ */

  .cart21 img{
    width:120px;
    height:130px;
    margin-left: 20px;
  }


    /* ---------------/remove button/       ----------------======== */
.remove-button {
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
  padding: 0px 0 0px 210px;
 
}

    
.btnn {
    display: block;
}
.btnn button{
    margin-left:0;
    padding: 15px 50px;
    font-size: 13px;
    background-color: transparent;
    border: none;
    font-weight: bold;
  margin-bottom: 0;
  border-left: 2px solid rgb(212, 211, 211);
  border-right: 2px solid rgb(220, 219, 219);
}

.cart22{
    margin-top: 20px;
    margin-left: 30px;
}
.cart22 h1{
    font-size: 15px;
}
.star{
    margin-top: 10px;
}
.cart22 .price h2 {
    margin:0px 0px 10px -10px;
    font-size: 15px;
    display: inline-block;
}
.cart22 .price del{
    margin:17px 0px 20px 20px;
    font-size: 12px;
    color:red
}
.price{
    display: block;
}
.cart22 h3{
    font-size: 14px;
}
.fert5{
    margin: 20px 20px 20px 30px;
}
.fert5 #option{
 width:40px;
 height:25px;
 padding: 5px 5px;
 font-size: 13px;
 font-weight: 500;
}
.fert5 h3{
    font-size: 15px;
  
}
  /* -=================------/ total price details /------------========== */
.cart11{
    background-color: white;
    margin-left:0;
    width:100vw;
    max-height:none;
    box-shadow: none;
    margin-bottom: 50px;
}

.cart101 h2{
    margin-top: 16px;
     font-size: 15px;
    }
    
.cart111 h2,.cart112 h2 ,.cart113 h2{
    color:rgb(87, 85, 85);
    font-size: 15px;
    margin:10px 0px;
    font-weight: 500;
}
.cart111 p,.cart112 p ,.cart113 p{
    margin-top: 13px;
    font-size: 14px;
}

.cart115{
    margin: 5px 20px;
    padding: 10px 0px;
    border-bottom: 2px solid rgb(223, 221, 221);
}
.cart115 h1{
    font-size: 17px;
    color:rgb(69, 17, 8);
}
.cart115 p{
    font-size: 16px;
    color:rgb(69, 5, 5);
}
.bttn101{
    display:flex;
    box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px 2px;
    padding: 5px 0px 5px 250px;
    margin-bottom: 20px;
}
.bttn101 button{
    color:white;
    background-color: rgb(255, 136, 0);
    padding: 10px 25px;
    border-radius: 3px;
    border: none;
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
     
            <!-- -===================/cart class start/------------================== -->
            <div class="cart" id="cartRemove">
                <!-- -===================/cart1 class start/------------================== -->
                <div class="cart1">
                <div class="cart-container">
                
                </div>
                
                </div>
              
                <div class="cart11">
                
                </div>
            </div>
                   <img id="empty-cart-image" src="https://cdni.iconscout.com/illustration/premium/thumb/confusing-woman-due-to-empty-cart-4558760-3780056.png" alt="Empty Cart">
            
        
        </main>
        	<jsp:include page="/footer.jsp"></jsp:include>
</body>
<script src="<%= request.getContextPath()%>/javascript/search.js"> </script>

<script type="text/javascript">



const div_cart11 = document.createElement("div");
div_cart11.setAttribute("class", "cart101");
document.querySelector(".cart11").append(div_cart11);

const div_cart101_h2 = document.createElement("h2");
div_cart101_h2.innerText = "Price Details";
div_cart11.append(div_cart101_h2);

// <div class="cart111"> <h2>Price</h2> <p>₹708</p></div>

const div_cart111 = document.createElement("div");
div_cart111.setAttribute("class", "cart111");
document.querySelector(".cart11").append(div_cart111);

const div_cart111_h2 = document.createElement("h2");
div_cart111_h2.innerText = "Price";
div_cart111.append(div_cart111_h2);

const div_cart111_p = document.createElement("p");
div_cart111_p.setAttribute("id", "total-price");

div_cart111.append(div_cart111_p);

// <div class="cart112"> <h2>Discount</h2> <p>-₹417</p > </div>

const div_cart112 = document.createElement("div");
div_cart112.setAttribute("class", "cart112");
document.querySelector(".cart11").append(div_cart112);

const div_cart112_h2 = document.createElement("h2");
div_cart112_h2.innerText = "Discount";
div_cart112.append(div_cart112_h2);

const div_cart112_p = document.createElement("p");
div_cart112_p.setAttribute("id", "total-discount");
// div_cart112_p.innerText =`Total Discount: ₹${totalDiscount}`;
div_cart112.append(div_cart112_p);

// <div class="cart113"> <h2>Delivery Charges</h2> <p>FREE</p> </div>

const div_cart113 = document.createElement("div");
div_cart113.setAttribute("class", "cart113");
document.querySelector(".cart11").append(div_cart113);

const div_cart113_h2 = document.createElement("h2");
div_cart113_h2.innerText = "Delivery Charges";
div_cart113.append(div_cart113_h2);

const div_cart113_p = document.createElement("p");
div_cart113_p.innerText = "FREE";
div_cart113.append(div_cart113_p);

//   <div class="cart115> <h1>Total Amount</h1> <p>₹758</p> </div>

const div_cart115 = document.createElement("div");
div_cart115.setAttribute("class", "cart115");
document.querySelector(".cart11").append(div_cart115);

const div_cart115_h2 = document.createElement("h1");
div_cart115_h2.innerText = "Total Amount";
div_cart115.append(div_cart115_h2);

const div_cart115_p = document.createElement("p");
div_cart115_p.setAttribute("id", "final-price");
div_cart115.append(div_cart115_p);

// <div class="cart114"> <h3>You will save ₹417 on this order </h3> </div>

const div_cart114 = document.createElement("div");
div_cart114.setAttribute("class", "cart114");
document.querySelector(".cart11").append(div_cart114);

const div_cart114_h2 = document.createElement("h3");
 
div_cart114.append(div_cart114_h2);


let totalPrice = 0; // Initialize totalPrice
let totalDisc = 0;
  
  // cart store detaiols
  
  
const logedUser = '<%=loggedUserUniqueEmail%>';
const cartIds = JSON.parse(localStorage.getItem("addToCartItem")) || [];
let allProducts = []; // Initialize the array


let logedUserDetails;

// Define a function to fetch product data
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
        //console.log("wishListProduct", cartIds);
        logedUserDetails = '<%=loggedUserUniqueEmail%>';
        
        
        const findLogedUserAddToCart = cartIds.filter(
      		  (details) => details.userUniqueId === logedUserDetails
       );

        
        const loadProduct = allProducts.filter(product => {
            return findLogedUserAddToCart.some(addToCart => parseInt(addToCart.cart_id) === product.id);
        });
       
        // Calculate the total price or perform any other necessary actions
        let totalPrice = 0;

        // Call a function to process or display the data
        processAllProductsDetails(loadProduct);
    } catch (error) {
        console.error("Error fetching product data:", error);
    }
}

//Call the function to fetch product data
getAllProducts();




// function to process or display the data
function processAllProductsDetails(loadProducts) {
    // Initialize total price and total discount
    let totalPrice = 0;
    let totalDiscount = 0;

    // Create a container for the cart details
    const cartContainer = document.querySelector("div.cart-container");

    loadProducts.forEach((loadProduct) => {
        // Create a container div element
        const cartDetailsContainer = document.createElement('div');
        cartDetailsContainer.classList.add('cart_details');

        // Create the first cart2 div element
        const cart2Div = document.createElement('div');
        cart2Div.classList.add('cart2');

        // Create the cart21 div element
        const cart21Div = document.createElement('div');
        cart21Div.classList.add('cart21');

        // Create an anchor element for the product image
        const productImageAnchor = document.createElement('a');
        productImageAnchor.href = '<%= request.getContextPath()%>'+'/product/details?product_id='+loadProduct.id;

        // Create an image element
        const productImage = document.createElement('img');
        productImage.src = loadProduct.imageURL;
        productImage.alt = 'DHANUKA M45 FUNGICIDE';

        // Append the image to the anchor, and the anchor to cart21
        productImageAnchor.appendChild(productImage);
        cart21Div.appendChild(productImageAnchor);

        // Create the cart22 div element
        const cart22Div = document.createElement('div');
        cart22Div.classList.add('cart22');

        // Create an anchor element for the product details
        const productDetailsAnchor = document.createElement('a');
        productDetailsAnchor.href = "";

        // Create an h1 element for the product name
        const productName = document.createElement('h1');
        productName.id = 'product_name';
        productName.textContent = loadProduct.name;

        // Create a div element for price information
        const priceDiv = document.createElement('div');
        priceDiv.classList.add('price');

        // Create a select element for quantity selection
        const selectQuantity = document.createElement('select');
        selectQuantity.classList.add('selectQuantity');
        selectQuantity.id = 'option';
        selectQuantity.dataset.product_id = loadProduct.id;

        // Create and append option elements for quantity
        for (let i = 1; i <= 10; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.textContent = i;
            selectQuantity.appendChild(option);
        }

        // Initialize the selectedQuantity and initialPrice
        let selectedQuantity = 1; // Default to 1
        let initialPrice = loadProduct.productPrice; // Default to the product price for quantity 1

        // Add an event listener to update the price and discount based on quantity change
        selectQuantity.addEventListener('change', function () {
            // Get the new selected quantity
            selectedQuantity = parseInt(selectQuantity.value);

            // Calculate the new price and discount based on the selected quantity
            const newPrice = selectedQuantity * loadProduct.productPrice;
            const newDiscount = selectedQuantity * loadProduct.productDiscount;

            // Update the displayed price and discount
            productPrice.textContent = '\u20B9 ' + newPrice;
            discountElement.textContent = 'You Save: \u20B9 ' + newDiscount;

            // Calculate the change in price and discount
            const priceChange = newPrice - initialPrice;
            const discountChange = newDiscount - (selectedQuantity * loadProduct.productDiscount);

            // Update the total price and total discount
            totalPrice += priceChange;
            totalDiscount += discountChange;

            // Update the initialPrice for the next change event
            initialPrice = newPrice;

            // Calculate the final price
            const finalPrice = totalPrice - totalDiscount;

            // Update the total price in your total price element (div_cart111_p)
            div_cart111_p.innerText = "\u20B9" + totalPrice;

            // Update the total discount in your total discount element (div_cart112_p)
            div_cart112_p.innerText = "\u20B9" + totalDiscount;

            // Update the final price in your final price element (div_cart115_p)
            div_cart115_p.innerText = "\u20B9" + finalPrice;

            // Update the "You will save" message
            div_cart114_h2.innerText = "You will save \u20B9" + totalDiscount + " on this order ";
        });

        // Set the default value for selectedQuantity to 1
        selectQuantity.value = selectedQuantity;

        // Create an h2 element for the discounted price
        const productPrice = document.createElement('h2');
        productPrice.id = 'product_pri';
        const discount = selectedQuantity * loadProduct.productDiscount;
        const actualPrice = selectedQuantity * loadProduct.productPrice;
        const currePrice = actualPrice - discount;
        productPrice.textContent = '\u20B9 ' + currePrice;

        // Create a del element for the original price
        const actualPriceElement = document.createElement('del');
        actualPriceElement.id = 'actual_price';
        actualPriceElement.textContent = '\u20B9 ' + actualPrice;

        // Append price elements to the price div
        priceDiv.appendChild(productPrice);
        priceDiv.appendChild(actualPriceElement);

        // Create an h3 element for the discount
        const discountElement = document.createElement('h3');
        discountElement.id = 'discount';
        discountElement.textContent = 'You Save: \u20B9 ' + discount;

        // Append product details to the anchor, and the anchor to cart22
        productDetailsAnchor.appendChild(productName);
        productDetailsAnchor.appendChild(priceDiv);
        productDetailsAnchor.appendChild(discountElement);
        cart22Div.appendChild(productDetailsAnchor);

        // Create the btnn div element
        const btnnDiv = document.createElement('div');
        btnnDiv.classList.add('btnn');

        // Create the fert5 div element
        const fert5Div = document.createElement('div');
        fert5Div.classList.add('fert5');

        // Create an h3 element for 'Order Qty'
        const orderQty = document.createElement('h3');
        orderQty.textContent = 'Order Qty';

        // Append 'Order Qty' and the select element to fert5
        fert5Div.appendChild(orderQty);
        fert5Div.appendChild(selectQuantity);

        // Create the remove-button div element
        const removeButtonDiv = document.createElement('div');
        removeButtonDiv.classList.add('remove-button');

        // Create an anchor element for the Remove button
        const removeButtonAnchor = document.createElement('a');

        // Create a button element with an onclick event
        const removeButton = document.createElement('button');
        removeButton.textContent = 'Remove';
        removeButton.onclick = function () {
            removeProductFromCart(loadProduct.id);
        };

        // Append the button to the anchor, and the anchor to remove-button
        removeButtonAnchor.appendChild(removeButton);
        removeButtonDiv.appendChild(removeButtonAnchor);

        // Append fert5 and remove-button to btnn
        btnnDiv.appendChild(fert5Div);
        btnnDiv.appendChild(removeButtonDiv);

        // Append cart21, cart22, and btnn to cart2
        cart2Div.appendChild(cart21Div);
        cart2Div.appendChild(cart22Div);
        cartDetailsContainer.appendChild(cart2Div);
        cartDetailsContainer.appendChild(btnnDiv);

        // Append cart2 to cart_details
        cartContainer.appendChild(cartDetailsContainer);

        // Accumulate price1 and discount
        const price1 = loadProduct.productPrice;
        const disc = loadProduct.productDiscount;
        totalPrice += price1;
        totalDiscount += selectedQuantity * disc;
    });

    // Calculate the final price outside the loop
    const finalPrice = totalPrice - totalDiscount;

    // Update the total price in your total price element (div_cart111_p)
    div_cart111_p.innerText = "\u20B9" + totalPrice;

    // Update the total discount in your total discount element (div_cart112_p)
    div_cart112_p.innerText = "\u20B9" + totalDiscount;

    // Update the final price in your final price element (div_cart115_p)
    div_cart115_p.innerText = "\u20B9" + finalPrice;

    // Update the "You will save" message
    div_cart114_h2.innerText = "You will save \u20B9" + totalDiscount + " on this order ";

    // ------------cart empty message photo
    const cartEmpty = document.getElementById("empty-cart-image");
    const cartremove = document.getElementById("cartRemove");
    if (loadProducts.length === 0) {
        cartEmpty.style.display = "block";
        cartremove.style.display = "none";
    } else {
        cartEmpty.style.display = "none";
        cartremove.style.display = "flex";
    }

    // ----------------------place order button creating--------------
    const cartContainers = document.querySelector(".cart1");

    const div_btnn = document.createElement("div");
    div_btnn.setAttribute("class", "bttn");

    const div_btnn_a = document.createElement("a");
  
   
    div_btnn.append(div_btnn_a);

    const div_btnn_button = document.createElement("button");
    div_btnn_button.setAttribute("id", "place_order");
    div_btnn_button.setAttribute("type", "button");
    div_btnn_button.innerText = "Place order";
    div_btnn_a.append(div_btnn_button);

    cartContainers.appendChild(div_btnn);

// remove product from localstorage
    function removeProductFromCart(cartId) {
    	  // Show a confirmation dialog box
    	  const confirmed = confirm(
    	    "Are you sure you want to remove this product from your cart?"
    	  );

    	  if (confirmed) {
    	    // Get the current cart from local storage
    	    const cart = JSON.parse(localStorage.getItem("addToCartItem"));

    	    // Find the index of the product to remove
    	    const index = cart.findIndex((item) => item.cart_id === cartId);

    	    // Remove the product from the cart
    	    cart.splice(index, 1);

    	    // Update the cart in local storage
    	    localStorage.setItem("addToCartItem", JSON.stringify(cart));

    	    // Refresh the page to update the cart display
    	    window.location.reload();
    	  }
    	}
    
    
    const placeOrderButton = document.getElementById("place_order");
    placeOrderButton.addEventListener("click", function () {
        const productsInOrder = [];
        const selectQuantityElements = document.querySelectorAll(".selectQuantity");

        selectQuantityElements.forEach((selectQuantity) => {
            const productId = selectQuantity.dataset.product_id;
            const quantity = parseInt(selectQuantity.value);
            productsInOrder.push({ productId, quantity });
            console.log("productsInOrder", productsInOrder)
        });

       
        fetch('http://localhost:8080/fertagriboomiweb/product/details/add_to_cart_post', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({productsInOrder}),
        })
        .then(response => {
            if (response.ok) {
            	window.location.href = '/fertagriboomiweb/product/details/order_summary/new_address';
                console.log("Order placed successfully.");
            } else {
            	response.text();
                // Handle error response here
                console.error("Failed to place the order.");
                alert(response);
            }
        })
        .catch(error => {
            // Handle network or other errors here
            console.error("An error occurred while placing the order:", error);
        });
    });



}









  </script>
</html>