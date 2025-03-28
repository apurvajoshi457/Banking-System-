<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Panel</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">Admin Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link text-white" href="dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="LogoutController">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Admin Panel Section -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body text-center">
                        <h3 class="text-primary"><i class="bi bi-person-badge-fill"></i> Admin Panel</h3>
                        <p class="text-muted">Manage user accounts and view details.</p>
                        
                        <form action="DisplayController" method="get">
                            <button type="submit" class="btn btn-primary w-100"><i class="bi bi-eye-fill"></i> View Account Details</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%-- Display Accounts if Available --%>
        <%
            List<User> accounts = (List<User>) request.getAttribute("accounts");
            if (accounts != null) {
        %>
            <div class="row mt-4">
                <div class="col-md-10 mx-auto">
                    <div class="card shadow border-0">
                        <div class="card-body">
                            <h4 class="text-center text-success"><i class="bi bi-table"></i> Account Details</h4>
                            <% if (!accounts.isEmpty()) { %>
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-primary">
                                            <tr>
                                                <th>First Name</th>
                                                <th>Middle Name</th>
                                                <th>Last Name</th>
                                                <th>Account No</th>
                                                <th>Account Balance</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (User user : accounts) { %>
                                                <tr>
                                                    <td><%= user.getFirstName() %></td>
                                                    <td><%= user.getMiddleName() %></td>
                                                    <td><%= user.getLastName() %></td>
                                                    <td><%= user.getAccountNo() %></td>
                                                    <td><%= user.getBalance() %></td>
                                                </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            <% } else { %>
                                <p class="text-center text-danger">No account details available.</p>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>

    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
