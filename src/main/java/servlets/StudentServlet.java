package servlets;

import dao.StudentDAO;
import dao.StudentDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import models.Student;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.List;

public class StudentServlet extends HttpServlet {
    private final StudentDAO studentDAO = new StudentDAOImpl();
    private final UserDAO userDAO = new UserDAOImpl();

    private static final Pattern NAME_PATTERN = Pattern.compile("^[A-Za-z]+$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^[0-9]{10}$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^[A-Z](?=.*[0-9!@#$%^&*]).{7,}$");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action) || action == null) {
            List<Student> students = studentDAO.getAll();
            request.setAttribute("students", students);
            request.getRequestDispatcher("admin/students.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.read(id);
            User user = userDAO.read(student.getUserId());
            request.setAttribute("student", student);
            request.setAttribute("user", user);
            request.getRequestDispatcher("admin/editStudent.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.read(id);
            if (student != null) {
                userDAO.delete(student.getUserId());
            }
            studentDAO.delete(id);
            response.sendRedirect("StudentServlet?action=list");
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("admin/addStudent.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            Map<String, String> fieldErrors = validateStudentSubmission(request, true);
            if (!fieldErrors.isEmpty()) {
                request.setAttribute("fieldErrors", fieldErrors);
                request.setAttribute("validationError", buildValidationSummary(fieldErrors));
                request.getRequestDispatcher("admin/addStudent.jsp").forward(request, response);
                return;
            }

            // Create user first
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = new User(0, username, password, "student");
            userDAO.create(user);
            // user.getId() is already set by create() method

            // Create student
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Date dob = Date.valueOf(request.getParameter("dob"));
            Date enrollment = new Date(System.currentTimeMillis());

            Student student = new Student(0, user.getId(), firstName, lastName, email, phone, address, dob, enrollment);
            studentDAO.create(student);
            response.sendRedirect("StudentServlet?action=list");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.read(id);
            User user = userDAO.read(student.getUserId());

            Map<String, String> fieldErrors = validateStudentSubmission(request, false);
            if (!fieldErrors.isEmpty()) {
                request.setAttribute("student", student);
                request.setAttribute("user", user);
                request.setAttribute("fieldErrors", fieldErrors);
                request.setAttribute("validationError", buildValidationSummary(fieldErrors));
                request.getRequestDispatcher("admin/editStudent.jsp").forward(request, response);
                return;
            }

            student.setFirstName(request.getParameter("firstName"));
            student.setLastName(request.getParameter("lastName"));
            student.setEmail(request.getParameter("email"));
            student.setPhone(request.getParameter("phone"));
            student.setAddress(request.getParameter("address"));
            student.setDateOfBirth(Date.valueOf(request.getParameter("dob")));
            studentDAO.update(student);
            
            // Update password if provided
            String newPassword = request.getParameter("password");
            if (newPassword != null && !newPassword.isEmpty()) {
                user.setPassword(newPassword);
                userDAO.update(user);
            }
            
            response.sendRedirect("StudentServlet?action=list");
        }
    }

    private Map<String, String> validateStudentSubmission(HttpServletRequest request, boolean requirePassword) {
        Map<String, String> errors = new LinkedHashMap<>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");

        if (isBlank(username)) {
            setError(errors, "username", "Username is required.");
        } else if (!NAME_PATTERN.matcher(username.trim()).matches()) {
            setError(errors, "username", "Username must contain letters only.");
        }

        if (isBlank(firstName) || !NAME_PATTERN.matcher(firstName.trim()).matches()) {
            setError(errors, "firstName", "First name must contain letters only.");
        }

        if (isBlank(lastName) || !NAME_PATTERN.matcher(lastName.trim()).matches()) {
            setError(errors, "lastName", "Last name must contain letters only.");
        }

        if (isBlank(email) || !EMAIL_PATTERN.matcher(email.trim()).matches()) {
            setError(errors, "email", "Please enter a valid email address.");
        }

        if (isBlank(phone) || !PHONE_PATTERN.matcher(phone.trim()).matches()) {
            setError(errors, "phone", "Phone number must be exactly 10 digits.");
        }

        if (isBlank(dob)) {
            setError(errors, "dob", "Date of birth is required.");
        } else {
            try {
                Date.valueOf(dob.trim());
            } catch (IllegalArgumentException ex) {
                setError(errors, "dob", "Please enter a valid date of birth.");
            }
        }

        if (requirePassword) {
            if (isBlank(password)) {
                setError(errors, "password", "Password is required.");
            } else if (!PASSWORD_PATTERN.matcher(password).matches()) {
                setError(errors, "password", "Password must start with a capital letter and include at least one number or special character.");
            }
        } else if (!isBlank(password) && !PASSWORD_PATTERN.matcher(password.trim()).matches()) {
            setError(errors, "password", "New password must start with a capital letter and include at least one number or special character.");
        }

        return errors;
    }

    private void setError(Map<String, String> errors, String field, String message) {
        errors.put(field, message);
    }

    private String buildValidationSummary(Map<String, String> fieldErrors) {
        return String.join("<br/>", fieldErrors.values());
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
