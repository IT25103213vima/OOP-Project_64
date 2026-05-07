package dao;

import models.Lesson;
import java.util.List;

public interface LessonDAO {
    void create(Lesson lesson);
    Lesson read(int id);
    void update(Lesson lesson);
    void delete(int id);
    List<Lesson> getAll();
    List<Lesson> getByStudentId(int studentId);
    List<Lesson> getByInstructorId(int instructorId);
}
