package servlets;

import dao.VehicleDAO;
import dao.VehicleDAOImpl;
import models.Vehicle;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class VehicleServlet extends HttpServlet {
    private VehicleDAO vehicleDAO = new VehicleDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action) || action == null) {
            List<Vehicle> vehicles = vehicleDAO.getAll();
            request.setAttribute("vehicles", vehicles);
            request.getRequestDispatcher("admin/vehicles.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Vehicle vehicle = vehicleDAO.read(id);
            request.setAttribute("vehicle", vehicle);
            request.getRequestDispatcher("admin/editVehicle.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            vehicleDAO.delete(id);
            response.sendRedirect("VehicleServlet?action=list");
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("admin/addVehicle.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String make = request.getParameter("make");
            String model = request.getParameter("model");
            int year = Integer.parseInt(request.getParameter("year"));
            String licensePlate = request.getParameter("licensePlate");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            String status = request.getParameter("status");

            Vehicle vehicle = new Vehicle(0, make, model, year, licensePlate, capacity, status);
            vehicleDAO.create(vehicle);
            response.sendRedirect("VehicleServlet?action=list");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Vehicle vehicle = vehicleDAO.read(id);
            vehicle.setMake(request.getParameter("make"));
            vehicle.setModel(request.getParameter("model"));
            vehicle.setYear(Integer.parseInt(request.getParameter("year")));
            vehicle.setLicensePlate(request.getParameter("licensePlate"));
            vehicle.setCapacity(Integer.parseInt(request.getParameter("capacity")));
            vehicle.setStatus(request.getParameter("status"));
            vehicleDAO.update(vehicle);
            response.sendRedirect("VehicleServlet?action=list");
        }
    }
}
