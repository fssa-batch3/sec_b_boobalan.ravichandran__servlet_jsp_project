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
    margin: 0 7vh 0 0 0;
    padding: 0;
    background-color: #f2f2f2;
}

h1 {
    text-align: center;
    margin-top: 10px;
     margin-bottom: 5vh;
}

form {
    max-width: 400px;
    margin: 10vh auto;
    padding: 4vh 5vw 6vh 5vw;
    background-color: #fff;
    border-radius: 5px;
  box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
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
input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="tel"]:focus{
 
outline: 1.5px solid rgb(76, 194, 236);
}
button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 2vh 13vw;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-top:2vh;
   
}

button[type="submit"]:hover {
    background-color: #45a049;
    box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
}

.logo_img{
width:20vw;
height:12.5vh;
margin-left: 3vw;
}
</style>
</head>
<body>
 
    <form action="create" method="post">
    <a href="../home_page"> <img src="https://iili.io/Hyihp7S.md.png" alt="logo for fert agri boomi" class="logo_img"/></a>
    <h1>Create Account</h1>
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