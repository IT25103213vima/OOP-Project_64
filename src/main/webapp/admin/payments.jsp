<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Manage Payments</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header-buttons { display: flex; gap: 10px; margin-bottom: 15px; }
        .add-button { padding: 10px 15px; background-color: #28a745; color: white; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .add-button:hover { background-color: #218838; }
        .back-btn { padding: 10px 15px; background-color: #6c757d; color: white; border-radius: 4px; text-decoration: none; font-weight: bold; }
        .back-btn:hover { background-color: #5a6268; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
        .action-btn { display: inline-block; padding: 6px 10px; border-radius: 4px; color: white; text-decoration: none; margin-right: 6px; font-size: 14px; }
        .edit-btn { background-color: #007bff; }
        .edit-btn:hover { background-color: #0056b3; }
        .delete-btn { background-color: #dc3545; }
        .delete-btn:hover { background-color: #c82333; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Payments</h1>
        <div class="header-buttons">
            <a href="PaymentServlet?action=add" class="add-button">Add New Payment</a>
            <a href="adminDashboard.jsp" class="back-btn">Back to Dashboard</a>
        </div>
        <table>
            <tr><th>ID</th><th>Student</th><th>Amount</th><th>Date</th><th>Method</th><th>Description</th><th>Actions</th></tr>
            <c:forEach var="payment" items="${payments}">
                <c:set var="studentName" value="Unknown"/>
                <c:forEach var="student" items="${students}">
                    <c:if test="${student.id == payment.studentId}">
                        <c:set var="studentName" value="${student.firstName} ${student.lastName}"/>
                    </c:if>
                </c:forEach>
                <tr>
                    <td>${payment.id}</td>
                    <td>${studentName}</td>
                    <td>${payment.amount}</td>
                    <td>${payment.paymentDate}</td>
                    <td>${payment.paymentMethod}</td>
                    <td>${payment.description}</td>
                    <td>
                        <a href="PaymentServlet?action=edit&id=${payment.id}" class="action-btn edit-btn">Edit</a>
                        <a href="PaymentServlet?action=delete&id=${payment.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
