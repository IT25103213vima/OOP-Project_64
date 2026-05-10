<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container">
        <h1>Welcome, Instructor! 👨‍🏫</h1>
        <p class="text-muted">View your lessons and assigned students below</p>

        <h2 style="margin-top: 2rem; margin-bottom: 1.5rem;">📋 My Lessons</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student</th>
                        <th>Vehicle</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
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
                            <td>
                                <c:choose>
                                    <c:when test="${lesson.status == 'Completed'}">
                                        <span style="color: #28a745; font-weight: bold;">✓ ${lesson.status}</span>
                                    </c:when>
                                    <c:when test="${lesson.status == 'Pending'}">
                                        <span style="color: #ffc107; font-weight: bold;">⏳ ${lesson.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${lesson.status}
                                    </c:otherwise>
                                </c:choose>
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
