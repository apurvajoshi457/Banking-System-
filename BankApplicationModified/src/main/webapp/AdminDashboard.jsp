<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
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

    <!-- Dashboard Content -->
    <div class="container text-center mt-5">
        <h2 class="mb-4">Banking System Dashboard</h2>
        <div class="row justify-content-center">

            <!-- Retrieve Account Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <i class="bi bi-search display-6 text-primary"></i>
                        <h5 class="card-title mt-2">Retrieve Account</h5>
                        <p class="card-text">Search and retrieve account details.</p>
                        <a href="Search.jsp" class="btn btn-primary">Search Now</a>
                    </div>
                </div>
            </div>

            <!-- Delete Account Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <i class="bi bi-trash display-6 text-danger"></i>
                        <h5 class="card-title mt-2">Delete Account</h5>
                        <p class="card-text">Remove an account from the system.</p>
                        <a href="Delete.jsp" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>

            <!-- Display Accounts Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <i class="bi bi-table display-6 text-success"></i>
                        <h5 class="card-title mt-2">Display Accounts</h5>
                        <p class="card-text">View all registered accounts.</p>
                        <a href="Display.jsp" class="btn btn-success">View Accounts</a>
                    </div>
                </div>
            </div>

            <!-- Update Account Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
                        <i class="bi bi-pencil-square display-6 text-warning"></i>
                        <h5 class="card-title mt-2">Update Account</h5>
                        <p class="card-text">Modify account information.</p>
                        <a href="Update.jsp" class="btn btn-warning text-white">Update</a>
                    </div>
                </div>
            </div>

            <!-- Logout Card -->
            <div class="col-md-4">
                <div class="card shadow-lg mb-4">
                    <div class="card-body">
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
