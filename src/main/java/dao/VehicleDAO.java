package dao;

import models.Vehicle;
import java.util.List;

public interface VehicleDAO {
    void create(Vehicle vehicle);
    Vehicle read(int id);
    void update(Vehicle vehicle);
    void delete(int id);
    List<Vehicle> getAll();
}
