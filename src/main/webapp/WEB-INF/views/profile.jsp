<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%-- ✅ Redirect to login if session is missing --%>
<%
    if (session.getAttribute("user_name") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .card {
            background: white;
            border-radius: 12px;
            padding: 35px;
            width: 480px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            color: #667eea;
            margin-bottom: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #ddd;
            padding: 10px 14px;
            text-align: left;
        }
        th {
            background-color: #667eea;
            color: white;
            width: 35%;
        }
        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }
        .logout-btn {
            display: block;
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            background: #667eea;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background: #5a67d8;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Welcome, ${sessionScope.user_name} 👋</h2>

    <table>
        <tr><th>Roll No</th>    <td>${sessionScope.roll_no}</td></tr>
        <tr><th>First Name</th> <td>${sessionScope.first_name}</td></tr>
        <tr><th>Last Name</th>  <td>${sessionScope.last_name}</td></tr>
        <tr><th>Username</th>   <td>${sessionScope.user_name}</td></tr>
        <tr><th>Address</th>    <td>${sessionScope.address}</td></tr>
        <tr><th>Contact</th>    <td>${sessionScope.contact}</td></tr>
    </table>

    <a href="login" class="logout-btn">Logout</a>
</div>

</body>
</html>