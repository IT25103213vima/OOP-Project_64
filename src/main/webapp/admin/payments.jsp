<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Payments</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Payments</h1>
        <a href="PaymentServlet?action=add">Add New Payment</a> | <a href="adminDashboard.jsp">Back to Dashboard</a>
        <table>
            <tr><th>ID</th><th>Student</th><th>Amount</th><th>Date</th><th>Method</th><th>Description</th><th>Actions</th></tr>
            <c:forEach var="payment" items="${payments}">
                <tr>
                    <td>${payment.id}</td>
                    <td>${payment.studentId}</td>
                    <td>${payment.amount}</td>
                    <td>${payment.paymentDate}</td>
                    <td>${payment.paymentMethod}</td>
                    <td>${payment.description}</td>
                    <td>
                        <a href="PaymentServlet?action=edit&id=${payment.id}">Edit</a> |
                        <a href="PaymentServlet?action=delete&id=${payment.id}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
