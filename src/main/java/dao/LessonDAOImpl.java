package dao;

import models.Lesson;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class LessonDAOImpl implements LessonDAO {

    private static final String FILE_NAME = "lessons.txt";
    private static final String DELIMITER = "\\|";
    private static final String WRITE_DELIMITER = "|";

    @Override
    public void create(Lesson lesson) {
        int nextId = FileUtil.getNextId(FILE_NAME);
        lesson.setId(nextId);
        String line = lesson.getId() + WRITE_DELIMITER + lesson.getStudentId() + WRITE_DELIMITER + lesson.getInstructorId() + WRITE_DELIMITER + lesson.getVehicleId() + WRITE_DELIMITER +
                (lesson.getLessonDate() != null ? lesson.getLessonDate().toString() : "") + WRITE_DELIMITER +
                (lesson.getLessonTime() != null ? lesson.getLessonTime().toString() : "") + WRITE_DELIMITER +
                lesson.getDuration() + WRITE_DELIMITER + lesson.getStatus() + WRITE_DELIMITER + (lesson.getNotes() != null ? lesson.getNotes() : "");
        FileUtil.appendLine(FILE_NAME, line);
    }

    @Override
    public Lesson read(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(DELIMITER, -1);
            if (parts.length >= 9 && Integer.parseInt(parts[0].trim()) == id) {
                Date date = parts[4].trim().isEmpty() ? null : Date.valueOf(parts[4].trim());
                Time time = parts[5].trim().isEmpty() ? null : Time.valueOf(ensureTimeFormat(parts[5].trim()));
                return new Lesson(Integer.parseInt(parts[0].trim()), Integer.parseInt(parts[1].trim()), Integer.parseInt(parts[2].trim()), Integer.parseInt(parts[3].trim()), date, time, Integer.parseInt(parts[6].trim()), parts[7].trim(), parts[8].trim());
            }
        }
        return null;
    }

    @Override
    public void update(Lesson lesson) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(DELIMITER, -1);
            if (parts.length >= 9 && Integer.parseInt(parts[0].trim()) == lesson.getId()) {
                String newLine = lesson.getId() + WRITE_DELIMITER + lesson.getStudentId() + WRITE_DELIMITER + lesson.getInstructorId() + WRITE_DELIMITER + lesson.getVehicleId() + WRITE_DELIMITER +
                        (lesson.getLessonDate() != null ? lesson.getLessonDate().toString() : "") + WRITE_DELIMITER +
                        (lesson.getLessonTime() != null ? lesson.getLessonTime().toString() : "") + WRITE_DELIMITER +
                        lesson.getDuration() + WRITE_DELIMITER + lesson.getStatus() + WRITE_DELIMITER + (lesson.getNotes() != null ? lesson.getNotes() : "");
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
            String[] parts = line.split(DELIMITER, -1);
            if (parts.length >= 9 && Integer.parseInt(parts[0].trim()) != id) {
                updatedLines.add(line);
            }
        }
        FileUtil.writeAllLines(FILE_NAME, updatedLines);
    }

    @Override
    public List<Lesson> getAll() {
        List<Lesson> lessons = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            if (line.trim().isEmpty()) continue;
            String[] parts = line.split(DELIMITER, -1);
            if (parts.length >= 9) {
                try {
                    Date date = parts[4].trim().isEmpty() ? null : Date.valueOf(parts[4].trim());
                    Time time = parts[5].trim().isEmpty() ? null : Time.valueOf(ensureTimeFormat(parts[5].trim()));
                    lessons.add(new Lesson(Integer.parseInt(parts[0].trim()), Integer.parseInt(parts[1].trim()), Integer.parseInt(parts[2].trim()), Integer.parseInt(parts[3].trim()), date, time, Integer.parseInt(parts[6].trim()), parts[7].trim(), parts[8].trim()));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return lessons;
    }

    @Override
    public List<Lesson> getByStudentId(int studentId) {
        List<Lesson> lessons = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            if (line.trim().isEmpty()) continue;
            String[] parts = line.split(DELIMITER, -1);
            if (parts.length >= 9 && Integer.parseInt(parts[1].trim()) == studentId) {
                try {
                    Date date = parts[4].trim().isEmpty() ? null : Date.valueOf(parts[4].trim());
                    Time time = parts[5].trim().isEmpty() ? null : Time.valueOf(ensureTimeFormat(parts[5].trim()));
                    lessons.add(new Lesson(Integer.parseInt(parts[0].trim()), Integer.parseInt(parts[1].trim()), Integer.parseInt(parts[2].trim()), Integer.parseInt(parts[3].trim()), date, time, Integer.parseInt(parts[6].trim()), parts[7].trim(), parts[8].trim()));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return lessons;
    }

    @Override
    public List<Lesson> getByInstructorId(int instructorId) {
        List<Lesson> lessons = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            if (line.trim().isEmpty()) continue;
            String[] parts = line.split(DELIMITER, -1);
            if (parts.length >= 9 && Integer.parseInt(parts[2].trim()) == instructorId) {
                try {
                    Date date = parts[4].trim().isEmpty() ? null : Date.valueOf(parts[4].trim());
                    Time time = parts[5].trim().isEmpty() ? null : Time.valueOf(ensureTimeFormat(parts[5].trim()));
                    lessons.add(new Lesson(Integer.parseInt(parts[0].trim()), Integer.parseInt(parts[1].trim()), Integer.parseInt(parts[2].trim()), Integer.parseInt(parts[3].trim()), date, time, Integer.parseInt(parts[6].trim()), parts[7].trim(), parts[8].trim()));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return lessons;
    }

    private String ensureTimeFormat(String timeStr) {
        // Convert "HH:mm" to "HH:mm:ss"
        if (timeStr != null && timeStr.matches("\\d{2}:\\d{2}$")) {
            timeStr = timeStr + ":00";
        }
        return timeStr;
    }
}
