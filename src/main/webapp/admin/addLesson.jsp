<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Add Lesson</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; }
        label { display: block; margin-top: 10px; font-weight: bold; }
        .button-container { display: flex; gap: 10px; margin-top: 20px; }
        button { flex: 1; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        button:hover { background: #0056b3; }
        .back-btn { background: #6c757d; text-decoration: none; padding: 10px; border-radius: 4px; text-align: center; color: white; font-weight: bold; }
        .back-btn:hover { background: #5a6268; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Lesson</h2>
        <form action="LessonServlet?action=add" method="post">
            <label for="studentId">Student</label>
            <select id="studentId" name="studentId" required>
                <option value="">-- Select Student --</option>
                <c:forEach var="student" items="${students}">
                    <option value="${student.id}">
                        ${student.firstName} ${student.lastName}
                    </option>
                </c:forEach>
            </select>

            <label for="instructorId">Instructor</label>
            <select id="instructorId" name="instructorId" required>
                <option value="">-- Select Instructor --</option>
                <c:forEach var="instructor" items="${instructors}">
                    <option value="${instructor.id}">
                        ${instructor.firstName} ${instructor.lastName}
                    </option>
                </c:forEach>
            </select>

            <label for="vehicleId">Vehicle</label>
            <select id="vehicleId" name="vehicleId" required>
                <option value="">-- Select Vehicle --</option>
                <c:forEach var="vehicle" items="${vehicles}">
                    <option value="${vehicle.id}">
                        ${vehicle.vehicleName} ${vehicle.model} (${vehicle.licensePlate})
                    </option>
                </c:forEach>
            </select>

            <label for="lessonDate">Lesson Date</label>
            <input type="date" id="lessonDate" name="lessonDate" required>

            <label for="lessonTime">Lesson Time</label>
            <input type="time" id="lessonTime" name="lessonTime" required>

            <label for="status">Status</label>
            <select id="status" name="status" required>
                <option value="scheduled">Scheduled</option>
                <option value="completed">Completed</option>
                <option value="cancelled">Cancelled</option>
            </select>

            <label for="notes">Notes</label>
            <input type="text" id="notes" name="notes" placeholder="Notes">

            <div class="button-container">
                <button type="submit">Add Lesson</button>
                <a href="LessonServlet?action=list" class="back-btn">Back to Dashboard</a>
            </div>
        </form>
    </div>
</body>
</html>
