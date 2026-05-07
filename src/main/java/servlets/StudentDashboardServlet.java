package servlets;

import dao.LessonDAO;
import dao.LessonDAOImpl;
import dao.PaymentDAO;
import dao.PaymentDAOImpl;
import dao.StudentDAO;
import dao.StudentDAOImpl;
import models.Lesson;
import models.Payment;
import models.Student;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class StudentDashboardServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAOImpl();
    private LessonDAO lessonDAO = new LessonDAOImpl();
    private PaymentDAO paymentDAO = new PaymentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = studentDAO.findByUserId(user.getId());
        List<Lesson> lessons = lessonDAO.getByStudentId(student.getId());
        List<Payment> payments = paymentDAO.getByStudentId(student.getId());

        request.setAttribute("lessons", lessons);
        request.setAttribute("payments", payments);
        request.getRequestDispatcher("studentDashboard.jsp").forward(request, response);
    }
}
