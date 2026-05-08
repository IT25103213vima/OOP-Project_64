<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .dashboard { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header-buttons { display: flex; gap: 10px; margin-bottom: 20px; }
        .menu { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); margin-bottom: 20px; display: flex; gap: 10px; flex-wrap: wrap; }
        .menu a { margin: 0; text-decoration: none; }
        .menu-button { display: inline-block; padding: 10px 16px; background-color: #007bff; color: white; border-radius: 6px; font-weight: bold; text-decoration: none; }
        .menu-button:hover { background-color: #0056b3; }
        .menu-button.secondary { background-color: #6c757d; }
        .menu-button.secondary:hover { background-color: #5a6268; }
        .logout-btn { padding: 10px 15px; background-color: #dc3545; color: white; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .logout-btn:hover { background-color: #c82333; }
    </style>
</head>
<body>
    <div class="dashboard">
        <h1>Admin Dashboard</h1>
        <div class="header-buttons">
            <a href="LogoutServlet" class="logout-btn">Logout</a>
        </div>
        <div class="menu">
            <a href="StudentServlet?action=list" class="menu-button">Manage Students</a>
            <a href="InstructorServlet?action=list" class="menu-button">Manage Instructors</a>
            <a href="VehicleServlet?action=list" class="menu-button">Manage Vehicles</a>
            <a href="LessonServlet?action=list" class="menu-button">Manage Lessons</a>
            <a href="PaymentServlet?action=list" class="menu-button">Manage Payments</a>
        </div>
        <p>Welcome, Admin!</p>
    </div>
</body>
</html>
