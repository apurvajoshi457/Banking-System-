package Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.UserDao;
import Dao.UserDaoImpl;
import Model.User;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
		String accountNo = request.getParameter("accountNo");  // Get account number from input field

        UserDao userDao = new UserDaoImpl();
        List<User> users = userDao.retriveRecord(accountNo);  // Corrected method name
        
        request.setAttribute("users", users);  // Use a plural key for multiple users
        RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
        dispatcher.forward(request, response);  // Forward to JSP page
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
		doGet(request, response);
	}
}
