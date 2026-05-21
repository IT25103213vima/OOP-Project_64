package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.StudentDAOImpl;
import dao.LessonDAOImpl;
import java.util.List;

public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // compute quick stats using DAOs
        try {
            StudentDAOImpl studentDAO = new StudentDAOImpl();
            LessonDAOImpl lessonDAO = new LessonDAOImpl();
            List<?> students = studentDAO.getAll();
            List<?> lessons = lessonDAO.getAll();
            int totalStudents = students != null ? students.size() : 0;
            int totalLessons = lessons != null ? lessons.size() : 0;
            request.setAttribute("totalStudents", totalStudents);
            request.setAttribute("totalLessons", totalLessons);
        } catch (Exception e) {
            // log and continue with zeros
            System.out.println("[AdminDashboardServlet] error computing stats: " + e.getMessage());
            request.setAttribute("totalStudents", 0);
            request.setAttribute("totalLessons", 0);
        }
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
