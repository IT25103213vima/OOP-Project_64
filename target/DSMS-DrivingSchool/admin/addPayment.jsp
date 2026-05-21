<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Payment - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">➕ Add New Payment</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/PaymentServlet?action=list" class="back-btn">← Back to List</a>
        </div>
    </div>

    <div class="container-sm">
        <div class="form-container">
            <h1>💳 Add New Payment</h1>
            <p class="text-muted mb-4">Record a new payment transaction</p>

            <form action="${pageContext.request.contextPath}/PaymentServlet?action=add" method="post">
                <div class="form-group">
                    <label for="studentId">Student *</label>
                    <select id="studentId" name="studentId" required>
                        <option value="">-- Select Student --</option>
                        <c:forEach var="student" items="${students}">
                            <option value="${student.id}">${student.firstName} ${student.lastName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="amount">Amount ($) *</label>
                    <input type="number" id="amount" name="amount" step="0.01" placeholder="0.00" min="0" required>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="paymentDate">Payment Date *</label>
                            <input type="date" id="paymentDate" name="paymentDate" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="paymentMethod">Payment Method *</label>
                            <select id="paymentMethod" name="paymentMethod" required>
                                <option value="">-- Select Method --</option>
                                <option value="Cash">Cash</option>
                                <option value="Card">Card</option>
                                <option value="Bank Transfer">Bank Transfer</option>
                                <option value="Online">Online</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="e.g., Lesson fee payment, Driving license exam fee..."></textarea>
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-success" style="flex: 1;">✓ Add Payment</button>
                    <a href="${pageContext.request.contextPath}/PaymentServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
