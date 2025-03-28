package Controller;

import java.io.IOException;
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

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String accno = request.getParameter("accno");
        String password = request.getParameter("password");

        UserDao rdao = new UserDaoImpl();
        List<User> userlist = rdao.retriveRecord(accno);

        if (userlist.isEmpty()) {  // If no user found, show error
            request.setAttribute("errorMessage", "Invalid Credentials! Please try again.");
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);
            return;
        }

        User user = userlist.get(0); // Get the first user from the list
        if (fname.equals(user.getFirstName()) &&
            mname.equals(user.getMiddleName()) &&
            lname.equals(user.getLastName()) &&
            accno.equals(user.getAccountNo()) &&
            password.equals(user.getPassword())) {

            //  Store account number in session
            HttpSession session = request.getSession(false);
            session.setAttribute("accountNo", user.getAccountNo());
            session.setAttribute("userName", user.getFirstName() + " " + user.getLastName());

            System.out.println("Login Succeeded!");
            response.sendRedirect("Dashboard.jsp"); // Redirect to Dashboard
        } else {
            request.setAttribute("errorMessage", "Invalid Credentials! Please try again.");
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
