<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; }
        .button-container { display: flex; gap: 10px; margin-top: 20px; }
        button { flex: 1; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        button:hover { background: #0056b3; }
        .back-btn { background: #6c757d; text-decoration: none; padding: 10px; border-radius: 4px; text-align: center; color: white; font-weight: bold; }
        .back-btn:hover { background: #5a6268; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Student</h2>
        <form action="StudentServlet?action=update" method="post">
            <input type="hidden" name="id" value="${student.id}">
            <input type="text" name="firstName" value="${student.firstName}" required>
            <input type="text" name="lastName" value="${student.lastName}" required>
            <input type="email" name="email" value="${student.email}" required>
            <input type="text" name="phone" value="${student.phone}">
            <input type="text" name="address" value="${student.address}">
            <input type="date" name="dob" value="${student.dateOfBirth}" required>
            <div class="button-container">
                <button type="submit">Update Student</button>
                <a href="StudentServlet?action=list" class="back-btn">Back to Dashboard</a>
            </div>
        </form>
    </div>
</body>
</html>
