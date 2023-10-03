
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.fssa.fertagriboomi.service.OrdersService"%>
<%@page import="in.fssa.fertagriboomi.model.OrderItems"%>
<%@page import="in.fssa.fertagriboomi.service.DeliveryAddressService"%>
<%@page import="in.fssa.fertagriboomi.model.DeliveryAddresses"%>
<%@page import="in.fssa.fertagriboomi.model.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Neuton:ital,wght@0,200;0,300;1,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<title>My orders</title>
<style>
.total-orders-conatiner {
	padding: 5vh 10vw;
}

.total-orders-conatiner {
	padding: 1vh 10vw 5vh 10vw;
}

.orders_container {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	width: 78.6vw;
	min-height: 40vh;
	margin-top: 8vh;
	border-radious: 10px;
}

.orders_container_details {
	display: flex;
}

.order-items-conatiner {
	width: 50vw;
	display: flex;
	margin-top: 1.6vh;
	justify-content: center;
	align-items: center;
	padding-bottom: 3vh;
}

.order-items-conatiner::-webkit-scrollbar {
	display: none;
}

.single-order img {
	width: 10vw;
	height: 15vh;
	margin-left: 1vw;
}

.single-order  p {
	width: 12vw;
}

.color-head {
	height: 3vw;
	background-color: #07357f;
	display: flex;
	justify-content: space-between;
	padding: 1vh 5vw;
}

.color-heads {
	border-top: 1.5px solid rgba(206, 206, 206, 0.845);
	height: 2.7vw;
	width: 78.7vw;
	background-color: rgb(245, 245, 245);
	box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px
		2px;
	display: flex;
	padding-top: .9vh;
}

.color-heads h3 {
	margin-left: 60vw;
}

.color-heads h4 {
	margin-left: .6vw;
	letter-spacing: 1.5px;
	font-size: 20px;
	color: green;
}

.single-order {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	border-radius: 10px;
	height: 28vh;
	padding: 2.5vh;
	width: 15vw;
	margin: 2vh 3vw;
}

.product_name {
	text-align: center;
	color: rgb(186, 2, 57);
	font-weight: bold;
}

.order-item-count {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	border-radius: 10px;
	height: 28vh;
	text-align: center;
	color: rgba(88, 88, 88, 0.71);
	font-size: 30px;
	font-weight: bold;
	width: 15vw;
	padding: 6vh 3vw;
	background-color: rgba(255, 255, 255, 0.861);
}

.order-item-count img {
	width: 2.5vw;
	height: 4vh;
}

.order-person-details {
	display: flex;
}

.order-person-details h3 {
	color: white;
}

.order-person-details p {
	color: rgb(243, 227, 0);
	font-weight: bold;
	font-size: 18px;
	margin-left: 1vw;
}

a {
	text-decoration: none;
}

.order-item-count:hover {
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	cursor: pointer;
	transition: all 0.4s;
}

.order_date_deails {
	display: flex;
	margin: 2vw 0;
}

.order_date_deails_container {
	margin: 2vh 2vw 2vh 0;
}

.order_date_deails p {
	font-weight: bold;
	margin-left: 1vw;
	color: rgb(186, 13, 91);
}

.order_date_deails img {
	width: 2.5vw;
	height: 4vh;
	margin-top: -.6vh;
	margin-left: .5vw;
}

.order_date_deails h4 {
	font-size: 20px;
}

.view-details {
	padding: 1vh 3vw .6vh 3vw;
}

.view-details:hover {
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.4s;
}

.order-status p {
	color: green;
	font-size: 20px;
}

.no-orders-found img {
	width: 35vw;
	height: 70h;
	border-radius: 10px;
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px
		6px 6px;
}

