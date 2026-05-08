package servlets;

import dao.InstructorDAO;
import dao.InstructorDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import models.Instructor;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class InstructorServlet extends HttpServlet {
    private final InstructorDAO instructorDAO = new InstructorDAOImpl();
    private final UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action) || action == null) {
            List<Instructor> instructors = instructorDAO.getAll();
            request.setAttribute("instructors", instructors);
            request.getRequestDispatcher("admin/instructors.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Instructor instructor = instructorDAO.read(id);
            request.setAttribute("instructor", instructor);
            request.getRequestDispatcher("admin/editInstructor.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Instructor instructor = instructorDAO.read(id);
            if (instructor != null) {
                userDAO.delete(instructor.getUserId());
            }
            instructorDAO.delete(id);
            response.sendRedirect("InstructorServlet?action=list");
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("admin/addInstructor.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            // Create user first
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = new User(0, username, password, "instructor");
            userDAO.create(user);
            // Get the created user id
            User createdUser = userDAO.findByUsername(username);

            // Create instructor
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Date hireDate = new Date(System.currentTimeMillis());
            String licenseNumber = request.getParameter("licenseNumber");

            Instructor instructor = new Instructor(0, createdUser.getId(), firstName, lastName, email, phone, address, hireDate, licenseNumber);
            instructorDAO.create(instructor);
            response.sendRedirect("InstructorServlet?action=list");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Instructor instructor = instructorDAO.read(id);
            instructor.setFirstName(request.getParameter("firstName"));
            instructor.setLastName(request.getParameter("lastName"));
            instructor.setEmail(request.getParameter("email"));
            instructor.setPhone(request.getParameter("phone"));
            instructor.setAddress(request.getParameter("address"));
            instructor.setLicenseNumber(request.getParameter("licenseNumber"));
            instructorDAO.update(instructor);
            response.sendRedirect("InstructorServlet?action=list");
        }
    }
}
