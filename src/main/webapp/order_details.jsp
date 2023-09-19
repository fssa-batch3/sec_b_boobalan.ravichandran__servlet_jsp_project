<%@page import="in.fssa.fertagriboomi.service.ReviewsAndRatingsService"%>
<%@page import="in.fssa.fertagriboomi.model.Orders"%>
<%@page import="in.fssa.fertagriboomi.model.DeliveryAddresses"%>
<%@page import="in.fssa.fertagriboomi.model.OrderItems"%>
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
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/footer.css">
<title>order details</title>
<style>
.order_container {
	padding-top: 20px;
	padding-bottom: 20px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
	width: 98vw;
}

.single-order {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	width: 20vw;
	min-height: 25vh;
	padding: 1.5vh 2vw 3vh 2vw;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: 2vh 2vw;
	border-radius: 10px;
}

.single-order img {
	width: 15vw;
	height: 23vh;
}

.single-order h3 {
	color: rgb(18, 3, 150);
	min-height: 7vh;
}

.price-details {
	display: flex;
	justify-content: space-around;
	margin: 2vh 0;
	padding: .2vh 3vw;
}

.price-details h4 {
	color: green;
	font-size: 19px;
}

.price-details del {
	color: rgb(138, 1, 63);
	margin-top:.3vh;
}

.head-details {
	height: 5vh;
	background-color: rgb(2, 105, 66);
}

.total-price-details {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	height: 7vh;
	display: flex;
	justify-content: space-around;
	padding: 2vh 0;
	margin-bottom: 3vh;
}

.total-price-details h2 {
	display: flex;
}

.total-price-details p {
	margin-left: 1vw;
	color: green;
}

.total-price-details del {
	margin-left: 3vw;
	color: rgb(150, 3, 57);
}

.order-delivery-container {
	display: flex;
	justify-content: space-around;
}

.address-details {
	display: flex;
	margin: 1.9vh 0 2vh 5vw;
}

.address-details h3 {
	margin-left: 3vw;
	margin-top: .6vh;
}

.address-details-continer {
	margin-top: 5vh;
}

.address-details .ordate {
	margin-left: 7.5vw;
}

.address-details .deldate {
	margin-left: 7.3vw;
}

.address-details .street {
	margin-left: 8.7vw;
}

.address-details .local {
	margin-left: 10.7vw;
}

.address-details .city {
	margin-left: 13.8vw;
}

.address-details .pincode {
	margin-left: 11.1vw;
}

.address-details .state {
	margin-left: 9.5vw;
}

.address-details .name {
	margin-left: 5.5vw;
}

.address-details .state {
	margin-left: 12.8vw;
}

.address-details .mobile {
	margin-left: 5.7vw;
}

.address-details .status {
	margin-left: 7.6vw;
	color: green;
	font-size: 22px;
	margin-top: 0;
}
.single-order a{
text-decoration:none;
padding:1.5vh 1.5vw .5vh .9vw;
 color:rgb(12, 3, 142);
 font-weight:bold;
 display:flex;
}
.single-order a img{
width:2.5vw;
height:4vh;
margin-top:-1vh;
}
.single-order a:hover{
background-color: rgb(242, 242, 242);
box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
transition: all 0.4s;
border-radius:5px;

}
.cancel-order{
margin-left:10vw;
margin-top:-5vh;
margin-bottom:10vh;
}
.cancel-order a{
background-color:rgb(1, 93, 53);
  color:white;
  font-size: 18px;
  padding: 1vh 3vw;
  border-radius:5px;
  text-decoration:none;
}

.cancel-order a:hover{
box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
  background-color:rgb(31, 167, 108);
  transition: all 0.4s;
}
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<%
java.sql.Timestamp orderdate = null; // Initialize with null or any default value
java.sql.Timestamp deliveryDate = null; // Initialize with null or any default value
java.sql.Timestamp productOrder = null;
java.sql.Timestamp productDeliver = null;
int totalPrice = 0;
int totalDiscount = 0;
%>
<%
List<OrderItems> ordersList = (List<OrderItems>) request.getAttribute("ORDER_ITEMS_LIST");
DeliveryAddresses address = (DeliveryAddresses) request.getAttribute("ADDRESS_DETAILS");
Orders order = (Orders) request.getAttribute("ORDERS");
%>

