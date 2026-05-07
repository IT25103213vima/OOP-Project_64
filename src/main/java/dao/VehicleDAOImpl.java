package dao;

import models.Vehicle;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAOImpl implements VehicleDAO {

    private static final String FILE_NAME = "vehicles.txt";

    @Override
    public void create(Vehicle vehicle) {
        int nextId = FileUtil.getNextId(FILE_NAME);
        vehicle.setId(nextId);
        String line = vehicle.getId() + "," + vehicle.getMake() + "," + vehicle.getModel() + "," + vehicle.getYear() + "," +
                vehicle.getLicensePlate() + "," + vehicle.getCapacity() + "," + vehicle.getStatus();
        FileUtil.appendLine(FILE_NAME, line);
    }

    @Override
    public Vehicle read(int id) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 7 && Integer.parseInt(parts[0]) == id) {
                return new Vehicle(Integer.parseInt(parts[0]), parts[1], parts[2], Integer.parseInt(parts[3]), parts[4], Integer.parseInt(parts[5]), parts[6]);
            }
        }
        return null;
    }

    @Override
    public void update(Vehicle vehicle) {
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        List<String> updatedLines = new ArrayList<>();
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 7 && Integer.parseInt(parts[0]) == vehicle.getId()) {
                String newLine = vehicle.getId() + "," + vehicle.getMake() + "," + vehicle.getModel() + "," + vehicle.getYear() + "," +
                        vehicle.getLicensePlate() + "," + vehicle.getCapacity() + "," + vehicle.getStatus();
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
            if (parts.length >= 7 && Integer.parseInt(parts[0]) != id) {
                updatedLines.add(line);
            }
        }
        FileUtil.writeAllLines(FILE_NAME, updatedLines);
    }

    @Override
    public List<Vehicle> getAll() {
        List<Vehicle> vehicles = new ArrayList<>();
        List<String> lines = FileUtil.readAllLines(FILE_NAME);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 7) {
                vehicles.add(new Vehicle(Integer.parseInt(parts[0]), parts[1], parts[2], Integer.parseInt(parts[3]), parts[4], Integer.parseInt(parts[5]), parts[6]));
            }
        }
        return vehicles;
    }
}
