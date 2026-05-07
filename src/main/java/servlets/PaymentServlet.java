package servlets;

import dao.PaymentDAO;
import dao.PaymentDAOImpl;
import models.Payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class PaymentServlet extends HttpServlet {
    private PaymentDAO paymentDAO = new PaymentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action) || action == null) {
            List<Payment> payments = paymentDAO.getAll();
            request.setAttribute("payments", payments);
            request.getRequestDispatcher("admin/payments.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Payment payment = paymentDAO.read(id);
            request.setAttribute("payment", payment);
            request.getRequestDispatcher("admin/editPayment.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            paymentDAO.delete(id);
            response.sendRedirect("PaymentServlet?action=list");
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("admin/addPayment.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));
            String paymentMethod = request.getParameter("paymentMethod");
            String description = request.getParameter("description");

            Payment payment = new Payment(0, studentId, amount, paymentDate, paymentMethod, description);
            paymentDAO.create(payment);
            response.sendRedirect("PaymentServlet?action=list");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Payment payment = paymentDAO.read(id);
            payment.setStudentId(Integer.parseInt(request.getParameter("studentId")));
            payment.setAmount(new BigDecimal(request.getParameter("amount")));
            payment.setPaymentDate(Date.valueOf(request.getParameter("paymentDate")));
            payment.setPaymentMethod(request.getParameter("paymentMethod"));
            payment.setDescription(request.getParameter("description"));
            paymentDAO.update(payment);
            response.sendRedirect("PaymentServlet?action=list");
        }
    }
}
