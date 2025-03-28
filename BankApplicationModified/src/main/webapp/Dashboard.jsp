<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String userName = (userSession != null) ? (String) userSession.getAttribute("userName") : null;
    String accountNo = (userSession != null) ? (String) userSession.getAttribute("accountNo") : null;

    if (userName == null || accountNo == null) {
        response.sendRedirect("SignIn.jsp"); // Redirect to login if session expired
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">Banking System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="LogoutController">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Message -->
    <div class="container text-center mt-4">
        <h2 class="mb-4">Welcome, <span class="text-primary"><%= userName %></span>!</h2>
        <p class="lead">Account Number: <strong><%= accountNo %></strong></p>
    </div>

    <!-- Dashboard Options -->
    <div class="container mt-4">
        <div class="row justify-content-center">

            <!-- Mobile Recharge Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body text-center">
                        <i class="bi bi-phone display-6 text-primary"></i>
                        <h5 class="card-title mt-2">Mobile Recharge</h5>
                        <p class="card-text">Recharge your mobile with ease.</p>
                        <a href="Recharge.jsp" class="btn btn-primary">Recharge Now</a>
                    </div>
                </div>
            </div>

            <!-- Money Transfer Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body text-center">
                        <i class="bi bi-send display-6 text-success"></i>
                        <h5 class="card-title mt-2">Transfer Money</h5>
                        <p class="card-text">Send money to another account.</p>
                        <a href="SendtoAcc.jsp" class="btn btn-success">Transfer</a>
                    </div>
                </div>
            </div>

            <!-- Check Balance Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body text-center">
                        <i class="bi bi-wallet2 display-6 text-warning"></i>
                        <h5 class="card-title mt-2">Check Balance</h5>
                        <p class="card-text">View your current account balance.</p>
                        <a href="Search.jsp" class="btn btn-warning text-white">Check Now</a>
                    </div>
                </div>
            </div>

            <!-- My Details Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body text-center">
                        <i class="bi bi-person-circle display-6 text-info"></i>
                        <h5 class="card-title mt-2">My Details</h5>
                        <p class="card-text">View and manage your profile details.</p>
                        <a href="Search.jsp" class="btn btn-info text-white">View Details</a>
                    </div>
                </div>
            </div>

            <!-- Logout Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body text-center">
                        <i class="bi bi-box-arrow-right display-6 text-dark"></i>
                        <h5 class="card-title mt-2">Logout</h5>
                        <p class="card-text">Sign out from your account.</p>
                        <a href="LogoutController" class="btn btn-dark">Logout</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
