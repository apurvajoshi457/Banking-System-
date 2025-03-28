package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import Model.User;
import Dao.UserDaoImpl;
import Dao.UserDao;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String accno = request.getParameter("accno");
        String password = request.getParameter("password");
        String balanceStr = request.getParameter("balance");

        List<String> errors = new ArrayList<>();

        // Name validation - only letters allowed
        String nameRegex = "^[a-zA-Z]+$"; // Allows only alphabets

        if (fname == null || fname.trim().isEmpty()) {
            errors.add("First Name is required.");
        } else if (!fname.matches(nameRegex)) {
            errors.add("First Name must contain only letters.");
        }

        if (mname != null && !mname.trim().isEmpty() && !mname.matches(nameRegex)) {
            errors.add("Middle Name must contain only letters.");
        }

        if (lname == null || lname.trim().isEmpty()) {
            errors.add("Last Name is required.");
        } else if (!lname.matches(nameRegex)) {
            errors.add("Last Name must contain only letters.");
        }

        // Account Number validation - exactly 10 digits
        if (accno == null || !accno.matches("\\d{10}")) {
            errors.add("Account Number must be exactly 10 digits.");
        }

        // Password validation - at least 6 characters
        if (password == null || password.length() < 6) {
            errors.add("Password must be at least 6 characters.");
        }

        // Balance validation - allow floating-point numbers
        BigDecimal balance = BigDecimal.ZERO;
        if (balanceStr == null || balanceStr.trim().isEmpty()) {
            errors.add("Balance is required.");
        } else if (!balanceStr.matches("\\d+(\\.\\d{1,2})?")) { // Allows numbers with up to 2 decimal places
            errors.add("Balance must be a valid number (e.g., 100 or 100.50).");
        } else {
            try {
                balance = new BigDecimal(balanceStr);
                if (balance.compareTo(BigDecimal.ZERO) < 0) {
                    errors.add("Balance cannot be negative.");
                }
            } catch (NumberFormatException e) {
                errors.add("Invalid balance. Please enter a valid amount.");
            }
        }

        // If there are validation errors, return to the registration page with errors
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SignUp.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Create User Object
        User user = new User(fname, mname, lname, accno, password, balance);
        UserDao userDao = new UserDaoImpl();
        List<User> userList = new ArrayList<>();
        userList.add(user);

        int result = userDao.createRecord(userList);

        if (result > 0) {
            request.setAttribute("successMessage", "Registration successful! Please sign in.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("SignIn.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("SignUp.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
