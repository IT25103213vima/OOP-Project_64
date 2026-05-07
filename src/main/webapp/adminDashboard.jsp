<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .dashboard { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .menu { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); margin-bottom: 20px; }
        .menu a { margin: 0 10px; text-decoration: none; color: #007bff; }
        .menu a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="dashboard">
        <h1>Admin Dashboard</h1>
        <div class="menu">
            <a href="StudentServlet?action=list">Manage Students</a>
            <a href="InstructorServlet?action=list">Manage Instructors</a>
            <a href="VehicleServlet?action=list">Manage Vehicles</a>
            <a href="LessonServlet?action=list">Manage Lessons</a>
            <a href="PaymentServlet?action=list">Manage Payments</a>
            <a href="LogoutServlet">Logout</a>
        </div>
        <p>Welcome, Admin!</p>
    </div>
</body>
</html>
