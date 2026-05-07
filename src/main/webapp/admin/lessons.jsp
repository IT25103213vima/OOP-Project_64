<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Lessons</title>
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
        <h1>Manage Lessons</h1>
        <a href="LessonServlet?action=add">Add New Lesson</a> | <a href="adminDashboard.jsp">Back to Dashboard</a>
        <table>
            <tr><th>ID</th><th>Student</th><th>Instructor</th><th>Vehicle</th><th>Date</th><th>Time</th><th>Status</th><th>Actions</th></tr>
            <c:forEach var="lesson" items="${lessons}">
                <tr>
                    <td>${lesson.id}</td>
                    <td>${lesson.studentId}</td>
                    <td>${lesson.instructorId}</td>
                    <td>${lesson.vehicleId}</td>
                    <td>${lesson.lessonDate}</td>
                    <td>${lesson.lessonTime}</td>
                    <td>${lesson.status}</td>
                    <td>
                        <a href="LessonServlet?action=edit&id=${lesson.id}">Edit</a> |
                        <a href="LessonServlet?action=delete&id=${lesson.id}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
