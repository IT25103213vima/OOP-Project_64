<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Instructor Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .dashboard { max-width: 1200px; margin: 0 auto; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="dashboard">
        <h1>Instructor Dashboard</h1>
        <a href="LogoutServlet">Logout</a>
        <h2>My Lessons</h2>
        <table>
            <tr><th>ID</th><th>Student</th><th>Vehicle</th><th>Date</th><th>Time</th><th>Status</th></tr>
            <c:forEach var="lesson" items="${lessons}">
                <tr>
                    <td>${lesson.id}</td>
                    <td>${lesson.studentId}</td>
                    <td>${lesson.vehicleId}</td>
                    <td>${lesson.lessonDate}</td>
                    <td>${lesson.lessonTime}</td>
                    <td>${lesson.status}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
