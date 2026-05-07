package models;

import java.sql.Date;
import java.sql.Time;

public class Lesson {
    private int id;
    private int studentId;
    private int instructorId;
    private int vehicleId;
    private Date lessonDate;
    private Time lessonTime;
    private int duration;
    private String status;
    private String notes;

    public Lesson() {}

    public Lesson(int id, int studentId, int instructorId, int vehicleId, Date lessonDate, Time lessonTime, int duration, String status, String notes) {
        this.id = id;
        this.studentId = studentId;
        this.instructorId = instructorId;
        this.vehicleId = vehicleId;
        this.lessonDate = lessonDate;
        this.lessonTime = lessonTime;
        this.duration = duration;
        this.status = status;
        this.notes = notes;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getInstructorId() { return instructorId; }
    public void setInstructorId(int instructorId) { this.instructorId = instructorId; }

    public int getVehicleId() { return vehicleId; }
    public void setVehicleId(int vehicleId) { this.vehicleId = vehicleId; }

    public Date getLessonDate() { return lessonDate; }
    public void setLessonDate(Date lessonDate) { this.lessonDate = lessonDate; }

    public Time getLessonTime() { return lessonTime; }
    public void setLessonTime(Time lessonTime) { this.lessonTime = lessonTime; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
