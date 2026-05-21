<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Vehicles - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>🚗 Vehicle Management</h1>
            <a href="${pageContext.request.contextPath}/VehicleServlet?action=add" class="btn btn-success">+ Add New Vehicle</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Vehicle Name</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>License Plate</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vehicle" items="${vehicles}">
                        <tr>
                            <td><strong>${vehicle.id}</strong></td>
                            <td>${vehicle.vehicleName}</td>
                            <td>${vehicle.model}</td>
                            <td>${vehicle.year}</td>
                            <td><code>${vehicle.licensePlate}</code></td>
                            <td>
                                <c:choose>
                                    <c:when test="${vehicle.status == 'Available'}">
                                        <span style="color: #28a745; font-weight: bold;">✓ Available</span>
                                    </c:when>
                                    <c:when test="${vehicle.status == 'In Use'}">
                                        <span style="color: #ffc107; font-weight: bold;">⚠️ In Use</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${vehicle.status}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/VehicleServlet?action=edit&id=${vehicle.id}" class="action-btn edit-btn">Edit</a>
                                <a href="${pageContext.request.contextPath}/VehicleServlet?action=delete&id=${vehicle.id}" class="action-btn delete-btn">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            </div>
        </main>
    </div>
</body>
</html>
