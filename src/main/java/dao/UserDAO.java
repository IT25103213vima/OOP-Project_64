package dao;

import models.User;
import java.util.List;

public interface UserDAO {
    void create(User user);
    User read(int id);
    void update(User user);
    void delete(int id);
    List<User> getAll();
    User findByUsername(String username);
}
