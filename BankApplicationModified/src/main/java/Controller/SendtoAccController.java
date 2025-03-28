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

import Dao.UserDaoImpl;
import Model.User;

/**
 * Servlet implementation class SendtoAccController
 */
@WebServlet("/SendtoAccController")
public class SendtoAccController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendtoAccController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        String senderAccNo = (session != null) ? (String) session.getAttribute("accountNo") : null;

        if (senderAccNo == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session expired
            return;
        }

        String receiverAccNo = request.getParameter("receiverAccNo");
        String amountStr = request.getParameter("amount");

        if (receiverAccNo == null || receiverAccNo.isEmpty() || amountStr == null || amountStr.isEmpty()) {
            request.setAttribute("message", "Error: Please fill all fields.");
            request.getRequestDispatcher("SendtoAcc.jsp").forward(request, response);
            return;
        }

        BigDecimal transferAmount = new BigDecimal(amountStr);
        if (transferAmount.compareTo(BigDecimal.ZERO) <= 0) {
            request.setAttribute("message", "Error: Enter a valid amount.");
            request.getRequestDispatcher("SendtoAcc.jsp").forward(request, response);
            return;
        }

        UserDaoImpl userDao = new UserDaoImpl();
        List<User> senderList = userDao.retriveRecord(senderAccNo);
        List<User> receiverList = userDao.retriveRecord(receiverAccNo);

        if (senderList.isEmpty() || receiverList.isEmpty()) {
            request.setAttribute("message", "Error: Invalid account number.");
            request.getRequestDispatcher("SendtoAcc.jsp").forward(request, response);
            return;
        }

        User sender = senderList.get(0);
        User receiver = receiverList.get(0);

        if (sender.getBalance().compareTo(transferAmount) < 0) {
            request.setAttribute("message", "Error: Insufficient balance.");
            request.getRequestDispatcher("SendtoAcc.jsp").forward(request, response);
            return;
        }

        // Perform transaction
        BigDecimal senderNewBalance = sender.getBalance().subtract(transferAmount);
        BigDecimal receiverNewBalance = receiver.getBalance().add(transferAmount);

        int updateSender = userDao.updateRecord(senderNewBalance, senderAccNo);
        int updateReceiver = userDao.updateRecord(receiverNewBalance, receiverAccNo);

        if (updateSender > 0 && updateReceiver > 0) {
            request.setAttribute("message", "Success: Money transferred successfully.");
        } else {
            request.setAttribute("message", "Error: Transaction failed.");
        }

        request.getRequestDispatcher("SendtoAcc.jsp").forward(request, response);
	}

}
