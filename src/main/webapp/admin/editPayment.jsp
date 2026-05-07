<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Payment</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .form-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Payment</h2>
        <form action="PaymentServlet?action=update" method="post">
            <input type="hidden" name="id" value="${payment.id}">
            <input type="number" name="studentId" value="${payment.studentId}" required>
            <input type="number" step="0.01" name="amount" value="${payment.amount}" required>
            <input type="date" name="paymentDate" value="${payment.paymentDate}" required>
            <select name="paymentMethod">
                <option value="cash" ${payment.paymentMethod == 'cash' ? 'selected' : ''}>Cash</option>
                <option value="card" ${payment.paymentMethod == 'card' ? 'selected' : ''}>Card</option>
                <option value="online" ${payment.paymentMethod == 'online' ? 'selected' : ''}>Online</option>
            </select>
            <input type="text" name="description" value="${payment.description}">
            <button type="submit">Update Payment</button>
        </form>
        <a href="PaymentServlet?action=list">Back</a>
    </div>
</body>
</html>
