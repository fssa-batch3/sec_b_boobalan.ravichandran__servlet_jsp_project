<%@page import="java.util.Collections"%>
<%@page import="in.fssa.fertagriboomi.service.OrdersService"%>
<%@page import="in.fssa.fertagriboomi.model.DeliveryDateSelector"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.fssa.fertagriboomi.service.DeliveryAddressService"%>
<%@page import="in.fssa.fertagriboomi.model.DeliveryAddresses"%>
<%@page import="in.fssa.fertagriboomi.model.OrderItems"%>
<%@page import="in.fssa.fertagriboomi.model.Orders"%>
<%@page import="java.util.*"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.List, java.util.Calendar, java.util.ArrayList"%>

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

<title>Users Orders</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lora', serif;
}


.orders-container {
	display: flex;
	padding: 10px 20px 30px 20px;
	overflow-x: scroll;
	max-width: 90vw;

}

.orders-container::-webkit-scrollbar {
	display: none;
}

.single-order-container {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	margin: 2vh 2.5vw;
	padding: 2vh 2vw;
	width: 14vw;
	border-radius: 10px;
	background-color:white;
}

.single-order-container img {
	width: 10vw;
	height: 18vh;
}

.total-orders {
	margin: 5vh 0;
	display: grid;
	
	place-items: center; /* Center both horizontally and vertically */
	
}

.pro-name {
	text-align: center;
	margin: 1.5vh 0vw;

}

.quantity {
	margin: 1.5vh 1.9vw;
	display: flex;
}

.quantity h5 {
	font-size: 15px;
	margin: 0vh 0 0 .7vw;
}

.every-order {
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	margin: 2vh 0;
	min-width: 90vw;
	border-radius: 10px;
	background-color: rgba(232, 232, 232, 0.929);
}
.all_add-div{
display:flex;
justify-content:space-around;
margin: 1vh 0 4vh 0;
}
.address-div h3{
padding: 1vh 0;
}
.order-date h4{
padding: 1vh 0;
}
#deliveryDateSelect, #deliveryDateSelect option{
padding: .7vh 2vw;
font-size:16px;
}
.change button{
border:none;
 background-color: rgb(13, 115, 218);
 color:white;
 border-radius: 5px;
 font-size: 17px;
 padding: 1vh 2vw;
 margin-top: 2vh;
}
.change button:hover{
box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
cursor:pointer;
}

.order-date{
display:flex;
}
.order-date h5{
margin:1.3vh 0 0 1vw;
color:green;
font-size:16px;
}
.empty-div{
height:10vh;
}
</style>
</head>
<body>
	<jsp:include page="/admin_header.jsp"></jsp:include>
	<%
	List<Orders> orderList = (List<Orders>) request.getAttribute("ORDERS_LIST");
	Collections.reverse(orderList);
	%>

	<div class="total-orders">
		<%
		if (orderList != null && !orderList.isEmpty()) {
			for (Orders order : orderList) {
				java.sql.Timestamp orderdate = null; // Initialize with null or any default value
				java.sql.Timestamp deliveryDate = null; // Initialize with null or any default value
		%>
		<div class="every-order">
			<div class="orders-container">
				<%
				List<OrderItems> orderItemsList = new OrdersService().findAllOrderItemsByOrderId(order.getId());
				for (OrderItems orderSingle : orderItemsList) {
					orderdate = orderSingle.getOrderDate();
					deliveryDate = orderSingle.getDeliveryDate();
				%>

				<div class="single-order-container">
					<img src="<%=orderSingle.getProductImage()%>"
						alt="<%=orderSingle.getProductName()%>">
					<h4 class="pro-name"><%=orderSingle.getProductName()%></h4>
					<div class="quantity">
						<h4>Order Qty:</h4>
						<h5><%=orderSingle.getQuantity()%></h5>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="all_add-div">
				<div class="address-div">
					<h3>Address details:</h3>
					<%
					DeliveryAddresses address = new DeliveryAddressService().findAddressById(order.getAddressId());
					%>
					<p><%=address.getStreetName()%>,
						<%=address.getLocation()%>,
					</p>
					<p>
						<%=address.getState()%></p>
					<p><%=address.getCity()%>
						-
						<%=address.getPincode()%></p>

				</div>

				<%
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				String deliveryDateStr = deliveryDate != null ? dateFormat.format(deliveryDate) : "";
				SimpleDateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy hh:mma");
				String orderDateStr = orderdate != null ? dateFormat1.format(orderdate) : "";

				List<java.util.Date> deliveryDateOptions = DeliveryDateSelector.getDeliveryDateOptions(deliveryDate);
				List<java.sql.Date> sqlDeliveryDateOptions = DeliveryDateSelector.convertDatesToSqlDates(deliveryDateOptions);
				  
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
				
				<div class="order-delivery-date">
					<div class="order-date">
						<h4>Ordered Date:</h4>
						<h5><%=orderDateStr%></h5>
					</div>
					<div class="order-date">
						<h4>Delivery Date:</h4>
						<h5><%=deliveryDateStr%></h5>
					</div>
					<div class="order-date">
						<h4>Status: </h4>
						<h5><%=orderStatus %></h5>
					</div>
				</div>
		<%java.sql.Date deliveryDateSql = new java.sql.Date(deliveryDate.getTime()); %>
<div class="change-date-div">
    <form action="change_delivery_date" method="post">
        <select name="delivery-date" id="deliveryDateSelect" data-current-date="<%= deliveryDateSql.toString() %>">    
            <% for (java.sql.Date sqlDeliveryDateOption : sqlDeliveryDateOptions) {
                    String option1 = sqlDeliveryDateOption.toString();
                    String option2 = deliveryDateSql.toString();
                %>
                <option value="<%=sqlDeliveryDateOption%>"
                    <%if (option1.equals(option2)) {%>
                    selected <%}%>>
                    <%=dateFormat.format(sqlDeliveryDateOption)%>
                </option>
                <%
                }
                %>
        </select>
        <input type="hidden" name="order-id" value="<%=order.getId()%>">
         <%
    if (currentDate.compareTo(deliveryDate) <= 0 && order.isStatus()) {
    %>
        <div class="change">
            <button type="submit">Change Delivery Date</button>
        </div>
        <%} %>
    </form>
</div>

</div>
</div>
<%
}
}
%>
</div>
<div class="empty-div"></div>
<script>
const deliveryDateSelect = document.getElementById('deliveryDateSelect');
const changeDeliveryDateButton = document.querySelector('button[type="submit"]');

changeDeliveryDateButton.addEventListener('click', function (event) {
    // Get the selected delivery date.
    const selectedDate = new Date(deliveryDateSelect.value);

    // Get the current delivery date from the data attribute.
    const currentDeliveryDateStr = deliveryDateSelect.getAttribute('data-current-date');
    const currentDeliveryDate = new Date(currentDeliveryDateStr);

    // Check if the user has selected a new delivery date.
    //console.log("currentDeliveryDate " + currentDeliveryDate);
    //console.log("selectedDate " + selectedDate);
    if (selectedDate.getTime() === currentDeliveryDate.getTime()) {
        // Prevent the form from submitting.
        event.preventDefault();

        // Show an alert to the user.
        alert('Please select a new delivery date.');
    }
});
</script>


</body>
</html>