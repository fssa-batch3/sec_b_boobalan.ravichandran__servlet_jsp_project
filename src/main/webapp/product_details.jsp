<%@page import="in.fssa.fertagriboomi.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }
    h1 {
        background-color: green;
        color: #fff;
        padding: 10px;
        text-align: center;
    }
    table {
        width: 60%;
        height:100%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: green;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    img {
        display: block;
        margin: 0 auto;
        max-width: 220px;
        max-height: 200px;
    }
</style>
</head>
<body>
    <h1>Product Details</h1>
    <%
    	Product product = (Product) request.getAttribute("productDetails");
    %>
    <table>
        <tr>
            <th>Title</th>
            <th>Details</th>
        </tr>
        <tr>
            <td>Product ID:</td>
            <td><%= product.getId() %></td>
        </tr>
        <tr>
            <td>Product Name:</td>
            <td><%= product.getName()%></td>
        </tr>
        <tr>
            <td>Product Description:</td>
            <td><%= product.getDescription()%></td>
        </tr>
        <tr>
            <td>Product Application:</td>
            <td><%= product.getApplication()%></td>
        </tr>
        <tr>
            <td>Product Benefits:</td>
            <td><%= product.getBenefits() %></td>
        </tr>
        <tr>
            <td>Product Image:</td>
            <td><img src="<%= product.getImageURL()%>" alt="<%= product.getName()%> Image" ></td>
        </tr>
    </table>
</body>
</html>
