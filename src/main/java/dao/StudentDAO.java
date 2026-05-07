package dao;

import models.Student;
import java.util.List;

public interface StudentDAO {
    void create(Student student);
    Student read(int id);
    void update(Student student);
    void delete(int id);
    List<Student> getAll();
    Student findByUserId(int userId);
}
