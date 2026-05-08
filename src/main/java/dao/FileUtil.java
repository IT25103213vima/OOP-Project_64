package dao;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    private static final String DATA_DIR = "C:\\Users\\user\\Documents\\GitHub\\OOP-Project_64\\src\\data\\";

    private static String getIdDelimiter(String fileName) {
        return "lessons.txt".equalsIgnoreCase(fileName) ? "\\|" : ",";
    }

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
            System.err.println("[FileUtil] Failed to read " + file.getAbsolutePath() + ": " + e.getMessage());
        }
        return lines;
    }

    private static void ensureParentDir(File file) {
        File parent = file.getParentFile();
        if (parent != null && !parent.exists()) {
            boolean created = parent.mkdirs();
            if (!created && !parent.exists()) {
                System.err.println("[FileUtil] Failed to create directory: " + parent.getAbsolutePath());
            }
        }
    }

    public static synchronized void writeAllLines(String fileName, List<String> lines) {
        File file = new File(DATA_DIR + fileName);
        ensureParentDir(file);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
            System.out.println("[FileUtil] Wrote " + lines.size() + " lines to " + file.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("[FileUtil] Failed to write " + file.getAbsolutePath() + ": " + e.getMessage());
        }
    }

    public static synchronized void appendLine(String fileName, String line) {
        File file = new File(DATA_DIR + fileName);
        ensureParentDir(file);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(line);
            writer.newLine();
            System.out.println("[FileUtil] Appended line to " + file.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("[FileUtil] Failed to append to " + file.getAbsolutePath() + ": " + e.getMessage());
        }
    }

    public static synchronized int getNextId(String fileName) {
        List<String> lines = readAllLines(fileName);
        int maxId = 0;
        String delimiter = getIdDelimiter(fileName);
        for (String line : lines) {
            if (!line.trim().isEmpty()) {
                String[] parts = line.split(delimiter, -1);
                if (parts.length > 0) {
                    try {
                        int id = Integer.parseInt(parts[0].trim());
                        if (id > maxId) maxId = id;
                    } catch (NumberFormatException e) {
                        // ignore malformed id
                    }
                }
            }
        }
        return maxId + 1;
    }
}
