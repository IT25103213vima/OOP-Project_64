<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Lesson</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Lesson</h2>
        <form action="LessonServlet?action=update" method="post">
            <input type="hidden" name="id" value="${lesson.id}">
            <input type="number" name="studentId" value="${lesson.studentId}" required>
            <input type="number" name="instructorId" value="${lesson.instructorId}" required>
            <input type="number" name="vehicleId" value="${lesson.vehicleId}" required>
            <input type="date" name="lessonDate" value="${lesson.lessonDate}" required>
            <input type="time" name="lessonTime" value="${lesson.lessonTime}" required>
            <input type="number" name="duration" value="${lesson.duration}" required>
            <select name="status">
                <option value="scheduled" ${lesson.status == 'scheduled' ? 'selected' : ''}>Scheduled</option>
                <option value="completed" ${lesson.status == 'completed' ? 'selected' : ''}>Completed</option>
                <option value="cancelled" ${lesson.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
            </select>
            <input type="text" name="notes" value="${lesson.notes}">
            <button type="submit">Update Lesson</button>
        </form>
        <a href="LessonServlet?action=list">Back</a>
    </div>
</body>
</html>
