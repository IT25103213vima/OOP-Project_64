<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Lessons - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>📚 Lesson Management</h1>
            <a href="${pageContext.request.contextPath}/LessonServlet?action=add" class="btn btn-success">+ Add New Lesson</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student</th>
                        <th>Instructor</th>
                        <th>Vehicle</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lesson" items="${lessons}">
                        <c:set var="studentName" value="Unknown"/>
                        <c:set var="instructorName" value="Unknown"/>
                        <c:set var="vehicleInfo" value="Unknown"/>

                        <c:forEach var="student" items="${students}">
                            <c:if test="${student.id == lesson.studentId}">
                                <c:set var="studentName" value="${student.firstName} ${student.lastName}"/>
                            </c:if>
                        </c:forEach>

                        <c:forEach var="instructor" items="${instructors}">
                            <c:if test="${instructor.id == lesson.instructorId}">
                                <c:set var="instructorName" value="${instructor.firstName} ${instructor.lastName}"/>
                            </c:if>
                        </c:forEach>

                        <c:forEach var="vehicle" items="${vehicles}">
                            <c:if test="${vehicle.id == lesson.vehicleId}">
                                <c:set var="vehicleInfo" value="${vehicle.vehicleName} ${vehicle.model}"/>
                            </c:if>
                        </c:forEach>

                        <tr>
                            <td><strong>${lesson.id}</strong></td>
                            <td>${studentName}</td>
                            <td>${instructorName}</td>
                            <td>${vehicleInfo}</td>
                            <td>${lesson.lessonDate}</td>
                            <td>${lesson.lessonTime}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${lesson.status == 'Completed'}">
                                        <span style="color: #28a745; font-weight: bold;">✓ Completed</span>
                                    </c:when>
                                    <c:when test="${lesson.status == 'Pending'}">
                                        <span style="color: #ffc107; font-weight: bold;">⏳ Pending</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${lesson.status}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="white-space: nowrap;">
                                <a href="${pageContext.request.contextPath}/LessonServlet?action=edit&id=${lesson.id}" class="action-btn edit-btn">Edit</a>
                                <a href="${pageContext.request.contextPath}/LessonServlet?action=delete&id=${lesson.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this lesson?')">Delete</a>
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
