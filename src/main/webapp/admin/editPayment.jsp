<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">✏️ Edit Payment</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/PaymentServlet?action=list" class="back-btn">← Back to List</a>
        </div>
    </div>

    <div class="container-sm">
        <div class="form-container">
            <h1>💳 Edit Payment</h1>
            <p class="text-muted mb-4">Update payment information</p>

            <form action="${pageContext.request.contextPath}/PaymentServlet?action=update" method="post">
                <input type="hidden" name="id" value="${payment.id}">

                <div class="form-group">
                    <label for="studentId">Student *</label>
                    <select id="studentId" name="studentId" required>
                        <option value="">-- Select Student --</option>
                        <c:forEach var="student" items="${students}">
                            <option value="${student.id}" ${student.id == payment.studentId ? 'selected' : ''}>
                                ${student.firstName} ${student.lastName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="amount">Amount ($) *</label>
                    <input type="number" id="amount" step="0.01" name="amount" value="${payment.amount}" min="0" required>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="paymentDate">Payment Date *</label>
                            <input type="date" id="paymentDate" name="paymentDate" value="${payment.paymentDate}" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="paymentMethod">Payment Method *</label>
                            <select id="paymentMethod" name="paymentMethod" required>
                                <option value="Cash" ${payment.paymentMethod == 'Cash' ? 'selected' : ''}>Cash</option>
                                <option value="Card" ${payment.paymentMethod == 'Card' ? 'selected' : ''}>Card</option>
                                <option value="Bank Transfer" ${payment.paymentMethod == 'Bank Transfer' ? 'selected' : ''}>Bank Transfer</option>
                                <option value="Online" ${payment.paymentMethod == 'Online' ? 'selected' : ''}>Online</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description">${payment.description}</textarea>
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary" style="flex: 1;">✓ Update Payment</button>
                    <a href="${pageContext.request.contextPath}/PaymentServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
