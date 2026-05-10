<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Instructors - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>👨‍🏫 Instructor Management</h1>
            <a href="${pageContext.request.contextPath}/InstructorServlet?action=add" class="btn btn-success">+ Add New Instructor</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>License</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="instructor" items="${instructors}">
                        <tr>
                            <td><strong>${instructor.id}</strong></td>
                            <td>${instructor.firstName} ${instructor.lastName}</td>
                            <td><a href="mailto:${instructor.email}">${instructor.email}</a></td>
                            <td>${instructor.licenseNumber}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/InstructorServlet?action=edit&id=${instructor.id}" class="action-btn edit-btn">Edit</a>
                                <a href="${pageContext.request.contextPath}/InstructorServlet?action=delete&id=${instructor.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this instructor?')">Delete</a>
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
