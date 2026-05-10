package servlets;

import dao.InstructorDAO;
import dao.InstructorDAOImpl;
import dao.LessonDAO;
import dao.LessonDAOImpl;
import dao.StudentDAO;
import dao.StudentDAOImpl;
import dao.VehicleDAO;
import dao.VehicleDAOImpl;
import models.Instructor;
import models.Lesson;
import models.Student;
import models.User;
import models.Vehicle;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class

InstructorDashboardServlet extends HttpServlet {
    private final InstructorDAO instructorDAO = new InstructorDAOImpl();
    private final LessonDAO lessonDAO = new LessonDAOImpl();
    private final StudentDAO studentDAO = new StudentDAOImpl();
    private final VehicleDAO vehicleDAO = new VehicleDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"instructor".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        Instructor instructor = instructorDAO.findByUserId(user.getId());
        List<Lesson> lessons = lessonDAO.getByInstructorId(instructor.getId());
        List<Student> students = studentDAO.getAll();
        List<Vehicle> vehicles = vehicleDAO.getAll();

        request.setAttribute("lessons", lessons);
        request.setAttribute("students", students);
        request.setAttribute("vehicles", vehicles);
        request.getRequestDispatcher("instructorDashboard.jsp").forward(request, response);
    }
}
