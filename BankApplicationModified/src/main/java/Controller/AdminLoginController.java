package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminLoginController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("test 1");

        if(username.equals("apurva")&& password.equals("123456789")) {
        	response.sendRedirect("AdminDashboard.jsp");
        }
        //System.out.println("test 2");
        else {
            request.setAttribute("errorMessage", "Invalid Credentials! Please try again.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
        
       
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
