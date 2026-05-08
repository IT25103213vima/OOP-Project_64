<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Instructor</title>
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
        <h2>Add New Instructor</h2>
        <form action="InstructorServlet?action=add" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="firstName" placeholder="First Name" required>
            <input type="text" name="lastName" placeholder="Last Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone">
            <input type="text" name="address" placeholder="Address">
            <input type="text" name="licenseNumber" placeholder="License Number" required>
            <div class="button-container">
                <button type="submit">Add Instructor</button>
                <a href="InstructorServlet?action=list" class="back-btn">Back to Dashboard</a>
            </div>
        </form>
    </div>
</body>
</html>
