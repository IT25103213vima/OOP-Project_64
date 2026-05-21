<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Payments - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>💳 Payment Management</h1>
            <a href="${pageContext.request.contextPath}/PaymentServlet?action=add" class="btn btn-success">+ Add New Payment</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Method</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="payment" items="${payments}">
                        <c:set var="studentName" value="Unknown"/>
                        <c:forEach var="student" items="${students}">
                            <c:if test="${student.id == payment.studentId}">
                                <c:set var="studentName" value="${student.firstName} ${student.lastName}"/>
                            </c:if>
                        </c:forEach>
                        <tr>
                            <td><strong>${payment.id}</strong></td>
                            <td>${studentName}</td>
                            <td style="color: #28a745; font-weight: bold;">$${payment.amount}</td>
                            <td>${payment.paymentDate}</td>
                            <td>${payment.paymentMethod}</td>
                            <td>${payment.description}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/PaymentServlet?action=edit&id=${payment.id}" class="action-btn edit-btn">Edit</a>
                                <a href="${pageContext.request.contextPath}/PaymentServlet?action=delete&id=${payment.id}" class="action-btn delete-btn">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            </div>
        </main>
    </div>
</body>
</html>
