<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Neuton:ital,wght@0,200;0,300;1,400&display=swap" rel="stylesheet">

<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<title>Order summary</title>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
     font-family: 'Neuton', serif;
    letter-spacing: .3px;
    word-spacing: 3px;

    }
  main{
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    background-color: #efefef47;
    caret-color: transparent;
    height:100vh;
  }
 
.order_summary{
    background-color: white;
    min-width:700px;
    min-height: 500px;
    box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
    border-radius: 10px;
    padding: 30px 100px 50px 110px;
    margin-top: 10px;
  margin-bottom: 11px;
    color:rgb(0, 0, 0)
}
#delivery-date {
    font-weight: bold;
    color:#07760b;
    margin-left: 10px;
}
form img{
 width:280px;
 height:280px;
 margin: 50px 10px 10px 90px;
 box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
 border-radius: 10px;

}
.form_group , .form_group1{
    margin:20px 0px  30px 50px;

}
.pro_nam1{
  display: flex;
  width: 35vw;
  
}

.order_title{
    display: flex;
    justify-content: space-around;
}
#pro_name{
  margin: 20px 0px 15px 15px;
  color:green;
}
.order_title img{
    width:140px;
    height:140px;
    margin-top: -12px;
    box-shadow: none;

}
.order_title h2{
    margin-top: 18px;
    font-size: 32px;
   
    color:rgb(7, 79, 7)
}
.order_input{
    width:200px;
    background-color: transparent;
    border: none;
    outline: none;
    margin-left: 0px;
    padding: 5px ;
    font-size: 20px;
    font-weight: bold;
}
.order_input1{
    width:100px;
    background-color: transparent;
    color:rgb(0, 0, 0);
    border: none;
    outline: none;
  
    padding: 5px ;
    font-size: 20px;
    font-weight: bold;
}
 .product_label, p{
    font-weight: bold;
    font-size: 23px;
   margin-top:20px;
 
}

#actual_price{
  text-decoration: line-through;
  color:rgb(9, 108, 9);
  font-weight: bold;
  font-size: 22px;
  margin-left: -10px;
}
#product_pri{
      width:100px;
}
.summary_btn{
    display: flex;
justify-content: space-around;
margin: 45px 0px 0px 0px;
}
.summary_btn button, .summary_btn #cancel_product{
    padding: 10px 40px ;
    border: none;
    color: #FFFFFF;
    text-align: center;
    font-size: 21px;
 
    background-color: #4c9a30;
    text-decoration:none;
}

/* --buttton styyle------- */
.summary_btn button:hover, .summary_btn #cancel_product:hover{
  
  background-color: #106909;
  font-weight: bold;
  color:rgb(255, 253, 253);
  box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;
}

