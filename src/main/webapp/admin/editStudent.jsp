<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input { width: 100%; padding: 10px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; }
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
            <button type="submit">Update Student</button>
        </form>
        <a href="StudentServlet?action=list">Back</a>
    </div>
</body>
</html>
