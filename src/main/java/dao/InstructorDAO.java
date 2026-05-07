package dao;

import models.Instructor;
import java.util.List;

public interface InstructorDAO {
    void create(Instructor instructor);
    Instructor read(int id);
    void update(Instructor instructor);
    void delete(int id);
    List<Instructor> getAll();
    Instructor findByUserId(int userId);
}
