package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.UserDao;
import Dao.UserDaoImpl;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo"); // Get account number
        String newBalanceStr = request.getParameter("newBalance"); // Get new balance input

        String message = "";
        try {
            BigDecimal newBalance = new BigDecimal(newBalanceStr); // Convert to BigDecimal

            UserDao userDao = new UserDaoImpl();
            int rowsUpdated = userDao.updateRecord(newBalance, accountNo); // Call update method

            if (rowsUpdated > 0) {
                message = "Balance updated successfully!";
            } else {
                message = "Error: Account not found or update failed.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid balance amount. Please enter a valid number.";
        }

        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
        dispatcher.forward(request, response);
    }
}
