package dao;

import models.Payment;
import java.util.List;

public interface PaymentDAO {
    void create(Payment payment);
    Payment read(int id);
    void update(Payment payment);
    void delete(int id);
    List<Payment> getAll();
    List<Payment> getByStudentId(int studentId);
}
