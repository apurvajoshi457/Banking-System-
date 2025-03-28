package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDao;
import Dao.UserDaoImpl;
import Model.User;

/**
 * Servlet implementation class RechargeController
 */
@WebServlet("/RechargeController")
public class RechargeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RechargeController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if session exists
        if (session == null || session.getAttribute("accountNo") == null) {
            request.setAttribute("message", "Error: Session expired. Please log in again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String accountNo = (String) session.getAttribute("accountNo");
        String amountStr = request.getParameter("amount");

        // Validate amount input
        if (amountStr == null || amountStr.trim().isEmpty()) {
            request.setAttribute("message", "Error: Please enter a valid recharge amount.");
            request.getRequestDispatcher("Recharge.jsp").forward(request, response);
            return;
        }

        BigDecimal rechargeAmount;
        try {
            rechargeAmount = new BigDecimal(amountStr.trim());

            // Ensure positive amount
            if (rechargeAmount.compareTo(BigDecimal.ZERO) <= 0) {
                request.setAttribute("message", "Error: Recharge amount must be greater than zero.");
                request.getRequestDispatcher("Recharge.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Error: Invalid amount format.");
            request.getRequestDispatcher("Recharge.jsp").forward(request, response);
            return;
        }

        UserDao userDao = new UserDaoImpl();
        List<User> user = userDao.retriveRecord(accountNo);

        // Check if user exists
        if (user == null || user.isEmpty()) {
            request.setAttribute("message", "Error: Account not found.");
            request.getRequestDispatcher("Recharge.jsp").forward(request, response);
            return;
        }

        BigDecimal currentBalance = user.get(0).getBalance();

        // Check for sufficient balance
        if (currentBalance.compareTo(rechargeAmount) < 0) {
            request.setAttribute("message", "Error: Insufficient balance.");
            request.getRequestDispatcher("Recharge.jsp").forward(request, response);
            return;
        }

        // Deduct amount and update balance
        BigDecimal newBalance = currentBalance.subtract(rechargeAmount);
        int updateStatus = userDao.updateRecord(newBalance, accountNo);

        if (updateStatus > 0) {
            request.setAttribute("message", "Recharge successful! New balance: " + newBalance);
        } else {
            request.setAttribute("message", "Error: Recharge failed. Please try again.");
        }

        request.getRequestDispatcher("Recharge.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
