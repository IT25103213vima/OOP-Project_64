<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Vehicles</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Vehicles</h1>
        <a href="VehicleServlet?action=add">Add New Vehicle</a> | <a href="adminDashboard.jsp">Back to Dashboard</a>
        <table>
            <tr><th>ID</th><th>Make</th><th>Model</th><th>Year</th><th>License Plate</th><th>Status</th><th>Actions</th></tr>
            <c:forEach var="vehicle" items="${vehicles}">
                <tr>
                    <td>${vehicle.id}</td>
                    <td>${vehicle.make}</td>
                    <td>${vehicle.model}</td>
                    <td>${vehicle.year}</td>
                    <td>${vehicle.licensePlate}</td>
                    <td>${vehicle.status}</td>
                    <td>
                        <a href="VehicleServlet?action=edit&id=${vehicle.id}">Edit</a> |
                        <a href="VehicleServlet?action=delete&id=${vehicle.id}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
