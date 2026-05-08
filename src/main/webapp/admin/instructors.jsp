<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Instructors</title>
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
        <h1>Manage Instructors</h1>
        <div class="header-buttons">
            <a href="InstructorServlet?action=add" class="add-button">Add New Instructor</a>
            <a href="adminDashboard.jsp" class="back-btn">Back to Dashboard</a>
        </div>
        <table>
            <tr><th>ID</th><th>Name</th><th>Email</th><th>License</th><th>Actions</th></tr>
            <c:forEach var="instructor" items="${instructors}">
                <tr>
                    <td>${instructor.id}</td>
                    <td>${instructor.firstName} ${instructor.lastName}</td>
                    <td>${instructor.email}</td>
                    <td>${instructor.licenseNumber}</td>
                    <td>
                        <a href="InstructorServlet?action=edit&id=${instructor.id}" class="action-btn edit-btn">Edit</a>
                        <a href="InstructorServlet?action=delete&id=${instructor.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
