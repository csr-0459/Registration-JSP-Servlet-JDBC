<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #2196F3, #64B5F6);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-container {
        background: #fff;
        padding: 35px;
        border-radius: 10px;
        box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
        width: 350px;
        text-align: center;
    }

    .login-container h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: 0.3s;
        box-sizing: border-box;
    }

    input:focus {
        border-color: #2196F3;
        box-shadow: 0 0 5px rgba(33,150,243,0.5);
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #2196F3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #1976D2;
    }

    .extra-links {
        margin-top: 15px;
        font-size: 14px;
    }

    .extra-links a {
        text-decoration: none;
        color: #2196F3;
    }

    .extra-links a:hover {
        text-decoration: underline;
    }

    /* ✅ NEW — Error box styles */
    .error-box {
        background-color: #ffe0e0;
        border: 1px solid #f44336;
        border-radius: 6px;
        padding: 10px;
        margin-bottom: 15px;
        color: #c62828;
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .error-box span.icon {
        font-size: 18px;
    }

    /* ✅ NEW — shake animation on error */
    .shake {
        animation: shake 0.4s ease;
    }

    @keyframes shake {
        0%   { transform: translateX(0); }
        25%  { transform: translateX(-8px); }
        50%  { transform: translateX(8px); }
        75%  { transform: translateX(-8px); }
        100% { transform: translateX(0); }
    }
</style>

</head>
<body>

<div class="login-container">
    <h2>Login</h2>

    <%-- ✅ THIS IS THE KEY FIX — Show error message from Servlet --%>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="error-box shake">
            <span class="icon">⚠️</span>
            <span><%= errorMessage %></span>
        </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/login" method="post">

        <input type="text"     name="userName" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="submit"   value="Login" />

    </form>

    <div class="extra-links">
        <p>Don't have an account? <a href="register">Register here</a></p>
    </div>
</div>

</body>
</html>