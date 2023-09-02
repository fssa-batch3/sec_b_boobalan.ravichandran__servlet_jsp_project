<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="icon" type="image/x-icon" href="https://iili.io/J9HTxWb.png">
<title>Product Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding-botton:50px;
        height:100%;
    }
    .header {
        background-color: green;
        color: #fff;
        padding: 10px;
        text-align: center;
    }
    .product-details {
        display: flex;

        align-items: flex-start;
        padding: 50px 20px;
        width:80%;
        
    }
    img {
        width: 450px;
        height: 400px;
        margin-right: 20px;
    }
    .product-info {
        margin-left:10vw;
        
    }
    .product-name {
        font-size: 35px;
        font-weight: bold;
        color:#5e6f22;
            margin-top: 100px;
    }
    .manufacturer {
        margin-top: 20px;
         font-size: 25px;
         width:500px;
    }
    .buy-button {
        margin-top: 20px;
        
    }
    .description {
        margin-top: 5vh;
           margin-left:6vw;
           width:80%;
    }
    .application {
        margin-top: 5vh;
           margin-left:6vw;
            width:80%;
    }
    .benefits {
        margin-top: 5vh;
         width:80%;
           margin-left:6vw;
            margin-bottom:8vw;
    }
    .buy-button button{
    margin-top: 50px;
    width:300px;
    height:50px;
     font-size: 18px;
     background-color:#382798;
        color:white;
       border-radius: 10px;
    }
    .details_cart{
    padding-bottom: 40px;
    }
   .decription strong{
    font-size: 28px;
   }
</style>
</head>
<body>
   <%
    	Product product = (Product) request.getAttribute("productDetails");
    %>
    <div class="container">
        <div class="header">
            <h1>Product Details</h1>
        </div>
        <div class="product-details">
            <div class="product-image">
                <img src="<%= product.getImageURL()%>" alt="<%= product.getName()%>">
            </div>
            <div class="product-info">
                <div class="product-name"><%= product.getName()%></div>
                <div class="manufacturer">Manufacturer: <%= product.getManufacture()%></div>
                
                 <div class="manufacturer">Price: <%= product.getPrice() %></div>
                <div class="buy-button">
                    <button>Buy Now</button>
                </div>
            </div>
        </div>
        <div class="details_cart">
        <div class="description">
            <h2>Description:</h2><br><%= product.getDescription()%>
        </div>
        <div class="application">
            <h2>Application:</h2><br><%= product.getApplication()%>
        </div>
        <div class="benefits">
            <h2>Benefits:</h2><br><%= product.getBenefits() %>
        </div>
        
        </div>
    </div>
</body>
</html>
