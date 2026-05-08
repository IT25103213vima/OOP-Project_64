package models;

public class Vehicle {
    private int id;
    private String vehicleName;
    private String model;
    private int year;
    private String licensePlate;
    private String status;

    public Vehicle() {}

    public Vehicle(int id, String vehicleName, String model, int year, String licensePlate, String status) {
        this.id = id;
        this.vehicleName = vehicleName;
        this.model = model;
        this.year = year;
        this.licensePlate = licensePlate;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getVehicleName() { return vehicleName; }
    public void setVehicleName(String vehicleName) { this.vehicleName = vehicleName; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getLicensePlate() { return licensePlate; }
    public void setLicensePlate(String licensePlate) { this.licensePlate = licensePlate; }


    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
