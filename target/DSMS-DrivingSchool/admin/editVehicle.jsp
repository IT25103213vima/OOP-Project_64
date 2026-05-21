<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">✏️ Edit Vehicle</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/VehicleServlet?action=list" class="back-btn">← Back to List</a>
        </div>
    </div>

    <div class="container-sm">
        <div class="form-container">
            <h1>🚗 Edit Vehicle</h1>
            <p class="text-muted mb-4">Update vehicle information</p>

            <form action="${pageContext.request.contextPath}/VehicleServlet?action=update" method="post">
                <input type="hidden" name="id" value="${vehicle.id}">

                <div class="form-group">
                    <label for="vehicleName">Vehicle Name *</label>
                    <input type="text" id="vehicleName" name="vehicleName" value="${vehicle.vehicleName}" required>
                </div>

                <div class="form-group">
                    <label for="model">Model *</label>
                    <input type="text" id="model" name="model" value="${vehicle.model}" required>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="year">Year *</label>
                            <input type="number" id="year" name="year" value="${vehicle.year}" min="1990" max="2099" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="licensePlate">License Plate *</label>
                            <input type="text" id="licensePlate" name="licensePlate" value="${vehicle.licensePlate}" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="status">Status *</label>
                    <select id="status" name="status" required>
                        <option value="Available" ${vehicle.status == 'Available' ? 'selected' : ''}>Available</option>
                        <option value="In Use" ${vehicle.status == 'In Use' ? 'selected' : ''}>In Use</option>
                        <option value="Maintenance" ${vehicle.status == 'Maintenance' ? 'selected' : ''}>Maintenance</option>
                        <option value="Out of Service" ${vehicle.status == 'Out of Service' ? 'selected' : ''}>Out of Service</option>
                    </select>
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary" style="flex: 1;">✓ Update Vehicle</button>
                    <a href="${pageContext.request.contextPath}/VehicleServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
