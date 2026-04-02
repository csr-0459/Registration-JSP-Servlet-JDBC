<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        height: 100vh;
        background: linear-gradient(135deg, #667eea, #764ba2);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        width: 400px;
        box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        animation: fadeIn 0.8s ease-in-out;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    label {
        font-size: 14px;
        color: #555;
        margin-top: 10px;
        display: block;
    }

    input, textarea {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 6px;
        outline: none;
        transition: 0.3s;
    }

    input:focus, textarea:focus {
        border-color: #667eea;
        box-shadow: 0 0 5px rgba(102,126,234,0.5);
    }

    textarea {
        resize: none;
        height: 70px;
    }

    .btn {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background: #667eea;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn:hover {
        background: #5a67d8;
    }

    .footer-text {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
    }

    .footer-text a {
        color: #667eea;
        text-decoration: none;
    }

    .footer-text a:hover {
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>

<div class="container">
    <h2>Create Account</h2>

    <form action="<%= request.getContextPath() %>/register" method="post">

        <label>Roll Number</label>
        <input type="text" name="rollNo" required />

        <label>First Name</label>
        <input type="text" name="firstName" required />

        <label>Last Name</label>
        <input type="text" name="lastName" required />

        <label>Username</label>
        <input type="text" name="userName" required />

        <label>Password</label>
        <input type="password" name="password" required />

        <label>Address</label>
        <textarea name="address" required></textarea>

        <label>Contact</label>
        <input type="number" name="contact" required />

        <input type="submit" value="Register" class="btn" />

    </form>

    <div class="footer-text">
        Already have an account? <a href="login">Login</a>
    </div>
</div>

</body>
</html>