package dao;

import models.Student;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class StudentDAOImpl implements StudentDAO {

    private static final String FILE_NAME = "students.txt";

    @Override
    public void create(Student student) {
        int nextId = FileUtil.getNextId(FILE_NAME);
        student.setId(nextId);
        String line = student.getId() + "," + student.getUserId() + "," + student.getFirstName() + "," + student.getLastName() + "," +
                student.getEmail() + "," + student.getPhone() + "," + student.getAddress() + "," +
                (student.getDateOfBirth() != null ? student.getDateOfBirth().toString() : "") + "," +
                (student.getEnrollmentDate() != null ? student.getEnrollmentDate().toString() : "");
        FileUtil.appendLine(FILE_NAME, line);
    }

    @Override
    public Student read(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && Integer.parseInt(parts[0]) == id) {
                Date dob = parts[7].isEmpty() ? null : Date.valueOf(parts[7]);
                Date enrollment = parts[8].isEmpty() ? null : Date.valueOf(parts[8]);
                return new Student(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), parts[2], parts[3], parts[4], parts[5], parts[6], dob, enrollment);
            }
        }
        return null;
    }

    @Override
    public void update(Student student) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && Integer.parseInt(parts[0]) == student.getId()) {
                String newLine = student.getId() + "," + student.getUserId() + "," + student.getFirstName() + "," + student.getLastName() + "," +
                        student.getEmail() + "," + student.getPhone() + "," + student.getAddress() + "," +
                        (student.getDateOfBirth() != null ? student.getDateOfBirth().toString() : "") + "," +
                        (student.getEnrollmentDate() != null ? student.getEnrollmentDate().toString() : "");
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
    public List<Student> getAll() {
        List<Student> students = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9) {
                Date dob = parts[7].isEmpty() ? null : Date.valueOf(parts[7]);
                Date enrollment = parts[8].isEmpty() ? null : Date.valueOf(parts[8]);
                students.add(new Student(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), parts[2], parts[3], parts[4], parts[5], parts[6], dob, enrollment));
            }
        }
        return students;
    }

    @Override
    public Student findByUserId(int userId) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && Integer.parseInt(parts[1]) == userId) {
                Date dob = parts[7].isEmpty() ? null : Date.valueOf(parts[7]);
                Date enrollment = parts[8].isEmpty() ? null : Date.valueOf(parts[8]);
                return new Student(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), parts[2], parts[3], parts[4], parts[5], parts[6], dob, enrollment);
            }
        }
        return null;
    }
}
