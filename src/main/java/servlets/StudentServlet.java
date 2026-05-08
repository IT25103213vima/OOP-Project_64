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
import java.util.List;

public class StudentServlet extends HttpServlet {
    private final StudentDAO studentDAO = new StudentDAOImpl();
    private final UserDAO userDAO = new UserDAOImpl();

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
            request.setAttribute("student", student);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            // Create user first
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = new User(0, username, password, "student");
            userDAO.create(user);
            // Get the created user id
            User createdUser = userDAO.findByUsername(username);

            // Create student
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Date dob = Date.valueOf(request.getParameter("dob"));
            Date enrollment = new Date(System.currentTimeMillis());

            Student student = new Student(0, createdUser.getId(), firstName, lastName, email, phone, address, dob, enrollment);
            studentDAO.create(student);
            response.sendRedirect("StudentServlet?action=list");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.read(id);
            student.setFirstName(request.getParameter("firstName"));
            student.setLastName(request.getParameter("lastName"));
            student.setEmail(request.getParameter("email"));
            student.setPhone(request.getParameter("phone"));
            student.setAddress(request.getParameter("address"));
            student.setDateOfBirth(Date.valueOf(request.getParameter("dob")));
            studentDAO.update(student);
            response.sendRedirect("StudentServlet?action=list");
        }
    }
}
