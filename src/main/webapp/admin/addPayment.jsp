<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Payment</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Payment</h2>
        <form action="PaymentServlet?action=add" method="post">
            <input type="number" name="studentId" placeholder="Student ID" required>
            <input type="number" step="0.01" name="amount" placeholder="Amount" required>
            <input type="date" name="paymentDate" required>
            <select name="paymentMethod">
                <option value="cash">Cash</option>
                <option value="card">Card</option>
                <option value="online">Online</option>
            </select>
            <input type="text" name="description" placeholder="Description">
            <button type="submit">Add Payment</button>
        </form>
        <a href="PaymentServlet?action=list">Back</a>
    </div>
</body>
</html>
