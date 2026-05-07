package dao;

import models.Instructor;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class InstructorDAOImpl implements InstructorDAO {

    private static final String FILE_NAME = "instructors.txt";

    @Override
    public void create(Instructor instructor) {
        int nextId = FileUtil.getNextId(FILE_NAME);
        instructor.setId(nextId);
        String line = instructor.getId() + "," + instructor.getUserId() + "," + instructor.getFirstName() + "," + instructor.getLastName() + "," +
                instructor.getEmail() + "," + instructor.getPhone() + "," + instructor.getAddress() + "," +
                (instructor.getHireDate() != null ? instructor.getHireDate().toString() : "") + "," + instructor.getLicenseNumber();
        FileUtil.appendLine(FILE_NAME, line);
    }

    @Override
    public Instructor read(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && Integer.parseInt(parts[0]) == id) {
                Date hireDate = parts[7].isEmpty() ? null : Date.valueOf(parts[7]);
                return new Instructor(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), parts[2], parts[3], parts[4], parts[5], parts[6], hireDate, parts[8]);
            }
        }
        return null;
    }

    @Override
    public void update(Instructor instructor) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && Integer.parseInt(parts[0]) == instructor.getId()) {
                String newLine = instructor.getId() + "," + instructor.getUserId() + "," + instructor.getFirstName() + "," + instructor.getLastName() + "," +
                        instructor.getEmail() + "," + instructor.getPhone() + "," + instructor.getAddress() + "," +
                        (instructor.getHireDate() != null ? instructor.getHireDate().toString() : "") + "," + instructor.getLicenseNumber();
                updatedLines.add(newLine);
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
            if (parts.length >= 9 && Integer.parseInt(parts[0]) != id) {
                updatedLines.add(line);
            }
        }
        FileUtil.writeAllLines(FILE_NAME, updatedLines);
    }

    @Override
    public List<Instructor> getAll() {
        List<Instructor> instructors = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9) {
                Date hireDate = parts[7].isEmpty() ? null : Date.valueOf(parts[7]);
                instructors.add(new Instructor(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), parts[2], parts[3], parts[4], parts[5], parts[6], hireDate, parts[8]));
            }
        }
        return instructors;
    }

    @Override
    public Instructor findByUserId(int userId) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && Integer.parseInt(parts[1]) == userId) {
                Date hireDate = parts[7].isEmpty() ? null : Date.valueOf(parts[7]);
                return new Instructor(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), parts[2], parts[3], parts[4], parts[5], parts[6], hireDate, parts[8]);
            }
        }
        return null;
    }
}
