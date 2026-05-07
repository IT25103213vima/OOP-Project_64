package dao;

import models.User;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    private static final String FILE_NAME = "users.txt";

    @Override
    public void create(User user) {
        int nextId = FileUtil.getNextId(FILE_NAME);
        user.setId(nextId);
        String line = user.getId() + "," + user.getUsername() + "," + user.getPassword() + "," + user.getRole();
        FileUtil.appendLine(FILE_NAME, line);
    }

    @Override
    public User read(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && Integer.parseInt(parts[0]) == id) {
                return new User(Integer.parseInt(parts[0]), parts[1], parts[2], parts[3]);
            }
        }
        return null;
    }

    @Override
    public void update(User user) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && Integer.parseInt(parts[0]) == user.getId()) {
                updatedLines.add(user.getId() + "," + user.getUsername() + "," + user.getPassword() + "," + user.getRole());
            } else {
                updatedLines.add(line);
            }
        }
        FileUtil.writeAllLines(FILE_NAME, updatedLines);
    }

    @Override
    public void delete(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && Integer.parseInt(parts[0]) != id) {
                updatedLines.add(line);
            }
        }
        FileUtil.writeAllLines(FILE_NAME, updatedLines);
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 4) {
                users.add(new User(Integer.parseInt(parts[0]), parts[1], parts[2], parts[3]));
            }
        }
        return users;
    }

    @Override
    public User findByUsername(String username) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && parts[1].equals(username)) {
                return new User(Integer.parseInt(parts[0]), parts[1], parts[2], parts[3]);
            }
        }
        return null;
    }
}
