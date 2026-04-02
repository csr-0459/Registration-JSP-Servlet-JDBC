<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Success</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #4CAF50, #81C784);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        background: white;
        padding: 40px;
        border-radius: 12px;
        text-align: center;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        width: 350px;
    }

    .card h2 {
        color: #4CAF50;
        margin-bottom: 15px;
    }

    .card p {
        color: #555;
        font-size: 16px;
    }

    .success-icon {
        font-size: 60px;
        color: #4CAF50;
        margin-bottom: 15px;
    }

    .btn {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: 0.3s;
    }

    .btn:hover {
        background-color: #45a049;
    }
</style>

</head>
<body>

<div class="card">
    <div class="success-icon">✔</div>
    <h2>Successfully Registered!</h2>
    <p>Your account has been created successfully.</p>

    <a href="Login.jsp" class="btn">Go to Login</a>
</div>

</body>
</html>