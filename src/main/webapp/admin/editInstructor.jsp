<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Instructor - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container-sm">
                <div class="form-container">
            <h1>✏️ Edit Instructor</h1>
            <p class="text-muted mb-4">Update instructor information</p>

            <form action="${pageContext.request.contextPath}/InstructorServlet?action=update" method="post">
                <input type="hidden" name="id" value="${instructor.id}">

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="firstName">First Name *</label>
                            <input type="text" id="firstName" name="firstName" value="${instructor.firstName}" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName" value="${instructor.lastName}" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" value="${instructor.email}" required>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" name="phone" value="${instructor.phone}">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="licenseNumber">License Number *</label>
                            <input type="text" id="licenseNumber" name="licenseNumber" value="${instructor.licenseNumber}" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" value="${instructor.address}">
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary" style="flex: 1;">✓ Update Instructor</button>
                    <a href="${pageContext.request.contextPath}/InstructorServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
