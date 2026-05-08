<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Instructor Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .dashboard { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header-buttons { display: flex; gap: 10px; margin-bottom: 20px; }
        .logout-btn { padding: 10px 15px; background-color: #dc3545; color: white; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .logout-btn:hover { background-color: #c82333; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="dashboard">
        <h1>Instructor Dashboard</h1>
        <div class="header-buttons">
            <a href="LogoutServlet" class="logout-btn">Logout</a>
        </div>
        <h2>My Lessons</h2>
        <table>
            <tr><th>ID</th><th>Student</th><th>Vehicle</th><th>Date</th><th>Time</th><th>Status</th></tr>
            <c:forEach var="lesson" items="${lessons}">
                <c:set var="studentName" value="Unknown"/>
                <c:set var="vehicleName" value="Unknown"/>
                <c:forEach var="student" items="${students}">
                    <c:if test="${student.id == lesson.studentId}">
                        <c:set var="studentName" value="${student.firstName} ${student.lastName}"/>
                    </c:if>
                </c:forEach>
                <c:forEach var="vehicle" items="${vehicles}">
                    <c:if test="${vehicle.id == lesson.vehicleId}">
                        <c:set var="vehicleName" value="${vehicle.vehicleName} ${vehicle.model}"/>
                    </c:if>
                </c:forEach>
                <tr>
                    <td>${lesson.id}</td>
                    <td>${studentName}</td>
                    <td>${vehicleName}</td>
                    <td>${lesson.lessonDate}</td>
                    <td>${lesson.lessonTime}</td>
                    <td>${lesson.status}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
