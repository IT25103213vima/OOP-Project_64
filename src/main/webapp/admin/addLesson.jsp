<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Lesson - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container-sm">
                <div class="form-container">
            <h1>📚 Add New Lesson</h1>
            <p class="text-muted mb-4">Schedule a new lesson session</p>

            <form action="${pageContext.request.contextPath}/LessonServlet?action=add" method="post">
                <div class="form-group">
                    <label for="studentId">Student *</label>
                    <select id="studentId" name="studentId" required>
                        <option value="">-- Select Student --</option>
                        <c:forEach var="student" items="${students}">
                            <option value="${student.id}">
                                ${student.firstName} ${student.lastName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="instructorId">Instructor *</label>
                    <select id="instructorId" name="instructorId" required>
                        <option value="">-- Select Instructor --</option>
                        <c:forEach var="instructor" items="${instructors}">
                            <option value="${instructor.id}">
                                ${instructor.firstName} ${instructor.lastName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="vehicleId">Vehicle *</label>
                    <select id="vehicleId" name="vehicleId" required>
                        <option value="">-- Select Vehicle --</option>
                        <c:forEach var="vehicle" items="${vehicles}">
                            <option value="${vehicle.id}">
                                ${vehicle.vehicleName} ${vehicle.model} (${vehicle.licensePlate})
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="lessonDate">Lesson Date *</label>
                            <input type="date" id="lessonDate" name="lessonDate" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="lessonTime">Lesson Time *</label>
                            <input type="time" id="lessonTime" name="lessonTime" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="status">Status *</label>
                    <select id="status" name="status" required>
                        <option value="">-- Select Status --</option>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="notes">Notes</label>
                    <textarea id="notes" name="notes" placeholder="Any additional notes..."></textarea>
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-success" style="flex: 1;">✓ Add Lesson</button>
                    <a href="${pageContext.request.contextPath}/LessonServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
