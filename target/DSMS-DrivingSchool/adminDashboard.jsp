<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - DSMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animations.css">
</head>
<body>
    <div class="app-shell">
        <%@ include file="/includes/sidebar.jsp" %>
        <main class="main-area">
            <div class="content-header">
                <div class="page-title">
                    <div style="font-size:1.6rem">📊</div>
                    <div>
                        <h1 style="margin:0">Admin Dashboard</h1>
                        <div class="breadcrumb">Home / Dashboard</div>
                    </div>
                </div>
                <div class="header-actions">
                    <a href="${pageContext.request.contextPath}/StudentServlet?action=list" class="btn btn-success">Manage Students</a>
                </div>
            </div>

            <div class="panel">
                <div class="panel-title">Welcome, Administrator! 👔</div>
                <p class="text-muted">Manage all aspects of your driving school from this dashboard</p>
                <div style="height:10px"></div>
                <div class="menu animated-grid">
                    <a href="${pageContext.request.contextPath}/StudentServlet?action=list" class="menu-button">
                        <div class="menu-icon">👨‍🎓</div>
                        <div class="menu-label">Students</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/InstructorServlet?action=list" class="menu-button">
                        <div class="menu-icon">👨‍🏫</div>
                        <div class="menu-label">Instructors</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/VehicleServlet?action=list" class="menu-button">
                        <div class="menu-icon">🚗</div>
                        <div class="menu-label">Vehicles</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/LessonServlet?action=list" class="menu-button">
                        <div class="menu-icon">📚</div>
                        <div class="menu-label">Lessons</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/PaymentServlet?action=list" class="menu-button">
                        <div class="menu-icon">💳</div>
                        <div class="menu-label">Payments</div>
                    </a>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <div class="card stat-card">
                        <h3>Quick Stats</h3>
                        <p class="text-muted">Use the management options above to view and manage all system data</p>
                    </div>
                </div>
                <div class="col">
                    <div class="card stat-card">
                        <h3>Total Students</h3>
                        <p class="text-primary">${totalStudents}</p>
                    </div>
                </div>
                <div class="col">
                    <div class="card stat-card">
                        <h3>Total Lessons</h3>
                        <p class="text-primary">${totalLessons}</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
