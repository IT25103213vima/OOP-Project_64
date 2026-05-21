<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="container-sm">
                <div class="form-container">
            <h1>✏️ Edit Student</h1>
            <p class="text-muted mb-4">Update student information below</p>

            <c:if test="${not empty validationError}">
                <div class="alert alert-danger">${validationError}</div>
            </c:if>

            <form id="studentEditForm" action="${pageContext.request.contextPath}/StudentServlet?action=update" method="post" novalidate>
                <input type="hidden" name="id" value="${requestScope.student.id}">

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${requestScope.user.username}" readonly disabled>
                    <small class="text-muted">Username cannot be changed</small>
                </div>

                <div class="form-group">
                    <label for="password">New Password</label>
                    <input type="password" id="password" name="password" placeholder="Leave blank to keep current password" minlength="8" pattern="^(?=[A-Z])(?=.*[0-9!@#$%^&*]).{8,}$" title="Password must start with a capital letter and include at least one number or special character" autocomplete="new-password">
                    <small class="text-muted">Only fill if you want to change the password</small>
                    <small class="field-error" id="passwordError"><c:out value="${fieldErrors.password}"/></small>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="firstName">First Name *</label>
                            <input type="text" id="firstName" name="firstName" value="${empty param.firstName ? requestScope.student.firstName : param.firstName}" required pattern="[A-Za-z]+" title="First name must contain letters only">
                            <small class="field-error" id="firstNameError"><c:out value="${fieldErrors.firstName}"/></small>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName" value="${empty param.lastName ? requestScope.student.lastName : param.lastName}" required pattern="[A-Za-z]+" title="Last name must contain letters only">
                            <small class="field-error" id="lastNameError"><c:out value="${fieldErrors.lastName}"/></small>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" value="${empty param.email ? requestScope.student.email : param.email}" required pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$" title="Enter a valid email address">
                    <small class="field-error" id="emailError"><c:out value="${fieldErrors.email}"/></small>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="phone">Phone Number *</label>
                            <input type="tel" id="phone" name="phone" value="${empty param.phone ? requestScope.student.phone : param.phone}" required pattern="[0-9]{10}" minlength="10" maxlength="10" inputmode="numeric" title="Phone number must be exactly 10 digits">
                            <small class="field-error" id="phoneError"><c:out value="${fieldErrors.phone}"/></small>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="dob">Date of Birth *</label>
                            <input type="date" id="dob" name="dob" value="${empty param.dob ? requestScope.student.dateOfBirth : param.dob}" required>
                            <small class="field-error" id="dobError"><c:out value="${fieldErrors.dob}"/></small>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" value="${empty param.address ? requestScope.student.address : param.address}">
                </div>

                <div class="d-flex gap-2" style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary" style="flex: 1;">✓ Update Student</button>
                    <a href="${pageContext.request.contextPath}/StudentServlet?action=list" class="btn btn-secondary" style="flex: 1; text-align: center;">Cancel</a>
                </div>
            </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
