<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container-sm">
                <div class="form-container">
            <h1>➕ Add New Student</h1>
            <p class="text-muted mb-4">Fill in the form below to add a new student</p>

            <c:if test="${not empty validationError}">
                <div class="alert alert-danger">${validationError}</div>
            </c:if>

            <form id="studentAddForm" action="${pageContext.request.contextPath}/StudentServlet?action=add" method="post" novalidate>
                <div class="form-group">
                    <label for="username">Username *</label>
                    <input type="text" id="username" name="username" placeholder="Unique username" required pattern="[A-Za-z]+" title="Username must contain letters only" autocomplete="off" value="${param.username}">
                    <small class="field-error" id="usernameError"><c:out value="${fieldErrors.username}"/></small>
                </div>

                <div class="form-group">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" placeholder="Start with a capital letter and include a number or special character" required minlength="8" pattern="^(?=[A-Z])(?=.*[0-9!@#$%^&*]).{8,}$" title="Password must start with a capital letter and include at least one number or special character" autocomplete="new-password">
                    <small class="field-error" id="passwordError"><c:out value="${fieldErrors.password}"/></small>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="firstName">First Name *</label>
                            <input type="text" id="firstName" name="firstName" placeholder="First name" required pattern="[A-Za-z]+" title="First name must contain letters only" value="${param.firstName}">
                            <small class="field-error" id="firstNameError"><c:out value="${fieldErrors.firstName}"/></small>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName" placeholder="Last name" required pattern="[A-Za-z]+" title="Last name must contain letters only" value="${param.lastName}">
                            <small class="field-error" id="lastNameError"><c:out value="${fieldErrors.lastName}"/></small>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" placeholder="student@example.com" required pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$" title="Enter a valid email address" value="${param.email}">
                    <small class="field-error" id="emailError"><c:out value="${fieldErrors.email}"/></small>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="phone">Phone Number *</label>
                            <input type="tel" id="phone" name="phone" placeholder="10 digit phone number" required pattern="[0-9]{10}" minlength="10" maxlength="10" inputmode="numeric" title="Phone number must be exactly 10 digits" value="${param.phone}">
                            <small class="field-error" id="phoneError"><c:out value="${fieldErrors.phone}"/></small>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="dob">Date of Birth *</label>
                            <input type="date" id="dob" name="dob" required value="${param.dob}">
                            <small class="field-error" id="dobError"><c:out value="${fieldErrors.dob}"/></small>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" placeholder="Street address" value="${param.address}">
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-success" style="flex: 1;">✓ Add Student</button>
                    <a href="${pageContext.request.contextPath}/StudentServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
                </div>
            </div>
        </main>
        <!-- Include global app JS which provides live validation across forms -->
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
    </div>
</body>
</html>