.no-orders-found {
	margin: 3vh 0 1.5vh 22vw;
}
</style>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="total-orders-conatiner">

		<%
		int totalPrice = 0;
		int totalDiscount = 0;
		java.sql.Timestamp orderdate = null; // Initialize with null or any default value
		java.sql.Timestamp deliveryDate = null; // Initialize with null or any default value

		List<Orders> ordersList = (List<Orders>) request.getAttribute("MY_ORDERS");
		if (ordersList != null && !ordersList.isEmpty()) {
			for (Orders order : ordersList) {
				DeliveryAddresses address = new DeliveryAddressService().findAddressById(order.getAddressId());
		%>

		<div class="orders_container">
			<div class="color-head">
				<div class="order-person-details">
					<h3>Order Id:</h3>
					<p><%=order.getId()%></p>
				</div>
				<div class="order-person-details">
					<h3>Customer Name:</h3>
					<p><%=address.getPersonName()%></p>
				</div>
			</div>

			<div class="orders_container_details">
				<div class="order-items-conatiner">
					<%
					List<OrderItems> orderItemsList = new OrdersService().findAllOrderItemsByOrderId(order.getId());
					int orderItemsCount = orderItemsList.size(); // Get the count of order items
					if (orderItemsCount > 2) {
						totalPrice = 0;
						totalDiscount = 0;
						// Display only two order items if there are more than two
						for (int i = 0; i < 1; i++) {
							OrderItems orderItem = orderItemsList.get(i);
							if (i == 0) {
						orderdate = orderItem.getOrderDate();
						deliveryDate = orderItem.getDeliveryDate();

							}
					%>
					<div class="single-order">
						<img src="<%=orderItem.getProductImage()%>"
							alt="<%=orderItem.getProductName()%>">
						<div class="product_name">
							<p><%=orderItem.getProductName()%></p>
						</div>
					</div>
					<%
					}
					for (int i = 0; i < orderItemsCount; i++) {
					OrderItems orderItemValue = orderItemsList.get(i);
					totalPrice += orderItemValue.getPrice();
					totalDiscount += orderItemValue.getDiscount();
					}
					%>
					<!-- Display the count of order items -->
					<a
						href="<%=request.getContextPath()%>/order/order_details?order_id=<%=order.getId()%>">
						<div class="order-item-count">
							<img src="./assets/images/plus.png" alt="plus icon">
							<p><%=orderItemsCount - 1%>
								More Items
							</p>
						</div>
					</a>
					<%
					} else {
					totalPrice = 0;
					totalDiscount = 0;
				
					for (OrderItems orderItem : orderItemsList) {
						totalPrice += orderItem.getPrice();
						totalDiscount += orderItem.getDiscount();
						orderdate = orderItem.getOrderDate();
						deliveryDate = orderItem.getDeliveryDate();
					%>
					<div class="single-order">
						<img src="<%=orderItem.getProductImage()%>"
							alt="<%=orderItem.getProductName()%>">
						<div class="product_name">
							<p><%=orderItem.getProductName()%></p>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
				<div class="order_date_deails_container">
					<%
					SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mma");
					SimpleDateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
					String orderDateStr = orderdate != null ? dateFormat.format(orderdate) : "";
					String deliveryDateStr = deliveryDate != null ? dateFormat1.format(deliveryDate) : "";

					java.util.Date currentDate = new java.util.Date();
					String orderStatus = "";

					if (deliveryDate != null) {
						if (currentDate.compareTo(deliveryDate) >= 0) {
							if (order.isStatus()) {
						orderStatus = "Delivered";
							} else {
						orderStatus = "Cancelled";
							}
						} else {
							if (order.isStatus()) {
						orderStatus = "Not Delivered";
							} else {
						orderStatus = "Cancelled";
							}
						}
					}
					%>

					<div class="order_date_deails">
						<h3>Ordered Date:</h3>
						<p class="p"><%=orderDateStr%></p>
					</div>
					<div class="order_date_deails">
						<h3>Delivery Date:</h3>
						<p class="p"><%=deliveryDateStr%></p>
					</div>
					<div class="order_date_deails order-status">
						<h3>Order Status:</h3>
						<p><%=orderStatus%></p>
					</div>
					<a
						href="<%=request.getContextPath()%>/order/order_details?order_id=<%=order.getId()%>"><div
							class="order_date_deails view-details">
							<h4>View details</h4>
							<img src="./assets/images/eye.png" alt="view Details">
						</div></a>
				</div>
			</div>
		</div>
		<div class="color-heads">
			<h3>Total Price:</h3>
			<h4>
				&#8377;<%=totalPrice - totalDiscount%></h4>
		</div>
		<%
		}
		} else {
		%>
		<div class="no-orders-found">
			<img src="https://iili.io/JJf9TXa.jpg" alt="no orders found">
		</div>
		<%
		}
		%>

	</div>

	<jsp:include page="/footer.jsp"></jsp:include>

	<script src="<%=request.getContextPath()%>/javascript/search.js">
		
	</script>

</body>
</html>