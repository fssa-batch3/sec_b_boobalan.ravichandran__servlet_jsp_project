<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Rating and Reviews</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

html {
	background-image: url(<%=request.getContextPath()%>/assets/images/feedback.jpg;);
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

body {
	height: 100%;
	margin: 0;
	padding: 43% 30% 0 28%;
	background: transparent;
}

.container {
	position: relative;
	width: 700px;
	background: #111;
	padding: 20px 30px;
	border: 1px solid #444;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3)
		0px 3px 7px -3px;
}

.container .post {
	display: none;
}

.container .text {
	font-size: 25px;
	color: #666;
	font-weight: 500;
}

.container .edit {
	position: absolute;
	right: 10px;
	top: 5px;
	font-size: 16px;
	color: #666;
	font-weight: 500;
	cursor: pointer;
}

.container .edit:hover {
	text-decoration: underline;
}

.container .star-widget input {
	display: none;
}

.star-widget label {
	font-size: 40px;
	color: #b9b9b9;
	padding: 10px;
	float: right;
	transition: all 0.2s ease;
}

.container.feedback {
	margin-top: -400px;
}

input:not(:checked) ~ label:hover, input:not(:checked) ~ label:hover ~
	label {
	color: #fd4;
}

input:checked ~ label {
	color: #fd4;
}

/* Define Unicode code points for emojis */
#rate-1:checked ~ form header:before {
    content: "I just hate it \1F605"; /* U+1F605 for 😅 */
}

#rate-2:checked ~ form header:before {
    content: "Not helpful \1F610"; /* U+1F610 for 😐 */
}

#rate-3:checked ~ form header:before {
    content: "It is awesome \1F60D"; /* U+1F60D for 😍 */
}

#rate-4:checked ~ form header:before {
    content: "Very helpful \1F609"; /* U+1F609 for 😉 */
}

#rate-5:checked ~ form header:before {
    content: "Extremely useful \1F604"; /* U+1F604 for 😄 */
}


.container form {
	display: none;
}

input:checked ~ form {
	display: block;
}

form header {
	width: 100%;
	font-size: 25px;
	color: #fe7;
	font-weight: 500;
	margin: 5px 0 20px 0;
	text-align: center;
	transition: all 0.2s ease;
}

form .textarea {
	height: 200px;
	width: 100%;
	overflow: hidden;
}

form .textarea textarea {
	height: 100%;
	width: 100%;
	outline: none;
	color: #eee;
	border: 1px solid #333;
	background: #222;
	padding: 10px;
	font-size: 17px;
	resize: none;
}

.textarea textarea:focus {
	border-color: #444;
}

form .btn {
	height: 45px;
	width: 100%;
	margin: 15px 0;
}

form .btn button {
	height: 100%;
	width: 100%;
	border: 1px solid #ffe600;
	outline: none;
	border-radius: 5px;
	background: #222;
	color: #ffd000;
	font-size: 17px;
	font-weight: 500;
	text-transform: uppercase;
	cursor: pointer;
	transition: all 0.3s ease;
}

form .btn button:hover {
	background: #ffd500;
	color: black;
	border-radius: 5px;
	box-shadow: rgba(40, 40, 40, 0.523) 0px 1px 2px 0px,
		rgba(255, 255, 255, 0.491) 0px 2px 6px 2px;
}

/* exit */
.exit {
	color: white;
	margin-left: -100;
}

.selected {
	margin-top: -50vh;
}
</style>
</head>
<body>
	<%
	int productId = (int) request.getAttribute("OR_PRODUCT_ID");
	int orderId = (int) request.getAttribute("ORDER_ID");
	int orderItemId = (int) request.getAttribute("OR_ITEM_ID");
	String customerName = (String) request.getAttribute("CUSTOMER_NAME");
	%>
	<div class="container" id="feedback-container">
		<div class="star-widget">
			<input type="radio" name="rate" id="rate-5" value="5"> <label
				for="rate-5" class="fas fa-star"></label> <input type="radio"
				name="rate" id="rate-4" value="4"> <label for="rate-4"
				class="fas fa-star"></label> <input type="radio" name="rate"
				id="rate-3" value="3"> <label for="rate-3"
				class="fas fa-star"></label> <input type="radio" name="rate"
				id="rate-2" value="2"> <label for="rate-2"
				class="fas fa-star"></label> <input type="radio" name="rate"
				id="rate-1" value="1"> <label for="rate-1"
				class="fas fa-star"></label>

			<form id="feedback-form" action="review_ratings_create" method="post">
				<header></header>
				<input type="hidden" name="rating" id="ratings"> <input
					type="hidden" name="customer_name" value="<%=customerName%>" >
				<input type="hidden" name="product_id" value="<%=productId%>">
				<input type="hidden" name="order_id" value="<%=orderId%>">
				<input type="hidden" name="order_item" value="<%=orderItemId%>">
				<div class="textarea">
					<textarea id="feedback-text" cols="30" name="feedback_pro"
						placeholder="Describe your experience.."></textarea>
				</div>
				<div class="btn">
					<button type="submit" id="postFeedback">Post</button>
				</div>
				<div class="btn">
					<a href="<%=request.getContextPath()%>/order/order_details?order_id=<%=orderId %>"><button type="button" id="exitFeedback">Cancel</button></a>
				</div>
			</form>
		</div>
	</div>

	<script>
    // Get all star elements
    const stars = document.querySelectorAll('.fas.fa-star');

    // Get the feedback container
    const feedbackContainer = document.getElementById('feedback-container');

    // Add a click event listener to each star
    stars.forEach(star => {
        star.addEventListener('click', () => {
            // Remove any previously added classes
            feedbackContainer.classList.remove('selected');
            // Add the 'selected' class to the container when a star is clicked
            feedbackContainer.classList.add('selected');
        });
    });

    // Get the form and submit button
    const feedbackForm = document.getElementById('feedback-form');
    const postButton = feedbackForm.querySelector('button[type="submit"]');
    const feedbackText = document.getElementById("feedback-text");

    // Add an event listener for the form submission
    feedbackForm.addEventListener("submit", (event) => {
        // Get the selected rating
        const rating = document.querySelector('input[name="rate"]:checked');

        // Check if rating is null and if feedback text is empty
        if (rating === null) {
            alert("Please select a rating before posting feedback.");
            event.preventDefault(); // Prevent form submission
        } else if (feedbackText.value.trim() === "") {
            alert("Please enter feedback before posting.");
            event.preventDefault(); // Prevent form submission
        } else {
            // Set the inputValue when the form is submitted
            const inputValue = document.getElementById("ratings");
            inputValue.value = rating.value;
        }
    });
</script>


</body>
</html>