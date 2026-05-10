<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driving School Management System</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/animations.css">
    <style>
        .landing-page {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            text-align: center;
            padding: 2rem;
        }

        .landing-content {
            background: white;
            padding: 3rem;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            animation: slideInUp 0.6s ease-in-out;
        }

        .landing-content h1 {
            color: #007bff;
            font-size: 2.5rem;
            margin-bottom: 1rem;
            animation: slideInDown 0.6s ease-in-out;
        }

        .landing-content p {
            color: #666;
            font-size: 1.1rem;
            margin-bottom: 2rem;
            line-height: 1.8;
        }

        .feature-list {
            text-align: left;
            margin: 2rem 0;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .feature-list li {
            margin: 0.75rem 0;
            color: #555;
            list-style: none;
            padding-left: 2rem;
            position: relative;
        }

        .feature-list li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .landing-content .login-btn {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            color: white;
            padding: 1rem 2.5rem;
            font-size: 1.1rem;
            text-decoration: none;
            border-radius: 6px;
            display: inline-block;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
            animation: fadeIn 0.8s ease-in-out;
        }

        .landing-content .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.4);
        }

        .landing-content .login-btn:active {
            transform: translateY(-1px);
        }
    </style>
</head>
<body class="landing-page">
    <div class="landing-content">
        <h1>🏎️ Driving School Management System</h1>
        <p>Manage your driving school with ease and efficiency. A complete platform for administrators, instructors, and students.</p>

        <ul class="feature-list">
            <li>Student Management</li>
            <li>Instructor Management</li>
            <li>Vehicle Management</li>
            <li>Lesson Scheduling</li>
            <li>Payment Tracking</li>
            <li>Role-Based Access</li>
        </ul>

        <a href="login.jsp" class="login-btn">Get Started →</a>
    </div>
</body>
</html>

