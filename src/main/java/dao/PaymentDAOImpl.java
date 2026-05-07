package dao;

import models.Payment;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAOImpl implements PaymentDAO {

    private static final String FILE_NAME = "payments.txt";

    @Override
    public void create(Payment payment) {
        int nextId = FileUtil.getNextId(FILE_NAME);
        payment.setId(nextId);
        String line = payment.getId() + "," + payment.getStudentId() + "," + payment.getAmount() + "," +
                (payment.getPaymentDate() != null ? payment.getPaymentDate().toString() : "") + "," +
                payment.getPaymentMethod() + "," + payment.getDescription();
        FileUtil.appendLine(FILE_NAME, line);
    }

    @Override
    public Payment read(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && Integer.parseInt(parts[0]) == id) {
                Date date = parts[3].isEmpty() ? null : Date.valueOf(parts[3]);
                BigDecimal amount = new BigDecimal(parts[2]);
                return new Payment(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), amount, date, parts[4], parts[5]);
            }
        }
        return null;
    }

    @Override
    public void update(Payment payment) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && Integer.parseInt(parts[0]) == payment.getId()) {
                String newLine = payment.getId() + "," + payment.getStudentId() + "," + payment.getAmount() + "," +
                        (payment.getPaymentDate() != null ? payment.getPaymentDate().toString() : "") + "," +
                        payment.getPaymentMethod() + "," + payment.getDescription();
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
            if (parts.length >= 6 && Integer.parseInt(parts[0]) != id) {
                updatedLines.add(line);
            }
        }
        FileUtil.writeAllLines(FILE_NAME, updatedLines);
    }

    @Override
    public List<Payment> getAll() {
        List<Payment> payments = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 6) {
                Date date = parts[3].isEmpty() ? null : Date.valueOf(parts[3]);
                BigDecimal amount = new BigDecimal(parts[2]);
                payments.add(new Payment(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), amount, date, parts[4], parts[5]));
            }
        }
        return payments;
    }

    @Override
    public List<Payment> getByStudentId(int studentId) {
        List<Payment> payments = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && Integer.parseInt(parts[1]) == studentId) {
                Date date = parts[3].isEmpty() ? null : Date.valueOf(parts[3]);
                BigDecimal amount = new BigDecimal(parts[2]);
                payments.add(new Payment(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), amount, date, parts[4], parts[5]));
            }
        }
        return payments;
    }
}
