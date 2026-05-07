package servlets;

import dao.InstructorDAO;
import dao.InstructorDAOImpl;
import dao.LessonDAO;
import dao.LessonDAOImpl;
import models.Instructor;
import models.Lesson;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class InstructorDashboardServlet extends HttpServlet {
    private InstructorDAO instructorDAO = new InstructorDAOImpl();
    private LessonDAO lessonDAO = new LessonDAOImpl();

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

        request.setAttribute("lessons", lessons);
        request.getRequestDispatcher("instructorDashboard.jsp").forward(request, response);
    }
}
