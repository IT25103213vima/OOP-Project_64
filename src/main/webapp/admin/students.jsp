<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>👨‍🎓 Student Management</h1>
            <a href="${pageContext.request.contextPath}/StudentServlet?action=add" class="btn btn-success">+ Add New Student</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td><strong>${student.id}</strong></td>
                            <td>${student.firstName} ${student.lastName}</td>
                            <td><a href="mailto:${student.email}">${student.email}</a></td>
                            <td>${student.phone}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/StudentServlet?action=edit&id=${student.id}" class="action-btn edit-btn">Edit</a>
                                <a href="${pageContext.request.contextPath}/StudentServlet?action=delete&id=${student.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
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
