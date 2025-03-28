package Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.UserDao;
import Dao.UserDaoImpl;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo"); // Get account number input
        String message = "";

        UserDao userDao = new UserDaoImpl();
        int rowsDeleted = userDao.deleterecord(accountNo); // Call delete method

        if (rowsDeleted > 0) {
            message = "Account deleted successfully!";
        } else {
            message = "Error: Account not found or could not be deleted.";
        }

        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Delete.jsp");
        dispatcher.forward(request, response);
    }
}