.form_group1 span{
margin-left: 30px;
}
#cancel_product, button {
    display: inline-block;
    border-radius: 4px;
    border: none;
    color: #FFFFFF;
    text-align: center;
   
    width: 200px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 5px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;

  }
  
  .button span {
    cursor: pointer;
    display: inline-block;
    position: relative;
    transition: 0.5s;
  }
  
  .button span:after {
    content: "\00BB";
    position: absolute;
    opacity: 0;
    top: 0;
    right: -20px;
    transition: 0.2s;
    font-weight: bold;
  }
  
  .button:hover span {
    padding-right: 25px;
  }
  
  .button:hover span:after {
    opacity: 1;
    right: 0;
  }

  /* order quantity */
  #fertilizer{
  display: flex;
  }
  #option{
    padding: 5px 15px;
    font-size: 19px;
    margin-left: 20px;
    font-weight: bold;
    
  }

  /* full details covering div=-------------- */

  .product_details{
    display: flex;

  }

  /* order date----------------- */
  #order-date{
    color:rgb(0, 42, 255)
  }
  
  /* ------------loading symbol  -------- */
 
  /* .loader {
    border:15px solid #f3f3f3;
    border-top: 15px solid #ff0062;
    border-radius: 50%;
    width: 80px;
    height: 80px;
    animation: spin 3s linear infinite;
    margin-top: 50px;
  }
  
  
  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
   */
   .loader {
    background:transparent;
    background: radial-gradient(transparent, #fffefed8);
    bottom: 0;
    left: 0;
    overflow: hidden;
    position: fixed;
    right: 0;
    top: 0;
    z-index: 99999;
}

.loader-inner {
  bottom: 0;
  height: 60px;
  left: 0;
  margin: auto;
  position: absolute;
  right: 0;
  top: 0;
  width: 100px;
}

.loader-line-wrap {
  animation: 
  spin 1500ms cubic-bezier(.175, .885, .32, 1.275) infinite
;
  box-sizing: border-box;
  height: 50px;
  left: 0;
  overflow: hidden;
  position: absolute;
  top: 0;
  transform-origin: 50% 100%;
  width: 100px;
}
.loader-line {
  border: 4px solid transparent;
  border-radius: 100%;
  box-sizing: border-box;
  height: 100px;
  left: 0;
  margin: 0 auto;
  position: absolute;
  right: 0;
  top: 0;
  width: 100px;

}
.loader-line-wrap:nth-child(1) { animation-delay: -50ms; }
.loader-line-wrap:nth-child(2) { animation-delay: -100ms; }
.loader-line-wrap:nth-child(3) { animation-delay: -150ms; }
.loader-line-wrap:nth-child(4) { animation-delay: -200ms; }
.loader-line-wrap:nth-child(5) { animation-delay: -250ms; }
.loader-line-wrap:nth-child(6) { animation-delay: -300ms; }
.loader-line-wrap:nth-child(7) { animation-delay: -350ms; }
.loader-line-wrap:nth-child(8) { animation-delay: -400ms; }

.loader-line-wrap:nth-child(1) .loader-line {
  border-color: hsl(337, 100%, 50%);
  height: 90px;
  width: 90px;
  top: 7px;
}
.loader-line-wrap:nth-child(2) .loader-line {
  border-color: hsl(58, 100%, 50%);
  height: 76px;
  width: 76px;
  top: 14px;
}
.loader-line-wrap:nth-child(3) .loader-line {
  border-color: hsl(106, 100%, 50%);
  height: 62px;
  width: 62px;
  top: 21px;
}
.loader-line-wrap:nth-child(4) .loader-line {
  border-color: hsl(178, 91%, 50%);
  height: 48px;
  width: 48px;
  top: 28px;
}
.loader-line-wrap:nth-child(5) .loader-line {
  border-color: hsl(240, 100%, 57%);
  height: 34px;
  width: 34px;
  top: 35px;
}

@keyframes spin {
  0%, 15% {
  transform: rotate(0);
}
100% {
  transform: rotate(360deg);
}
}
</style>
</head>
<body>
	<main>
		<%
		Product product = (Product) request.getAttribute("PRODUCT_DETAILS");
		%>

		<div class="order_summary">

			<form action="order_summary_post" method="post">
				<div class="order_title">
					<h2>Order Summary</h2>
					<img
						src="https://www.sfu.ca/content/sfu/wwest/resources/White-Papers/white-papers---stem-careers/jcr:content/main_content/textimage_49483266/image.img.640.medium.png/1646934025752.png"
						alt="order_summary">
				</div>
				<div class="product_details">
					<div class="product_image">
						<img src="<%=product.getImageURL()%>" alt="<%=product.getName()%>">
					</div>

					<!-- loading symbol -->
					<div id="loader" class="loader" style="display: none;">
						<div class="loader">
							<div class="loader-inner">
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
								<div class="loader-line-wrap">
									<div class="loader-line"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="product_description">
						<div class="form_group">
						<input type="hidden" name="id" value="<%=product.getId()%>" /> 
							<div class="pro_nam1">
								<label class="product_label">Product Name : </label>

								<h2 class="order_inputh2" id="pro_name"><%=product.getName()%></h2>
							</div>
						</div>
						<div class="form_group">
							<div id="fertilizer">
								<h2>Order Qty</h2>
								<select name="quantity" id="option">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
								</select>
							</div>
						</div>
						<div class="form_group">
							<label class="product_label">Price : </label> <label for=""
								class="product_label">&#8377;</label> <input type="number"
								id="product_pri" class="order_input1" disabled> <label
								for="" class="product_label"> &#8377; </label> <input
								type="number" class="order_input1" id="actual_price" disabled>
						</div>
						<div class="form_group">
							<label for="weight" class="product_label">Product Weight
								:</label> <input id="weight" type="text" class="order_input" disabled>
						</div>
						<div class="form_group">
							<label for="discount" class="product_label">You Save :
								&#8377;</label> <input type="text" id="discount" class="order_input"
								disabled>
						</div>
						<div class="form_group1">
							<p>
								Order date: <span id="order-date"><%=java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG).format(Calendar.getInstance().getTime())%></span>

							</p>
						</div>
						<div class="form_group">
							<p>
								Delivery date: <span id="delivery-date"><%=java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG).format(java.util.Date
		.from(java.time.LocalDate.now().plusDays(7).atStartOfDay(java.time.ZoneId.systemDefault()).toInstant()))%></span>

							</p>
						</div>
					</div>
				</div>
				<div class="summary_btn">

					<a href="<%= request.getContextPath()%>//product/details?product_id=<%=product.getId() %>" id="cancel_product">Cancel</a>
					<button class="button" style="vertical-align: middle" type="submit">
						<span>Continue </span>
					</button>
				</div>

			</form>
		</div>
	</main>
	<script>
  const quantityDropdown = document.getElementById("option");
  const actualPriceInput = document.getElementById("actual_price");
  const discountInput = document.getElementById("discount");
  const productPriceInput = document.getElementById("product_pri");
  const productWeights = document.getElementById("weight");

  // Set initial values based on the loaded product
  actualPriceInput.value = '<%=product.getPrice()%>';
  discountInput.value = '<%=product.getDiscount()%>';
  productWeights.value = '<%=product.getProductWeight()%>';
  productPriceInput.value = '<%=product.getPrice() - product.getDiscount()%>';

  // ------------------ loader---------------
  const loader = document.getElementById("loader");

  quantityDropdown.addEventListener("change", () => {
    const quantity = Number(quantityDropdown.value);
    const actualPrice = '<%=product.getPrice()%>';
    const discount = '<%=product.getDiscount()%>'; // Retrieve the discount

    loader.style.display = "block"; // show the loader

    setTimeout(() => {
      // simulate a delay
      const totalPrice = quantity * actualPrice;
      const totalDiscount = quantity * discount; // Use the retrieved discount

      actualPriceInput.value = totalPrice;
      discountInput.value = totalDiscount;
      productPriceInput.value = (totalPrice - totalDiscount);

      loader.style.display = "none"; // hide the loader
    }, 2000); // change 3000 to the desired delay in milliseconds
  });
</script>


</body>
</html>