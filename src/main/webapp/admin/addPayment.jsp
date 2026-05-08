<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Add Payment</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; }
        .button-container { display: flex; gap: 10px; margin-top: 20px; }
        button { flex: 1; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        button:hover { background: #0056b3; }
        .back-btn { background: #6c757d; text-decoration: none; padding: 10px; border-radius: 4px; text-align: center; color: white; font-weight: bold; }
        .back-btn:hover { background: #5a6268; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Payment</h2>
        <form action="PaymentServlet?action=add" method="post">
            <label for="studentId">Student</label>
            <select id="studentId" name="studentId" required>
                <option value="">-- Select Student --</option>
                <c:forEach var="student" items="${students}">
                    <option value="${student.id}">${student.firstName} ${student.lastName}</option>
                </c:forEach>
            </select>
            <input type="number" step="0.01" name="amount" placeholder="Amount" required>
            <input type="date" name="paymentDate" required>
            <select name="paymentMethod">
                <option value="cash">Cash</option>
                <option value="card">Card</option>
                <option value="online">Online</option>
            </select>
            <input type="text" name="description" placeholder="Description">
            <div class="button-container">
                <button type="submit">Add Payment</button>
                <a href="PaymentServlet?action=list" class="back-btn">Back to Dashboard</a>
            </div>
        </form>
    </div>
</body>
</html>
