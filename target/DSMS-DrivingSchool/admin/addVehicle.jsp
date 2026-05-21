<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">➕ Add New Vehicle</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/VehicleServlet?action=list" class="back-btn">← Back to List</a>
        </div>
    </div>

    <div class="container-sm">
        <div class="form-container">
            <h1>🚗 Add New Vehicle</h1>
            <p class="text-muted mb-4">Register a new vehicle in the system</p>

            <form action="${pageContext.request.contextPath}/VehicleServlet?action=add" method="post">
                <div class="form-group">
                    <label for="vehicleName">Vehicle Name *</label>
                    <input type="text" id="vehicleName" name="vehicleName" placeholder="e.g., Toyota Corolla" required>
                </div>

                <div class="form-group">
                    <label for="model">Model *</label>
                    <input type="text" id="model" name="model" placeholder="e.g., 2023" required>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="year">Year *</label>
                            <input type="number" id="year" name="year" placeholder="2023" min="1990" max="2099" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="licensePlate">License Plate *</label>
                            <input type="text" id="licensePlate" name="licensePlate" placeholder="XYZ123" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="status">Status *</label>
                    <select id="status" name="status" required>
                        <option value="">-- Select Status --</option>
                        <option value="Available">Available</option>
                        <option value="In Use">In Use</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Out of Service">Out of Service</option>
                    </select>
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-success" style="flex: 1;">✓ Add Vehicle</button>
                    <a href="${pageContext.request.contextPath}/VehicleServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
