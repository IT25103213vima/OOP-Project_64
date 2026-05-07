package dao;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    private static final String DATA_DIR = "C:\\Users\\user\\Documents\\GitHub\\OOP-Project_64\\src\\data\\";

    public static synchronized List<String> readAllLines(String fileName) {
        List<String> lines = new ArrayList<>();
        File file = new File(DATA_DIR + fileName);
        if (!file.exists()) {
            return lines;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                lines.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lines;
    }

    public static synchronized void writeAllLines(String fileName, List<String> lines) {
        File file = new File(DATA_DIR + fileName);
        file.getParentFile().mkdirs();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static synchronized void appendLine(String fileName, String line) {
        File file = new File(DATA_DIR + fileName);
        file.getParentFile().mkdirs();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static synchronized int getNextId(String fileName) {
        List<String> lines = readAllLines(fileName);
        int maxId = 0;
        for (String line : lines) {
            if (!line.trim().isEmpty()) {
                String[] parts = line.split(",");
                try {
                    int id = Integer.parseInt(parts[0]);
                    if (id > maxId) maxId = id;
                } catch (NumberFormatException e) {
                    // ignore
                }
            }
        }
        return maxId + 1;
    }
}
