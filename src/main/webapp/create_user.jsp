<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

h1 {
    text-align: center;
    margin-top: 30px;
}

form {
    max-width: 400px;
    margin: 0 auto;
    padding: 80px 70px 80px 60px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

form div {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="password"],
input[type="tel"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

button[type="submit"]:hover {
    background-color: #45a049;
}


</style>
</head>
<body>
 <h1>Registration Form</h1>
    <form action="create" method="post">
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
</body>
</html>