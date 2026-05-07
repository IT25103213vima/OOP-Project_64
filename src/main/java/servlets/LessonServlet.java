package servlets;

import dao.LessonDAO;
import dao.LessonDAOImpl;
import models.Lesson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

public class LessonServlet extends HttpServlet {
    private LessonDAO lessonDAO = new LessonDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action) || action == null) {
            List<Lesson> lessons = lessonDAO.getAll();
            request.setAttribute("lessons", lessons);
            request.getRequestDispatcher("admin/lessons.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Lesson lesson = lessonDAO.read(id);
            request.setAttribute("lesson", lesson);
            request.getRequestDispatcher("admin/editLesson.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            lessonDAO.delete(id);
            response.sendRedirect("LessonServlet?action=list");
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("admin/addLesson.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int instructorId = Integer.parseInt(request.getParameter("instructorId"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
            Date lessonDate = Date.valueOf(request.getParameter("lessonDate"));
            Time lessonTime = Time.valueOf(request.getParameter("lessonTime"));
            int duration = Integer.parseInt(request.getParameter("duration"));
            String status = request.getParameter("status");
            String notes = request.getParameter("notes");

            Lesson lesson = new Lesson(0, studentId, instructorId, vehicleId, lessonDate, lessonTime, duration, status, notes);
            lessonDAO.create(lesson);
            response.sendRedirect("LessonServlet?action=list");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Lesson lesson = lessonDAO.read(id);
            lesson.setStudentId(Integer.parseInt(request.getParameter("studentId")));
            lesson.setInstructorId(Integer.parseInt(request.getParameter("instructorId")));
            lesson.setVehicleId(Integer.parseInt(request.getParameter("vehicleId")));
            lesson.setLessonDate(Date.valueOf(request.getParameter("lessonDate")));
            lesson.setLessonTime(Time.valueOf(request.getParameter("lessonTime")));
            lesson.setDuration(Integer.parseInt(request.getParameter("duration")));
            lesson.setStatus(request.getParameter("status"));
            lesson.setNotes(request.getParameter("notes"));
            lessonDAO.update(lesson);
            response.sendRedirect("LessonServlet?action=list");
        }
    }
}
