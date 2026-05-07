<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Instructors</title>
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
        <h1>Manage Instructors</h1>
        <a href="InstructorServlet?action=add">Add New Instructor</a> | <a href="adminDashboard.jsp">Back to Dashboard</a>
        <table>
            <tr><th>ID</th><th>Name</th><th>Email</th><th>License</th><th>Actions</th></tr>
            <c:forEach var="instructor" items="${instructors}">
                <tr>
                    <td>${instructor.id}</td>
                    <td>${instructor.firstName} ${instructor.lastName}</td>
                    <td>${instructor.email}</td>
                    <td>${instructor.licenseNumber}</td>
                    <td>
                        <a href="InstructorServlet?action=edit&id=${instructor.id}">Edit</a> |
                        <a href="InstructorServlet?action=delete&id=${instructor.id}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
