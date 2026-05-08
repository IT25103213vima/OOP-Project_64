package servlets;

import dao.*;
import models.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

public class LessonServlet extends HttpServlet {
    private LessonDAO lessonDAO = new LessonDAOImpl();
    private StudentDAO studentDAO = new StudentDAOImpl();
    private InstructorDAO instructorDAO = new InstructorDAOImpl();
    private VehicleDAO vehicleDAO = new VehicleDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action) || action == null) {
            List<Lesson> lessons = lessonDAO.getAll();
            request.setAttribute("lessons", lessons);
            request.setAttribute("students", studentDAO.getAll());
            request.setAttribute("instructors", instructorDAO.getAll());
            request.setAttribute("vehicles", vehicleDAO.getAll());
            request.getRequestDispatcher("admin/lessons.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Lesson lesson = lessonDAO.read(id);
            request.setAttribute("lesson", lesson);
            request.setAttribute("students", studentDAO.getAll());
            request.setAttribute("instructors", instructorDAO.getAll());
            request.setAttribute("vehicles", vehicleDAO.getAll());
            request.getRequestDispatcher("admin/editLesson.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            lessonDAO.delete(id);
            response.sendRedirect("LessonServlet?action=list");
        } else if ("add".equals(action)) {
            request.setAttribute("students", studentDAO.getAll());
            request.setAttribute("instructors", instructorDAO.getAll());
            request.setAttribute("vehicles", vehicleDAO.getAll());
            request.getRequestDispatcher("admin/addLesson.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            try {
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                int instructorId = Integer.parseInt(request.getParameter("instructorId"));
                int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
                Date lessonDate = Date.valueOf(request.getParameter("lessonDate"));
                Time lessonTime = parseLessonTime(request.getParameter("lessonTime"));
                String status = request.getParameter("status");
                String notes = request.getParameter("notes");

                Lesson lesson = new Lesson(0, studentId, instructorId, vehicleId, lessonDate, lessonTime, 0, status, notes);
                lessonDAO.create(lesson);
                System.out.println("[LessonServlet] Created lesson for studentId=" + studentId + ", instructorId=" + instructorId + ", vehicleId=" + vehicleId);
                response.sendRedirect("LessonServlet?action=list");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to add lesson: " + e.getMessage());
                // forward back to add page with error message
                request.setAttribute("students", studentDAO.getAll());
                request.setAttribute("instructors", instructorDAO.getAll());
                request.setAttribute("vehicles", vehicleDAO.getAll());
                request.getRequestDispatcher("admin/addLesson.jsp").forward(request, response);
            }
        } else if ("update".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Lesson lesson = lessonDAO.read(id);
                if (lesson == null) {
                    throw new IllegalArgumentException("Lesson with id " + id + " not found");
                }
                lesson.setStudentId(Integer.parseInt(request.getParameter("studentId")));
                lesson.setInstructorId(Integer.parseInt(request.getParameter("instructorId")));
                lesson.setVehicleId(Integer.parseInt(request.getParameter("vehicleId")));
                lesson.setLessonDate(Date.valueOf(request.getParameter("lessonDate")));
                lesson.setLessonTime(parseLessonTime(request.getParameter("lessonTime")));
                lesson.setStatus(request.getParameter("status"));
                lesson.setNotes(request.getParameter("notes"));
                lessonDAO.update(lesson);
                System.out.println("[LessonServlet] Updated lesson id=" + id);
                response.sendRedirect("LessonServlet?action=list");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to update lesson: " + e.getMessage());
                // forward back to edit page with error message
                int id = -1;
                try { id = Integer.parseInt(request.getParameter("id")); } catch (Exception ignore) {}
                request.setAttribute("lesson", lessonDAO.read(id));
                request.setAttribute("students", studentDAO.getAll());
                request.setAttribute("instructors", instructorDAO.getAll());
                request.setAttribute("vehicles", vehicleDAO.getAll());
                request.getRequestDispatcher("admin/editLesson.jsp").forward(request, response);
            }
        }
    }

    private Time parseLessonTime(String lessonTimeParam) {
        if (lessonTimeParam == null || lessonTimeParam.trim().isEmpty()) {
            return null;
        }

        String value = lessonTimeParam.trim();
        try {
            return Time.valueOf(LocalTime.parse(value, DateTimeFormatter.ofPattern("HH:mm")));
        } catch (DateTimeParseException ignored) {
            return Time.valueOf(LocalTime.parse(value, DateTimeFormatter.ofPattern("HH:mm:ss")));
        }
    }
}