<div class="total-orders">
    <div class="order_container">
        <%
        int orderList = ordersList.size();
        for (int i = 0; i < orderList; i++) {
            OrderItems orders = ordersList.get(i);
            if (i == 0) {
                orderdate = orders.getOrderDate();
                deliveryDate = orders.getDeliveryDate();
                productOrder = orders.getOrderDate();
                productDeliver = orders.getDeliveryDate();
            }
            totalPrice += orders.getPrice();
            totalDiscount += orders.getDiscount();
            
            java.util.Date currentDateValue = new java.util.Date();
        %>
        <div class="single-order">
            <img src="<%=orders.getProductImage()%>"
                alt="<%=orders.getProductName()%>">
            <h3><%=orders.getProductName()%></h3>
            <div class="price-details">
                <h4>
                    &#8377;<%=orders.getPrice() - orders.getDiscount()%></h4>
                <del>
                    &#8377;<%=orders.getDiscount()%></del>
            </div>
            <%
         
                if (currentDateValue.compareTo(productDeliver) >= 0 && order.isStatus() ) {
                	boolean isReviewsExists = new ReviewsAndRatingsService().findRatingAndReiewsByOrderItemId(orders.getId());
                	if(!isReviewsExists){
                   %>
            <a href="<%= request.getContextPath()%>/my_order/order_details/review_ratings?product_id=<%=orders.getProductId() %>&order_item_id=<%=orders.getId() %>&name=<%=address.getPersonName() %>&order_id=<%=order.getId() %>"><img src="<%= request.getContextPath()%>/assets/images/star.webp" alt="facebook">Rate & Review Product</a>
            <%}} %>
        </div>
        <%
        }
        %>
    </div>
</div>

<div class="head-details"></div>
<div>
    <div class="total-price-details">
        <h2>
            Total Price:
            <p>
                &#8377;<%=totalPrice - totalDiscount%></p>
            <del>
                &#8377;<%=totalPrice%></del>
        </h2>
        <h2>
            Total Discount:
            <p>
                &#8377;<%=totalDiscount%></p>
        </h2>
    </div>
    <%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");

    String orderDateStr = formatter.format(orderdate);
    String deliveryDateStr = formatter.format(deliveryDate);

    java.util.Date currentDate = new java.util.Date();

    String orderStatus = "";

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
    %>
    <div class="order-delivery-container">
        <div class="address-details-continer">

            <div class="address-details">
                <h2>Ordered date:</h2>
                <h3 class="ordate"><%=orderDateStr%></h3>
            </div>
            <div class="address-details">
                <h2>Delivery Date:</h2>
                <h3 class="deldate"><%=deliveryDateStr%></h3>
            </div>

            <div class="address-details">
                <h2>Steet Name:</h2>
                <h3 class="street"><%=address.getStreetName()%>,
                </h3>
            </div>
            <div class="address-details">
                <h2>Location:</h2>
                <h3 class="local"><%=address.getLocation()%>,
                </h3>
            </div>
            <div class="address-details">
                <h2>City:</h2>
                <h3 class="city"><%=address.getCity()%>,
                </h3>
            </div>
            <div class="address-details">
                <h2>Pincode:</h2>
                <h3 class="pincode"><%=address.getPincode()%>,
                </h3>
            </div>
            <div class="address-details">
                <h2>Customer Name:</h2>
                <h3 class="name"><%=address.getPersonName()%>,
                </h3>
            </div>
            <div class="address-details">
                <h2>State:</h2>
                <h3 class="state"><%=address.getState()%>,
                </h3>
            </div>
            <div class="address-details">
                <h2>Mobile Number:</h2>
                <h3 class="mobile"><%=address.getMobileNumber()%>.
                </h3>
            </div>
            <div class="address-details">
                <h2>Order Status:</h2>
                <h3 class="status"><%=orderStatus%></h3>
            </div>
        </div>
        <div>
            <img
                src="<%=request.getContextPath()%>/assets/images/order_delicver-transformed.jpeg"
                alt="shopping image">
        </div>
    </div>
 <div class="cancel-order">
    <%
    if (currentDate.compareTo(deliveryDate) == -1 && order.isStatus()) {
    %>
    <a href="<%=request.getContextPath()%>/order_details/cancel_order?order_id=<%=order.getId() %>">Cancel Order</a>
    <%
    }
    %></div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>