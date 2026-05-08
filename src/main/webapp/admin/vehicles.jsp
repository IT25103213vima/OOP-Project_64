<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Vehicles</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header-buttons { display: flex; gap: 10px; margin-bottom: 15px; }
        .add-button { padding: 10px 15px; background-color: #28a745; color: white; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .add-button:hover { background-color: #218838; }
        .back-btn { padding: 10px 15px; background-color: #6c757d; color: white; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .back-btn:hover { background-color: #5a6268; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
        .action-btn { display: inline-block; padding: 6px 10px; border-radius: 4px; color: white; text-decoration: none; margin-right: 6px; font-size: 14px; }
        .edit-btn { background-color: #007bff; }
        .edit-btn:hover { background-color: #0056b3; }
        .delete-btn { background-color: #dc3545; }
        .delete-btn:hover { background-color: #c82333; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Vehicles</h1>
        <div class="header-buttons">
            <a href="VehicleServlet?action=add" class="add-button">Add New Vehicle</a>
            <a href="adminDashboard.jsp" class="back-btn">Back to Dashboard</a>
        </div>
        <table>
            <tr><th>ID</th><th>Vehicle Name</th><th>Model</th><th>Year</th><th>License Plate</th><th>Status</th><th>Actions</th></tr>
            <c:forEach var="vehicle" items="${vehicles}">
                <tr>
                    <td>${vehicle.id}</td>
                    <td>${vehicle.vehicleName}</td>
                    <td>${vehicle.model}</td>
                    <td>${vehicle.year}</td>
                    <td>${vehicle.licensePlate}</td>
                    <td>${vehicle.status}</td>
                    <td>
                        <a href="VehicleServlet?action=edit&id=${vehicle.id}" class="action-btn edit-btn">Edit</a>
                        <a href="VehicleServlet?action=delete&id=${vehicle.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
